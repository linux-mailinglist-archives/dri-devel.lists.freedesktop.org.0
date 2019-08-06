Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5CB83204
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 14:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B3C89D7C;
	Tue,  6 Aug 2019 12:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE7689D7D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 12:59:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2019 05:59:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; 
 d="scan'208,217";a="258029131"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.174.51])
 ([10.249.174.51])
 by orsmga001.jf.intel.com with ESMTP; 06 Aug 2019 05:59:28 -0700
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
To: Thomas Zimmermann <tzimmermann@suse.de>, Feng Tang <feng.tang@intel.com>
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
 <c0c3f387-dc93-3146-788c-23258b28a015@intel.com>
 <045a23ab-78f7-f363-4a2e-bf24a7a2f79e@suse.de>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <37ae41e4-455d-c18d-5c93-7df854abfef9@intel.com>
Date: Tue, 6 Aug 2019 20:59:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <045a23ab-78f7-f363-4a2e-bf24a7a2f79e@suse.de>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, michel@daenzer.net,
 dri-devel <dri-devel@lists.freedesktop.org>, lkp@01.org
Content-Type: multipart/mixed; boundary="===============0669102221=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0669102221==
Content-Type: multipart/alternative;
 boundary="------------E353EEC00DDD0B9E1D973306"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E353EEC00DDD0B9E1D973306
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 8/5/2019 6:25 PM, Thomas Zimmermann wrote:
> Hi
>
> Am 05.08.19 um 09:28 schrieb Rong Chen:
>> Hi,
>>
>> On 8/5/19 3:02 PM, Feng Tang wrote:
>>> Hi Thomas,
>>>
>>> On Sun, Aug 04, 2019 at 08:39:19PM +0200, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> I did some further analysis on this problem and found that the blinking
>>>> cursor affects performance of the vm-scalability test case.
>>>>
>>>> I only have a 4-core machine, so scalability is not really testable. Yet
>>>> I see the effects of running vm-scalibility against drm-tip, a revert of
>>>> the mgag200 patch and the vmap fixes that I posted a few days ago.
>>>>
>>>> After reverting the mgag200 patch, running the test as described in the
>>>> report
>>>>
>>>>     bin/lkp run job.yaml
>>>>
>>>> gives results like
>>>>
>>>>     2019-08-02 19:34:37  ./case-anon-cow-seq-hugetlb
>>>>     2019-08-02 19:34:37  ./usemem --runtime 300 -n 4 --prealloc
>>>> --prefault
>>>>       -O -U 815395225
>>>>     917319627 bytes / 756534 usecs = 1184110 KB/s
>>>>     917319627 bytes / 764675 usecs = 1171504 KB/s
>>>>     917319627 bytes / 766414 usecs = 1168846 KB/s
>>>>     917319627 bytes / 777990 usecs = 1151454 KB/s
>>>>
>>>> Running the test against current drm-tip gives slightly worse results,
>>>> such as.
>>>>
>>>>     2019-08-03 19:17:06  ./case-anon-cow-seq-hugetlb
>>>>     2019-08-03 19:17:06  ./usemem --runtime 300 -n 4 --prealloc
>>>> --prefault
>>>>       -O -U 815394406
>>>>     917318700 bytes / 871607 usecs = 1027778 KB/s
>>>>     917318700 bytes / 894173 usecs = 1001840 KB/s
>>>>     917318700 bytes / 919694 usecs = 974040 KB/s
>>>>     917318700 bytes / 923341 usecs = 970193 KB/s
>>>>
>>>> The test puts out roughly one result per second. Strangely sending the
>>>> output to /dev/null can make results significantly worse.
>>>>
>>>>     bin/lkp run job.yaml > /dev/null
>>>>
>>>>     2019-08-03 19:23:04  ./case-anon-cow-seq-hugetlb
>>>>     2019-08-03 19:23:04  ./usemem --runtime 300 -n 4 --prealloc
>>>> --prefault
>>>>       -O -U 815394406
>>>>     917318700 bytes / 1207358 usecs = 741966 KB/s
>>>>     917318700 bytes / 1210456 usecs = 740067 KB/s
>>>>     917318700 bytes / 1216572 usecs = 736346 KB/s
>>>>     917318700 bytes / 1239152 usecs = 722929 KB/s
>>>>
>>>> I realized that there's still a blinking cursor on the screen, which I
>>>> disabled with
>>>>
>>>>     tput civis
>>>>
>>>> or alternatively
>>>>
>>>>     echo 0 > /sys/devices/virtual/graphics/fbcon/cursor_blink
>>>>
>>>> Running the the test now gives the original or even better results,
>>>> such as
>>>>
>>>>     bin/lkp run job.yaml > /dev/null
>>>>
>>>>     2019-08-03 19:29:17  ./case-anon-cow-seq-hugetlb
>>>>     2019-08-03 19:29:17  ./usemem --runtime 300 -n 4 --prealloc
>>>> --prefault
>>>>       -O -U 815394406
>>>>     917318700 bytes / 659419 usecs = 1358497 KB/s
>>>>     917318700 bytes / 659658 usecs = 1358005 KB/s
>>>>     917318700 bytes / 659916 usecs = 1357474 KB/s
>>>>     917318700 bytes / 660168 usecs = 1356956 KB/s
>>>>
>>>> Rong, Feng, could you confirm this by disabling the cursor or blinking?
>>> Glad to know this method restored the drop. Rong is running the case.
>> I set "echo 0 > /sys/devices/virtual/graphics/fbcon/cursor_blink" for
>> both commits,
>> and the regression has no obvious change.
> Ah, I see. Thank you for testing. There are two questions that come to
> my mind: did you send the regular output to /dev/null? And what happens
> if you disable the cursor with 'tput civis'?

