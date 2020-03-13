Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7F01849B2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 15:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADB16EBDE;
	Fri, 13 Mar 2020 14:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id E9D1E6EBDA;
 Fri, 13 Mar 2020 14:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 0670B2A6042;
 Fri, 13 Mar 2020 15:42:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id YMwZCfx1y4py; Fri, 13 Mar 2020 15:42:40 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 28E1F2A6016;
 Fri, 13 Mar 2020 15:42:40 +0100 (CET)
Received: from [::1] by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jClWJ-000DB3-8t; Fri, 13 Mar 2020 15:42:39 +0100
Subject: Re: [PATCH] drm/amd/display: Fix pageflip event race condition for
 DCN. (v2)
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>
References: <20200305212044.3857-1-mario.kleiner.de@gmail.com>
 <CADnq5_PoEbgyQ1a+DMkSpTkN2QHHEpHie53Wxo7eRktsKxKs7Q@mail.gmail.com>
 <cd4b7cfd-1fec-db5a-ded1-65e89b14ea35@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <41ab0520-e29a-b6ed-bf5e-fbdf1eec0ceb@daenzer.net>
Date: Fri, 13 Mar 2020 15:42:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <cd4b7cfd-1fec-db5a-ded1-65e89b14ea35@amd.com>
Content-Type: multipart/mixed; boundary="------------0571CA10ACE11B9B063102F6"
Content-Language: en-CA
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------0571CA10ACE11B9B063102F6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 2020-03-13 1:35 p.m., Kazlauskas, Nicholas wrote:
> On 2020-03-12 10:32 a.m., Alex Deucher wrote:
>> On Thu, Mar 5, 2020 at 4:21 PM Mario Kleiner
>> <mario.kleiner.de@gmail.com> wrote:
>>>
>>> Commit '16f17eda8bad ("drm/amd/display: Send vblank and user
>>> events at vsartup for DCN")' introduces a new way of pageflip
>>> completion handling for DCN, and some trouble.
>>>
>>> The current implementation introduces a race condition, which
>>> can cause pageflip completion events to be sent out one vblank
>>> too early, thereby confusing userspace and causing flicker:
>>>
>>> prepare_flip_isr():
>>>
>>> 1. Pageflip programming takes the ddev->event_lock.
>>> 2. Sets acrtc->pflip_status == AMDGPU_FLIP_SUBMITTED
>>> 3. Releases ddev->event_lock.
>>>
>>> --> Deadline for surface address regs double-buffering passes on
>>>      target pipe.
>>>
>>> 4. dc_commit_updates_for_stream() MMIO programs the new pageflip
>>>     into hw, but too late for current vblank.
>>>
>>> => pflip_status == AMDGPU_FLIP_SUBMITTED, but flip won't complete
>>>     in current vblank due to missing the double-buffering deadline
>>>     by a tiny bit.
>>>
>>> 5. VSTARTUP trigger point in vblank is reached, VSTARTUP irq fires,
>>>     dm_dcn_crtc_high_irq() gets called.
>>>
>>> 6. Detects pflip_status == AMDGPU_FLIP_SUBMITTED and assumes the
>>>     pageflip has been completed/will complete in this vblank and
>>>     sends out pageflip completion event to userspace and resets
>>>     pflip_status = AMDGPU_FLIP_NONE.
>>>
>>> => Flip completion event sent out one vblank too early.
>>>
>>> This behaviour has been observed during my testing with measurement
>>> hardware a couple of time.
>>>
>>> The commit message says that the extra flip event code was added to
>>> dm_dcn_crtc_high_irq() to prevent missing to send out pageflip events
>>> in case the pflip irq doesn't fire, because the "DCH HUBP" component
>>> is clock gated and doesn't fire pflip irqs in that state. Also that
>>> this clock gating may happen if no planes are active. According to
>>> Nicholas, the clock gating can also happen if psr is active, and the
>>> gating is controlled independently by the hardware, so difficult to
>>> detect if and when the completion code in above commit is needed.
>>>
>>> This patch tries the following solution: It only executes the extra
>>> pflip
>>> completion code in dm_dcn_crtc_high_irq() iff the hardware reports
>>> that there aren't any surface updated pending in the double-buffered
>>> surface scanout address registers. Otherwise it leaves pflip completion
>>> to the pflip irq handler, for a more race-free experience.
>>>
>>> This would only guard against the order of events mentioned above.
>>> If Step 5 (VSTARTUP trigger) happens before step 4 then this won't help
>>> at all, because 1-3 + 5 might happen even without the hw being
>>> programmed
>>> at all, ie. no surface update pending because none yet programmed
>>> into hw.
>>>
>>> Therefore this patch also changes locking in amdgpu_dm_commit_planes(),
>>> so that prepare_flip_isr() and dc_commit_updates_for_stream() are done
>>> under event_lock protection within the same critical section.
>>>
>>> v2: Take Nicholas comments into account, try a different solution.
>>>
>>> Lightly tested on Polaris (locking) and Raven (the whole DCN stuff).
>>> Seems to work without causing obvious new trouble.
>>
>> Nick, any comments on this?  Can we get this committed or do you think
>> it needs additional rework?
>>
>> Thanks,
>>
>> Alex
> 
> Hi Alex, Mario,
> 
> This might be a little strange, but if we want to get this in as a fix
> for regressions caused by the original vblank and user events at
> vstartup patch then I'm actually going to give my reviewed by on the
> *v1* of this patch (but not this v2):
> 
> Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> 
> You can feel free to apply that one.
> 
> Reason 1: After having thought about it some more I don't think we
> enable anything today that has hubp powered down at the same time we
> expect to be waiting for a flip - eg. DMCU powering down HUBP during PSR
> entry. Static screen interrupt should happen after that flip finishes I
> think.
> 
> The CRTC can still be powered on with zero planes, and I don't think any
> userspace explicitly asks for vblank events in this case but it doesn't
> hurt to have the check.
> 
> Reason 2: This new patch will need much more thorough testing from side
> to fully understand the consequences of locking the entire DC commit
> sequence. For just a page flip that sounds fine, but for anything more
> than (eg. full updates, modesets, etc) I don't think we want to be
> disabling interrupts for potentially many milliseconds.