I didn't send the output to /dev/null because we need to collect data 
from the output,
Actually we run the benchmark as a background process, do we need to 
disable the cursor and test again?

Best Regards,
Rong Chen

>
> If there is absolutely nothing changing on the screen, I don't see how
> the regression could persist.
>
> Best regards
> Thomas
>
>
>> commit:
>>    f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer console
>>    90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic
>> framebuffer emulation
>>
>> f1f8555dfb9a70a2  90f479ae51afa45efab97afdde testcase/testparams/testbox
>> ----------------  -------------------------- ---------------------------
>>           %stddev      change         %stddev
>>               \          |                \
>>       43394             -20%      34575 ±  3%
>> vm-scalability/performance-300s-8T-anon-cow-seq-hugetlb/lkp-knm01
>>       43393             -20%      34575        GEO-MEAN
>> vm-scalability.median
>>
>> Best Regards,
>> Rong Chen
>>
>>> While I have another finds, as I noticed your patch changed the bpp from
>>> 24 to 32, I had a patch to change it back to 24, and run the case in
>>> the weekend, the -18% regrssion was reduced to about -5%. Could this
>>> be related?
>>>
>>> commit:
>>>     f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer console
>>>     90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic
>>> framebuffer emulation
>>>     01e75fea0d5 mgag200: restore the depth back to 24
>>>
>>> f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9 01e75fea0d5ff39d3e588c20ec5
>>> ---------------- --------------------------- ---------------------------
>>>        43921 ±  2%     -18.3%      35884            -4.8%
>>> 41826        vm-scalability.median
>>>     14889337           -17.5%   12291029            -4.1%
>>> 14278574        vm-scalability.throughput
>>>    commit 01e75fea0d5ff39d3e588c20ec52e7a4e6588a74
>>> Author: Feng Tang <feng.tang@intel.com>
>>> Date:   Fri Aug 2 15:09:19 2019 +0800
>>>
>>>       mgag200: restore the depth back to 24
>>>            Signed-off-by: Feng Tang <feng.tang@intel.com>
>>>
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c
>>> b/drivers/gpu/drm/mgag200/mgag200_main.c
>>> index a977333..ac8f6c9 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>>> @@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev,
>>> unsigned long flags)
>>>        if (IS_G200_SE(mdev) && mdev->mc.vram_size < (2048*1024))
>>>            dev->mode_config.preferred_depth = 16;
>>>        else
>>> -        dev->mode_config.preferred_depth = 32;
>>> +        dev->mode_config.preferred_depth = 24;
>>>        dev->mode_config.prefer_shadow = 1;
>>>          r = mgag200_modeset_init(mdev);
>>>
>>> Thanks,
>>> Feng
>>>
>>>> The difference between mgag200's original fbdev support and generic
>>>> fbdev emulation is generic fbdev's worker task that updates the VRAM
>>>> buffer from the shadow buffer. mgag200 does this immediately, but relies
>>>> on drm_can_sleep(), which is deprecated.
>>>>
>>>> I think that the worker task interferes with the test case, as the
>>>> worker has been in fbdev emulation since forever and no performance
>>>> regressions have been reported so far.
>>>>
>>>>
>>>> So unless there's a report where this problem happens in a real-world
>>>> use case, I'd like to keep code as it is. And apparently there's always
>>>> the workaround of disabling the cursor blinking.
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>
> _______________________________________________
> LKP mailing list
> LKP@lists.01.org
> https://lists.01.org/mailman/listinfo/lkp


--------------E353EEC00DDD0B9E1D973306
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi,<br>
    <br>
    <div class="moz-cite-prefix">On 8/5/2019 6:25 PM, Thomas Zimmermann
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:045a23ab-78f7-f363-4a2e-bf24a7a2f79e@suse.de">
      <pre class="moz-quote-pre" wrap="">Hi

Am 05.08.19 um 09:28 schrieb Rong Chen:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi,

On 8/5/19 3:02 PM, Feng Tang wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi Thomas,

On Sun, Aug 04, 2019 at 08:39:19PM +0200, Thomas Zimmermann wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Hi

I did some further analysis on this problem and found that the blinking
cursor affects performance of the vm-scalability test case.

I only have a 4-core machine, so scalability is not really testable. Yet
I see the effects of running vm-scalibility against drm-tip, a revert of
the mgag200 patch and the vmap fixes that I posted a few days ago.

After reverting the mgag200 patch, running the test as described in the
report

   bin/lkp run job.yaml

gives results like

   2019-08-02 19:34:37  ./case-anon-cow-seq-hugetlb
   2019-08-02 19:34:37  ./usemem --runtime 300 -n 4 --prealloc
--prefault
     -O -U 815395225
   917319627 bytes / 756534 usecs = 1184110 KB/s
   917319627 bytes / 764675 usecs = 1171504 KB/s
   917319627 bytes / 766414 usecs = 1168846 KB/s
   917319627 bytes / 777990 usecs = 1151454 KB/s

Running the test against current drm-tip gives slightly worse results,
such as.

   2019-08-03 19:17:06  ./case-anon-cow-seq-hugetlb
   2019-08-03 19:17:06  ./usemem --runtime 300 -n 4 --prealloc
--prefault
     -O -U 815394406
   917318700 bytes / 871607 usecs = 1027778 KB/s
   917318700 bytes / 894173 usecs = 1001840 KB/s
   917318700 bytes / 919694 usecs = 974040 KB/s
   917318700 bytes / 923341 usecs = 970193 KB/s

The test puts out roughly one result per second. Strangely sending the
output to /dev/null can make results significantly worse.

   bin/lkp run job.yaml &gt; /dev/null

   2019-08-03 19:23:04  ./case-anon-cow-seq-hugetlb
   2019-08-03 19:23:04  ./usemem --runtime 300 -n 4 --prealloc
--prefault
     -O -U 815394406
   917318700 bytes / 1207358 usecs = 741966 KB/s
   917318700 bytes / 1210456 usecs = 740067 KB/s
   917318700 bytes / 1216572 usecs = 736346 KB/s
   917318700 bytes / 1239152 usecs = 722929 KB/s

I realized that there's still a blinking cursor on the screen, which I
disabled with

   tput civis

or alternatively

   echo 0 &gt; /sys/devices/virtual/graphics/fbcon/cursor_blink

Running the the test now gives the original or even better results,
such as

   bin/lkp run job.yaml &gt; /dev/null

   2019-08-03 19:29:17  ./case-anon-cow-seq-hugetlb
   2019-08-03 19:29:17  ./usemem --runtime 300 -n 4 --prealloc
--prefault
     -O -U 815394406
   917318700 bytes / 659419 usecs = 1358497 KB/s
   917318700 bytes / 659658 usecs = 1358005 KB/s
   917318700 bytes / 659916 usecs = 1357474 KB/s
   917318700 bytes / 660168 usecs = 1356956 KB/s