Ah! I was wondering where the attached splat comes from, but I think
this explains it: With this patch amdgpu_dm_commit_planes keeps the
pcrtc->dev->event_lock spinlock locked while calling
dc_commit_updates_for_stream, which ends up calling
smu_set_display_count, which tries to lock a mutex.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer

--------------0571CA10ACE11B9B063102F6
Content-Type: text/plain; charset=UTF-8;
 name="kern.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="kern.txt"

TWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40NjY5OTldW1QzNDc2MDFd
IEJVRzogc2NoZWR1bGluZyB3aGlsZSBhdG9taWM6IFhvcmcvMzQ3NjAxLzB4MDAwMDAwMDIK
TWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40NjcwMDRdW1QzNDc2MDFd
IE1vZHVsZXMgbGlua2VkIGluOiBmdXNlKEUpIHh0X2Nvbm50cmFjayhFKSB4dF9NQVNRVUVS
QURFKEUpIG5mX2Nvbm50cmFja19uZXRsaW5rKEUpIHhmcm1fdXNlcihFKSB4ZnJtX2FsZ28o
RSkgbmZ0X2NvdW50ZXIoRSkgeHRfYWRkcnR5cGUoRSkgbmZ0X2NvbXBhdChFKSBuZnRfY2hh
aW5fbmF0KEUpIG5mX25hdChFKSBuZl9jb25udHJhY2soRSkgbmZfZGVmcmFnX2lwdjYoRSkg
bmZfZGVmcmFnX2lwdjQoRSkgbGliY3JjMzJjKEUpIG5mX3RhYmxlcyhFKSBuZm5ldGxpbmso
RSkgYnJfbmV0ZmlsdGVyKEUpIGJyaWRnZShFKSBzdHAoRSkgbGxjKEUpIG92ZXJsYXkoRSkg
cmZraWxsKEUpIGNwdWZyZXFfcG93ZXJzYXZlKEUpIGNwdWZyZXFfdXNlcnNwYWNlKEUpIGNw
dWZyZXFfY29uc2VydmF0aXZlKEUpIGVkYWNfbWNlX2FtZChFKSBrdm1fYW1kKEUpIGJpbmZt
dF9taXNjKEUpIHNuZF9oZGFfY29kZWNfcmVhbHRlayhFKSBrdm0oRSkgc25kX2hkYV9jb2Rl
Y19nZW5lcmljKEUpIGlycWJ5cGFzcyhFKSBwcGRldihFKSBhbWRncHUoRSkgd21pX2Jtb2Yo
RSkgbGVkdHJpZ19hdWRpbyhFKSBubHNfYXNjaWkoRSkgbmxzX2NwNDM3KEUpIHNuZF9oZGFf
Y29kZWNfaGRtaShFKSB2ZmF0KEUpIGdwdV9zY2hlZChFKSBmYXQoRSkgY3JjdDEwZGlmX3Bj
bG11bChFKSBzbmRfaGRhX2ludGVsKEUpIHR0bShFKSBzbmRfaW50ZWxfZHNwY2ZnKEUpIGNy
YzMyX3BjbG11bChFKSBzbmRfaGRhX2NvZGVjKEUpIGRybV9rbXNfaGVscGVyKEUpIHNuZF9o
ZGFfY29yZShFKSBjZWMoRSkgc25kX2h3ZGVwKEUpIGdoYXNoX2NsbXVsbmlfaW50ZWwoRSkg
c25kX3BjbShFKSByY19jb3JlKEUpIHI4MTY5KEUpIHNuZF90aW1lcihFKSBhZXNuaV9pbnRl
bChFKSBkcm0oRSkgZWZpX3BzdG9yZShFKSBzcDUxMDBfdGNvKEUpIGNjcChFKSBjcnlwdG9f
c2ltZChFKSByZWFsdGVrKEUpIHNuZChFKSBpMmNfYWxnb19iaXQoRSkgd2F0Y2hkb2coRSkK
TWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40NjcwNDNdW1QzNDc2MDFd
ICBjcnlwdGQoRSkgbWZkX2NvcmUoRSkgZ2x1ZV9oZWxwZXIoRSkgcGNzcGtyKEUpIGVmaXZh
cnMoRSkgc2coRSkgcGFycG9ydF9wYyhFKSBsaWJwaHkoRSkgazEwdGVtcChFKSBzb3VuZGNv
cmUoRSkgcm5nX2NvcmUoRSkgaTJjX3BpaXg0KEUpIHBhcnBvcnQoRSkgd21pKEUpIGJ1dHRv
bihFKSBhY3BpX2NwdWZyZXEoRSkgdGNwX2JicihFKSBzY2hfZnEoRSkgbmN0Njc3NShFKSBo
d21vbl92aWQoRSkgc3VucnBjKEUpIGVmaXZhcmZzKEUpIGlwX3RhYmxlcyhFKSB4X3RhYmxl
cyhFKSBhdXRvZnM0KEUpIGV4dDQoRSkgY3JjMzJjX2dlbmVyaWMoRSkgY3JjMTYoRSkgbWJj
YWNoZShFKSBqYmQyKEUpIGRtX21vZChFKSByYWlkMTAoRSkgcmFpZDEoRSkgcmFpZDAoRSkg
bXVsdGlwYXRoKEUpIGxpbmVhcihFKSBtZF9tb2QoRSkgc2RfbW9kKEUpIGV2ZGV2KEUpIGhp
ZF9nZW5lcmljKEUpIHVzYmhpZChFKSBoaWQoRSkgeGhjaV9wY2koRSkgYWhjaShFKSBsaWJh
aGNpKEUpIHhoY2lfaGNkKEUpIGNyYzMyY19pbnRlbChFKSBsaWJhdGEoRSkgdXNiY29yZShF
KSBzY3NpX21vZChFKSBncGlvX2FtZHB0KEUpIGdwaW9fZ2VuZXJpYyhFKQpNYXIgMTMgMTI6
NDQ6NDkga2F2ZXJpIGtlcm5lbDogWzE2NzI4LjQ2NzA3N11bVDM0NzYwMV0gUHJlZW1wdGlv
biBkaXNhYmxlZCBhdDoKTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40
NjcwODBdW1QzNDc2MDFdIFs8MDAwMDAwMDAwMDAwMDAwMD5dIDB4MApNYXIgMTMgMTI6NDQ6
NDkga2F2ZXJpIGtlcm5lbDogWzE2NzI4LjQ2NzA4NF1bVDM0NzYwMV0gQ1BVOiA3IFBJRDog
MzQ3NjAxIENvbW06IFhvcmcgVGFpbnRlZDogRyAgICAgICAgICAgIEUgICAgIDUuNS44KyAj
MjgKTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40NjcwODZdW1QzNDc2
MDFdIEhhcmR3YXJlIG5hbWU6IE1pY3JvLVN0YXIgSW50ZXJuYXRpb25hbCBDby4sIEx0ZC4g
TVMtN0EzNC9CMzUwIFRPTUFIQVdLIChNUy03QTM0KSwgQklPUyAxLk9SIDExLzI5LzIwMTkK
TWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40NjcwODhdW1QzNDc2MDFd
IENhbGwgVHJhY2U6Ck1hciAxMyAxMjo0NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3MjguNDY3
MDk2XVtUMzQ3NjAxXSAgZHVtcF9zdGFjaysweDY2LzB4OTAKTWFyIDEzIDEyOjQ0OjQ5IGth
dmVyaSBrZXJuZWw6IFsxNjcyOC40NjcxMDFdW1QzNDc2MDFdICBfX3NjaGVkdWxlX2J1Zy5j
b2xkKzB4OGUvMHg5YgpNYXIgMTMgMTI6NDQ6NDkga2F2ZXJpIGtlcm5lbDogWzE2NzI4LjQ2
NzEwNl1bVDM0NzYwMV0gIF9fc2NoZWR1bGUrMHg2M2MvMHg3OTAKTWFyIDEzIDEyOjQ0OjQ5
IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40NjcxMTBdW1QzNDc2MDFdICBzY2hlZHVsZSsweDQ2
LzB4ZjAKTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40NjcxMTJdW1Qz
NDc2MDFdICBzY2hlZHVsZV9wcmVlbXB0X2Rpc2FibGVkKzB4MTQvMHgyMApNYXIgMTMgMTI6
NDQ6NDkga2F2ZXJpIGtlcm5lbDogWzE2NzI4LjQ2NzExNV1bVDM0NzYwMV0gIF9fbXV0ZXhf
bG9jay5pc3JhLjArMHgxNzgvMHg1MjAKTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6
IFsxNjcyOC40NjcyMDddW1QzNDc2MDFdICBzbXVfc2V0X2Rpc3BsYXlfY291bnQrMHgyMS8w
eDYwIFthbWRncHVdCk1hciAxMyAxMjo0NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3MjguNDY3
MjkxXVtUMzQ3NjAxXSAgcHBfbnZfc2V0X2Rpc3BsYXlfY291bnQrMHgyMy8weDQwIFthbWRn
cHVdCk1hciAxMyAxMjo0NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3MjguNDY3Mzc1XVtUMzQ3
NjAxXSAgZGNuMl91cGRhdGVfY2xvY2tzKzB4NTk3LzB4NjUwIFthbWRncHVdCk1hciAxMyAx
Mjo0NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3MjguNDY3NDYwXVtUMzQ3NjAxXSAgZGNuMjBf
cHJlcGFyZV9iYW5kd2lkdGgrMHgzMi8weDcwIFthbWRncHVdCk1hciAxMyAxMjo0NDo0OSBr
YXZlcmkga2VybmVsOiBbMTY3MjguNDY3NTQxXVtUMzQ3NjAxXSAgZGNfY29tbWl0X3VwZGF0
ZXNfZm9yX3N0cmVhbSsweGVlNC8weDE1ZDAgW2FtZGdwdV0KTWFyIDEzIDEyOjQ0OjQ5IGth
dmVyaSBrZXJuZWw6IFsxNjcyOC40Njc2MjNdW1QzNDc2MDFdICBhbWRncHVfZG1fYXRvbWlj
X2NvbW1pdF90YWlsKzB4MTIxMC8weDIxMzAgW2FtZGdwdV0KTWFyIDEzIDEyOjQ0OjQ5IGth
dmVyaSBrZXJuZWw6IFsxNjcyOC40Njc2MzJdW1QzNDc2MDFdICA/IGtmcmVlKzB4MTk2LzB4
MmIwCk1hciAxMyAxMjo0NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3MjguNDY3NjQ5XVtUMzQ3
NjAxXSAgY29tbWl0X3RhaWwrMHg5NC8weDEzMCBbZHJtX2ttc19oZWxwZXJdCk1hciAxMyAx
Mjo0NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3MjguNDY3NjU4XVtUMzQ3NjAxXSAgZHJtX2F0
b21pY19oZWxwZXJfY29tbWl0KzB4MTEzLzB4MTQwIFtkcm1fa21zX2hlbHBlcl0KTWFyIDEz
IDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40Njc2ODJdW1QzNDc2MDFdICBkcm1f
bW9kZV9vYmpfc2V0X3Byb3BlcnR5X2lvY3RsKzB4MTE1LzB4MmQwIFtkcm1dCk1hciAxMyAx
Mjo0NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3MjguNDY3Njk5XVtUMzQ3NjAxXSAgPyBkcm1f
bW9kZV9vYmpfZmluZF9wcm9wX2lkKzB4NDAvMHg0MCBbZHJtXQpNYXIgMTMgMTI6NDQ6NDkg
a2F2ZXJpIGtlcm5lbDogWzE2NzI4LjQ2NzcxMV1bVDM0NzYwMV0gIGRybV9pb2N0bF9rZXJu
ZWwrMHhhYS8weGYwIFtkcm1dCk1hciAxMyAxMjo0NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3
MjguNDY3NzI0XVtUMzQ3NjAxXSAgZHJtX2lvY3RsKzB4MjA4LzB4MzkwIFtkcm1dCk1hciAx
MyAxMjo0NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3MjguNDY3NzM3XVtUMzQ3NjAxXSAgPyBk
cm1fbW9kZV9vYmpfZmluZF9wcm9wX2lkKzB4NDAvMHg0MCBbZHJtXQpNYXIgMTMgMTI6NDQ6
NDkga2F2ZXJpIGtlcm5lbDogWzE2NzI4LjQ2Nzc0Ml1bVDM0NzYwMV0gID8gcHJlZW1wdF9j
b3VudF9zdWIrMHg5Yi8weGQwCk1hciAxMyAxMjo0NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3
MjguNDY3NzkzXVtUMzQ3NjAxXSAgYW1kZ3B1X2RybV9pb2N0bCsweDQ5LzB4ODAgW2FtZGdw
dV0KTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40Njc3OTldW1QzNDc2
MDFdICBkb192ZnNfaW9jdGwrMHg0NWYvMHg2ZDAKTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBr
ZXJuZWw6IFsxNjcyOC40Njc4MDNdW1QzNDc2MDFdICBrc3lzX2lvY3RsKzB4NWUvMHg5MApN
YXIgMTMgMTI6NDQ6NDkga2F2ZXJpIGtlcm5lbDogWzE2NzI4LjQ2NzgwNl1bVDM0NzYwMV0g
IF9feDY0X3N5c19pb2N0bCsweDE2LzB4MjAKTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJu
ZWw6IFsxNjcyOC40Njc4MTFdW1QzNDc2MDFdICBkb19zeXNjYWxsXzY0KzB4NWYvMHgyMDAK
TWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40Njc4MTZdW1QzNDc2MDFd
ICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0NC8weGE5Ck1hciAxMyAxMjo0
NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3MjguNDY3ODE5XVtUMzQ3NjAxXSBSSVA6IDAwMzM6
MHg3ZjAyM2Q3OTI0OTcKTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40
Njc4MjJdW1QzNDc2MDFdIENvZGU6IDAwIDAwIDkwIDQ4IDhiIDA1IGY5IDc5IDBjIDAwIDY0
IGM3IDAwIDI2IDAwIDAwIDAwIDQ4IGM3IGMwIGZmIGZmIGZmIGZmIGMzIDY2IDJlIDBmIDFm
IDg0IDAwIDAwIDAwIDAwIDAwIGI4IDEwIDAwIDAwIDAwIDBmIDA1IDw0OD4gM2QgMDEgZjAg
ZmYgZmYgNzMgMDEgYzMgNDggOGIgMGQgYzkgNzkgMGMgMDAgZjcgZDggNjQgODkgMDEgNDgK
TWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40Njc4MjRdW1QzNDc2MDFd
IFJTUDogMDAyYjowMDAwN2ZmZDc3M2UwMzQ4IEVGTEFHUzogMDAwMDAyNDYgT1JJR19SQVg6
IDAwMDAwMDAwMDAwMDAwMTAKTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcy
OC40Njc4MjddW1QzNDc2MDFdIFJBWDogZmZmZmZmZmZmZmZmZmZkYSBSQlg6IDAwMDA3ZmZk
NzczZTAzODAgUkNYOiAwMDAwN2YwMjNkNzkyNDk3Ck1hciAxMyAxMjo0NDo0OSBrYXZlcmkg
a2VybmVsOiBbMTY3MjguNDY3ODI5XVtUMzQ3NjAxXSBSRFg6IDAwMDA3ZmZkNzczZTAzODAg
UlNJOiAwMDAwMDAwMGMwMTg2NGJhIFJESTogMDAwMDAwMDAwMDAwMDAwZApNYXIgMTMgMTI6
NDQ6NDkga2F2ZXJpIGtlcm5lbDogWzE2NzI4LjQ2NzgzMF1bVDM0NzYwMV0gUkJQOiAwMDAw
MDAwMGMwMTg2NGJhIFIwODogMDAwMDAwMDAwMDAwMDA1YyBSMDk6IDAwMDAwMDAwY2NjY2Nj
Y2MKTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40Njc4MzJdW1QzNDc2
MDFdIFIxMDogMDAwMDU1ZmJjYzhhNmJkNCBSMTE6IDAwMDAwMDAwMDAwMDAyNDYgUjEyOiAw
MDAwNTVmYmNiNzE5OWIwCk1hciAxMyAxMjo0NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3Mjgu
NDY3ODM0XVtUMzQ3NjAxXSBSMTM6IDAwMDAwMDAwMDAwMDAwMGQgUjE0OiAwMDAwMDAwMDAw
MDAwMDAwIFIxNTogMDAwMDAwMDAwMDAwMGZmZgpNYXIgMTMgMTI6NDQ6NDkga2F2ZXJpIGtl
cm5lbDogWzE2NzI4LjQ3NzcyM11bVDM0NzYwMV0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBd
LS0tLS0tLS0tLS0tCk1hciAxMyAxMjo0NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3MjguNDc3
NzI4XVtUMzQ3NjAxXSBERUJVR19MT0NLU19XQVJOX09OKHZhbCA+IHByZWVtcHRfY291bnQo
KSkKTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40Nzc3MzldW1QzNDc2
MDFdIFdBUk5JTkc6IENQVTogNyBQSUQ6IDM0NzYwMSBhdCBrZXJuZWwvc2NoZWQvY29yZS5j
OjM4MTYgcHJlZW1wdF9jb3VudF9zdWIrMHg3MC8weGQwCk1hciAxMyAxMjo0NDo0OSBrYXZl
cmkga2VybmVsOiBbMTY3MjguNDc3NzQzXVtUMzQ3NjAxXSBNb2R1bGVzIGxpbmtlZCBpbjog
ZnVzZShFKSB4dF9jb25udHJhY2soRSkgeHRfTUFTUVVFUkFERShFKSBuZl9jb25udHJhY2tf
bmV0bGluayhFKSB4ZnJtX3VzZXIoRSkgeGZybV9hbGdvKEUpIG5mdF9jb3VudGVyKEUpIHh0
X2FkZHJ0eXBlKEUpIG5mdF9jb21wYXQoRSkgbmZ0X2NoYWluX25hdChFKSBuZl9uYXQoRSkg
bmZfY29ubnRyYWNrKEUpIG5mX2RlZnJhZ19pcHY2KEUpIG5mX2RlZnJhZ19pcHY0KEUpIGxp
YmNyYzMyYyhFKSBuZl90YWJsZXMoRSkgbmZuZXRsaW5rKEUpIGJyX25ldGZpbHRlcihFKSBi
cmlkZ2UoRSkgc3RwKEUpIGxsYyhFKSBvdmVybGF5KEUpIHJma2lsbChFKSBjcHVmcmVxX3Bv
d2Vyc2F2ZShFKSBjcHVmcmVxX3VzZXJzcGFjZShFKSBjcHVmcmVxX2NvbnNlcnZhdGl2ZShF
KSBlZGFjX21jZV9hbWQoRSkga3ZtX2FtZChFKSBiaW5mbXRfbWlzYyhFKSBzbmRfaGRhX2Nv
ZGVjX3JlYWx0ZWsoRSkga3ZtKEUpIHNuZF9oZGFfY29kZWNfZ2VuZXJpYyhFKSBpcnFieXBh
c3MoRSkgcHBkZXYoRSkgYW1kZ3B1KEUpIHdtaV9ibW9mKEUpIGxlZHRyaWdfYXVkaW8oRSkg
bmxzX2FzY2lpKEUpIG5sc19jcDQzNyhFKSBzbmRfaGRhX2NvZGVjX2hkbWkoRSkgdmZhdChF
KSBncHVfc2NoZWQoRSkgZmF0KEUpIGNyY3QxMGRpZl9wY2xtdWwoRSkgc25kX2hkYV9pbnRl
bChFKSB0dG0oRSkgc25kX2ludGVsX2RzcGNmZyhFKSBjcmMzMl9wY2xtdWwoRSkgc25kX2hk
YV9jb2RlYyhFKSBkcm1fa21zX2hlbHBlcihFKSBzbmRfaGRhX2NvcmUoRSkgY2VjKEUpIHNu
ZF9od2RlcChFKSBnaGFzaF9jbG11bG5pX2ludGVsKEUpIHNuZF9wY20oRSkgcmNfY29yZShF
KSByODE2OShFKSBzbmRfdGltZXIoRSkgYWVzbmlfaW50ZWwoRSkgZHJtKEUpIGVmaV9wc3Rv
cmUoRSkgc3A1MTAwX3RjbyhFKSBjY3AoRSkgY3J5cHRvX3NpbWQoRSkgcmVhbHRlayhFKSBz
bmQoRSkgaTJjX2FsZ29fYml0KEUpIHdhdGNoZG9nKEUpCk1hciAxMyAxMjo0NDo0OSBrYXZl
cmkga2VybmVsOiBbMTY3MjguNDc3NzgwXVtUMzQ3NjAxXSAgY3J5cHRkKEUpIG1mZF9jb3Jl
KEUpIGdsdWVfaGVscGVyKEUpIHBjc3BrcihFKSBlZml2YXJzKEUpIHNnKEUpIHBhcnBvcnRf
cGMoRSkgbGlicGh5KEUpIGsxMHRlbXAoRSkgc291bmRjb3JlKEUpIHJuZ19jb3JlKEUpIGky
Y19waWl4NChFKSBwYXJwb3J0KEUpIHdtaShFKSBidXR0b24oRSkgYWNwaV9jcHVmcmVxKEUp
IHRjcF9iYnIoRSkgc2NoX2ZxKEUpIG5jdDY3NzUoRSkgaHdtb25fdmlkKEUpIHN1bnJwYyhF
KSBlZml2YXJmcyhFKSBpcF90YWJsZXMoRSkgeF90YWJsZXMoRSkgYXV0b2ZzNChFKSBleHQ0
KEUpIGNyYzMyY19nZW5lcmljKEUpIGNyYzE2KEUpIG1iY2FjaGUoRSkgamJkMihFKSBkbV9t
b2QoRSkgcmFpZDEwKEUpIHJhaWQxKEUpIHJhaWQwKEUpIG11bHRpcGF0aChFKSBsaW5lYXIo
RSkgbWRfbW9kKEUpIHNkX21vZChFKSBldmRldihFKSBoaWRfZ2VuZXJpYyhFKSB1c2JoaWQo
RSkgaGlkKEUpIHhoY2lfcGNpKEUpIGFoY2koRSkgbGliYWhjaShFKSB4aGNpX2hjZChFKSBj
cmMzMmNfaW50ZWwoRSkgbGliYXRhKEUpIHVzYmNvcmUoRSkgc2NzaV9tb2QoRSkgZ3Bpb19h
bWRwdChFKSBncGlvX2dlbmVyaWMoRSkKTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6
IFsxNjcyOC40Nzc4MDldW1QzNDc2MDFdIENQVTogNyBQSUQ6IDM0NzYwMSBDb21tOiBYb3Jn
IFRhaW50ZWQ6IEcgICAgICAgIFcgICBFICAgICA1LjUuOCsgIzI4Ck1hciAxMyAxMjo0NDo0
OSBrYXZlcmkga2VybmVsOiBbMTY3MjguNDc3ODExXVtUMzQ3NjAxXSBIYXJkd2FyZSBuYW1l
OiBNaWNyby1TdGFyIEludGVybmF0aW9uYWwgQ28uLCBMdGQuIE1TLTdBMzQvQjM1MCBUT01B
SEFXSyAoTVMtN0EzNCksIEJJT1MgMS5PUiAxMS8yOS8yMDE5Ck1hciAxMyAxMjo0NDo0OSBr
YXZlcmkga2VybmVsOiBbMTY3MjguNDc3ODE0XVtUMzQ3NjAxXSBSSVA6IDAwMTA6cHJlZW1w
dF9jb3VudF9zdWIrMHg3MC8weGQwCk1hciAxMyAxMjo0NDo0OSBrYXZlcmkga2VybmVsOiBb
MTY3MjguNDc3ODE3XVtUMzQ3NjAxXSBDb2RlOiA2YyA1YiA1ZCBjMyBlOCAxMSBjNCAzNyAw
MCA4NSBjMCA3NCBmNCA4YiAxNSBmNyBkOSAyNyAwMSA4NSBkMiA3NSBlYSA0OCBjNyBjNiBh
NSBmOSBjYiA5NCA0OCBjNyBjNyBlNSBiNyBjYSA5NCBlOCAyMiBmYyBmYyBmZiA8MGY+IDBi
IGViIGQzIDQ4IDhiIDZjIDI0IDEwIDQ4IDg5IGVmIGU4IGRmIGU0IDAyIDAwIDg1IGMwIDc0
IDA5IDMxCk1hciAxMyAxMjo0NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3MjguNDc3ODE5XVtU
MzQ3NjAxXSBSU1A6IDAwMTg6ZmZmZmEzOTNhNjFkNzkyOCBFRkxBR1M6IDAwMDEwMjgyCk1h
ciAxMyAxMjo0NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3MjguNDc3ODIxXVtUMzQ3NjAxXSBS
QVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiAwMDAwMDAwMDAwMDAwMDAxIFJDWDogMDAwMDAw
MDAwMDAwMDAwMApNYXIgMTMgMTI6NDQ6NDkga2F2ZXJpIGtlcm5lbDogWzE2NzI4LjQ3Nzgy
M11bVDM0NzYwMV0gUkRYOiAwMDAwMDAwMDAwMDAwMDAxIFJTSTogMDAwMDAwMDAwMDAwMDAw
MCBSREk6IDAwMDAwMDAwMDAwMDAyNDYKTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6
IFsxNjcyOC40Nzc4MjRdW1QzNDc2MDFdIFJCUDogZmZmZmEzOTNhNjFkN2MzOCBSMDg6IDAw
MDAwMDAwMDAwMDAwMDEgUjA5OiAwMDAwMDAwMDAwMDAwMDJhCk1hciAxMyAxMjo0NDo0OSBr
YXZlcmkga2VybmVsOiBbMTY3MjguNDc3ODI2XVtUMzQ3NjAxXSBSMTA6IGZmZmZmZmZmOTU0
NjU2OTAgUjExOiAwMDAwMDAwMDk1NDY1MmQzIFIxMjogZmZmZjhhYjEzYmFmMjkxOApNYXIg
MTMgMTI6NDQ6NDkga2F2ZXJpIGtlcm5lbDogWzE2NzI4LjQ3NzgyOF1bVDM0NzYwMV0gUjEz
OiBmZmZmOGFhZTEzZWE2NDAwIFIxNDogZmZmZjhhYjEzYmFlMDAwMCBSMTU6IGZmZmY4YWIx
M2UxNGM4MDAKTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40Nzc4MzBd
W1QzNDc2MDFdIEZTOiAgMDAwMDdmMDIzZDFjYjk0MCgwMDAwKSBHUzpmZmZmOGFiMTRlOWMw
MDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKTWFyIDEzIDEyOjQ0OjQ5IGthdmVy
aSBrZXJuZWw6IFsxNjcyOC40Nzc4MzJdW1QzNDc2MDFdIENTOiAgMDAxMCBEUzogMDAwMCBF
UzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBr
ZXJuZWw6IFsxNjcyOC40Nzc4MzNdW1QzNDc2MDFdIENSMjogMDAwMDdmZmEyOTAwYjU0YyBD
UjM6IDAwMDAwMDAzYTQzNDAwMDAgQ1I0OiAwMDAwMDAwMDAwMzQwNmUwCk1hciAxMyAxMjo0
NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3MjguNDc3ODM1XVtUMzQ3NjAxXSBDYWxsIFRyYWNl
OgpNYXIgMTMgMTI6NDQ6NDkga2F2ZXJpIGtlcm5lbDogWzE2NzI4LjQ3Nzg0Ml1bVDM0NzYw
MV0gIF9yYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSsweDIwLzB4NDAKTWFyIDEzIDEyOjQ0
OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40Nzc5MzVdW1QzNDc2MDFdICBhbWRncHVfZG1f
YXRvbWljX2NvbW1pdF90YWlsKzB4MWVlMy8weDIxMzAgW2FtZGdwdV0KTWFyIDEzIDEyOjQ0
OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40Nzc5NDRdW1QzNDc2MDFdICA/IGtmcmVlKzB4
MTk2LzB4MmIwCk1hciAxMyAxMjo0NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3MjguNDc3OTYx
XVtUMzQ3NjAxXSAgY29tbWl0X3RhaWwrMHg5NC8weDEzMCBbZHJtX2ttc19oZWxwZXJdCk1h
ciAxMyAxMjo0NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3MjguNDc3OTcwXVtUMzQ3NjAxXSAg
ZHJtX2F0b21pY19oZWxwZXJfY29tbWl0KzB4MTEzLzB4MTQwIFtkcm1fa21zX2hlbHBlcl0K
TWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40Nzc5OTBdW1QzNDc2MDFd
ICBkcm1fbW9kZV9vYmpfc2V0X3Byb3BlcnR5X2lvY3RsKzB4MTE1LzB4MmQwIFtkcm1dCk1h
ciAxMyAxMjo0NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3MjguNDc4MDA4XVtUMzQ3NjAxXSAg
PyBkcm1fbW9kZV9vYmpfZmluZF9wcm9wX2lkKzB4NDAvMHg0MCBbZHJtXQpNYXIgMTMgMTI6
NDQ6NDkga2F2ZXJpIGtlcm5lbDogWzE2NzI4LjQ3ODAyMF1bVDM0NzYwMV0gIGRybV9pb2N0
bF9rZXJuZWwrMHhhYS8weGYwIFtkcm1dCk1hciAxMyAxMjo0NDo0OSBrYXZlcmkga2VybmVs
OiBbMTY3MjguNDc4MDMzXVtUMzQ3NjAxXSAgZHJtX2lvY3RsKzB4MjA4LzB4MzkwIFtkcm1d
Ck1hciAxMyAxMjo0NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3MjguNDc4MDQ3XVtUMzQ3NjAx
XSAgPyBkcm1fbW9kZV9vYmpfZmluZF9wcm9wX2lkKzB4NDAvMHg0MCBbZHJtXQpNYXIgMTMg
MTI6NDQ6NDkga2F2ZXJpIGtlcm5lbDogWzE2NzI4LjQ3ODA1MV1bVDM0NzYwMV0gID8gcHJl
ZW1wdF9jb3VudF9zdWIrMHg5Yi8weGQwCk1hciAxMyAxMjo0NDo0OSBrYXZlcmkga2VybmVs
OiBbMTY3MjguNDc4MTAyXVtUMzQ3NjAxXSAgYW1kZ3B1X2RybV9pb2N0bCsweDQ5LzB4ODAg
W2FtZGdwdV0KTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40NzgxMDhd
W1QzNDc2MDFdICBkb192ZnNfaW9jdGwrMHg0NWYvMHg2ZDAKTWFyIDEzIDEyOjQ0OjQ5IGth
dmVyaSBrZXJuZWw6IFsxNjcyOC40NzgxMTJdW1QzNDc2MDFdICBrc3lzX2lvY3RsKzB4NWUv
MHg5MApNYXIgMTMgMTI6NDQ6NDkga2F2ZXJpIGtlcm5lbDogWzE2NzI4LjQ3ODExNV1bVDM0
NzYwMV0gIF9feDY0X3N5c19pb2N0bCsweDE2LzB4MjAKTWFyIDEzIDEyOjQ0OjQ5IGthdmVy
aSBrZXJuZWw6IFsxNjcyOC40NzgxMTldW1QzNDc2MDFdICBkb19zeXNjYWxsXzY0KzB4NWYv
MHgyMDAKTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40NzgxMjJdW1Qz
NDc2MDFdICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0NC8weGE5Ck1hciAx
MyAxMjo0NDo0OSBrYXZlcmkga2VybmVsOiBbMTY3MjguNDc4MTI1XVtUMzQ3NjAxXSBSSVA6
IDAwMzM6MHg3ZjAyM2Q3OTI0OTcKTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsx
NjcyOC40NzgxMjhdW1QzNDc2MDFdIENvZGU6IDAwIDAwIDkwIDQ4IDhiIDA1IGY5IDc5IDBj
IDAwIDY0IGM3IDAwIDI2IDAwIDAwIDAwIDQ4IGM3IGMwIGZmIGZmIGZmIGZmIGMzIDY2IDJl
IDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIGI4IDEwIDAwIDAwIDAwIDBmIDA1IDw0OD4gM2Qg
MDEgZjAgZmYgZmYgNzMgMDEgYzMgNDggOGIgMGQgYzkgNzkgMGMgMDAgZjcgZDggNjQgODkg
MDEgNDgKTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40NzgxMzBdW1Qz
NDc2MDFdIFJTUDogMDAyYjowMDAwN2ZmZDc3M2UwMzQ4IEVGTEFHUzogMDAwMDAyNDYgT1JJ
R19SQVg6IDAwMDAwMDAwMDAwMDAwMTAKTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6
IFsxNjcyOC40NzgxMzJdW1QzNDc2MDFdIFJBWDogZmZmZmZmZmZmZmZmZmZkYSBSQlg6IDAw
MDA3ZmZkNzczZTAzODAgUkNYOiAwMDAwN2YwMjNkNzkyNDk3Ck1hciAxMyAxMjo0NDo0OSBr
YXZlcmkga2VybmVsOiBbMTY3MjguNDc4MTM0XVtUMzQ3NjAxXSBSRFg6IDAwMDA3ZmZkNzcz
ZTAzODAgUlNJOiAwMDAwMDAwMGMwMTg2NGJhIFJESTogMDAwMDAwMDAwMDAwMDAwZApNYXIg
MTMgMTI6NDQ6NDkga2F2ZXJpIGtlcm5lbDogWzE2NzI4LjQ3ODEzNl1bVDM0NzYwMV0gUkJQ
OiAwMDAwMDAwMGMwMTg2NGJhIFIwODogMDAwMDAwMDAwMDAwMDA1YyBSMDk6IDAwMDAwMDAw
Y2NjY2NjY2MKTWFyIDEzIDEyOjQ0OjQ5IGthdmVyaSBrZXJuZWw6IFsxNjcyOC40NzgxMzdd
W1QzNDc2MDFdIFIxMDogMDAwMDU1ZmJjYzhhNmJkNCBSMTE6IDAwMDAwMDAwMDAwMDAyNDYg
UjEyOiAwMDAwNTVmYmNiNzE5OWIwCk1hciAxMyAxMjo0NDo0OSBrYXZlcmkga2VybmVsOiBb
MTY3MjguNDc4MTM5XVtUMzQ3NjAxXSBSMTM6IDAwMDAwMDAwMDAwMDAwMGQgUjE0OiAwMDAw
MDAwMDAwMDAwMDAwIFIxNTogMDAwMDAwMDAwMDAwMGZmZgpNYXIgMTMgMTI6NDQ6NDkga2F2
ZXJpIGtlcm5lbDogWzE2NzI4LjQ3ODE0M11bVDM0NzYwMV0gLS0tWyBlbmQgdHJhY2UgZTE5
MDliNWFhOTRkYTU5ZSBdLS0tCg==
--------------0571CA10ACE11B9B063102F6
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--------------0571CA10ACE11B9B063102F6--