Rong, Feng, could you confirm this by disabling the cursor or blinking?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Glad to know this method restored the drop. Rong is running the case.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I set "echo 0 &gt; /sys/devices/virtual/graphics/fbcon/cursor_blink" for
both commits,
and the regression has no obvious change.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Ah, I see. Thank you for testing. There are two questions that come to
my mind: did you send the regular output to /dev/null? And what happens
if you disable the cursor with 'tput civis'?</pre>
    </blockquote>
    <br>
    I didn't send the output to /dev/null because we need to collect
    data from the output,<br>
    Actually we run the benchmark as a background process, do we need to
    disable the cursor and test again?<br>
    <br>
    Best Regards,<br>
    Rong Chen<br>
    <br>
    <blockquote type="cite"
      cite="mid:045a23ab-78f7-f363-4a2e-bf24a7a2f79e@suse.de">
      <pre class="moz-quote-pre" wrap="">

If there is absolutely nothing changing on the screen, I don't see how
the regression could persist.

Best regards
Thomas


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">commit:
  f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer console
  90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic
framebuffer emulation

f1f8555dfb9a70a2  90f479ae51afa45efab97afdde testcase/testparams/testbox
----------------  -------------------------- ---------------------------
         %stddev      change         %stddev
             \          |                \
     43394             -20%      34575 ±  3%
vm-scalability/performance-300s-8T-anon-cow-seq-hugetlb/lkp-knm01
     43393             -20%      34575        GEO-MEAN
vm-scalability.median

Best Regards,
Rong Chen

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
While I have another finds, as I noticed your patch changed the bpp from
24 to 32, I had a patch to change it back to 24, and run the case in
the weekend, the -18% regrssion was reduced to about -5%. Could this
be related?

commit:
   f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer console
   90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic
framebuffer emulation
   01e75fea0d5 mgag200: restore the depth back to 24

f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9 01e75fea0d5ff39d3e588c20ec5
---------------- --------------------------- ---------------------------
      43921 ±  2%     -18.3%      35884            -4.8%     
41826        vm-scalability.median
   14889337           -17.5%   12291029            -4.1%  
14278574        vm-scalability.throughput
  commit 01e75fea0d5ff39d3e588c20ec52e7a4e6588a74
Author: Feng Tang <a class="moz-txt-link-rfc2396E" href="mailto:feng.tang@intel.com">&lt;feng.tang@intel.com&gt;</a>
Date:   Fri Aug 2 15:09:19 2019 +0800

     mgag200: restore the depth back to 24
          Signed-off-by: Feng Tang <a class="moz-txt-link-rfc2396E" href="mailto:feng.tang@intel.com">&lt;feng.tang@intel.com&gt;</a>

diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c
b/drivers/gpu/drm/mgag200/mgag200_main.c
index a977333..ac8f6c9 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev,
unsigned long flags)
      if (IS_G200_SE(mdev) &amp;&amp; mdev-&gt;mc.vram_size &lt; (2048*1024))
          dev-&gt;mode_config.preferred_depth = 16;
      else
-        dev-&gt;mode_config.preferred_depth = 32;
+        dev-&gt;mode_config.preferred_depth = 24;
      dev-&gt;mode_config.prefer_shadow = 1;
        r = mgag200_modeset_init(mdev);

Thanks,
Feng

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
The difference between mgag200's original fbdev support and generic
fbdev emulation is generic fbdev's worker task that updates the VRAM
buffer from the shadow buffer. mgag200 does this immediately, but relies
on drm_can_sleep(), which is deprecated.

I think that the worker task interferes with the test case, as the
worker has been in fbdev emulation since forever and no performance
regressions have been reported so far.


So unless there's a report where this problem happens in a real-world
use case, I'd like to keep code as it is. And apparently there's always
the workaround of disabling the cursor blinking.

Best regards
Thomas

</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
LKP mailing list
<a class="moz-txt-link-abbreviated" href="mailto:LKP@lists.01.org">LKP@lists.01.org</a>
<a class="moz-txt-link-freetext" href="https://lists.01.org/mailman/listinfo/lkp">https://lists.01.org/mailman/listinfo/lkp</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------E353EEC00DDD0B9E1D973306--

--===============0669102221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0669102221==--
