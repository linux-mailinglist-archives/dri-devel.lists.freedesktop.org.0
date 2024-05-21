Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA85C8CAD38
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 13:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB0610E0BF;
	Tue, 21 May 2024 11:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="ZKgBEFJ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1E810E0BF;
 Tue, 21 May 2024 11:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=bryoWbNN8cFi6dYEo/k2lPyQOXpLR2x/eApoa9hqlW8=;
 t=1716290432; x=1716722432; b=ZKgBEFJ9w9i55I8dBKvNlBdda3XHecq9c5maVEUJ/wTroGs
 iLTaYmXXveIXKct6DBLJ7Kt8wZyxWVhWn8tc4HifJBoNiH2SH9JKIDB23KigLHdk6nCH5M33zBQ1w
 EEV5vJJO5uOXkqvLK6tgPnyRMh6w6nREg9fgxBJrvTo18myS8dUcsPBE6chPrqAib7to3f9rHT3K3
 U3Gh8p1AupSSf1NGAjaIgfMFSQKuUSEQKdCGrQdob+paaE39+DWWrLOov3wQoiZCCQydks0SAAKu0
 JQrsY+Vz/H3ry7xDH2ovpFNUCxnoTfOGQOky18K8HbQL9AjEaW9koVa2uPAjWSyQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1s9NXZ-000357-WB; Tue, 21 May 2024 13:20:22 +0200
Message-ID: <83df4e94-e1ec-42f6-8a15-6439ef4a25b7@leemhuis.info>
Date: Tue, 21 May 2024 13:20:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mst: Fix NULL pointer dereference at
 drm_dp_add_payload_part2
To: "Limonciello, Mario" <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, "Lin, Wayne" <Wayne.Lin@amd.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 "Wentland, Harry" <Harry.Wentland@amd.com>
Cc: "lyude@redhat.com" <lyude@redhat.com>,
 "imre.deak@intel.com" <imre.deak@intel.com>,
 =?UTF-8?Q?Leon_Wei=C3=9F?= <leon.weiss@ruhr-uni-bochum.de>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240307062957.2323620-1-Wayne.Lin@amd.com>
 <0847dc03-c7db-47d7-998b-bda2e82ed442@amd.com>
 <41b87510-7abf-47e8-b28a-9ccc91bbd3c1@leemhuis.info>
 <177cfae4-b2b5-4e2c-9f1e-9ebe262ce48c@amd.com>
 <CO6PR12MB5489FA9307280A4442BAD51DFCE72@CO6PR12MB5489.namprd12.prod.outlook.com>
 <87wmo2hver.fsf@intel.com> <6f66e479-2f5a-477a-9705-dca4a3606760@amd.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <6f66e479-2f5a-477a-9705-dca4a3606760@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1716290432;
 6a53ef40; 
X-HE-SMSGID: 1s9NXZ-000357-WB
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
for once, to make this easily accessible to everyone.

Hmm, from here it looks like the patch now that it was reviewed more
that a week ago is still not even in -next. Is there a reason?

I know, we are in the merge window. But at the same time this is a fix
(that already lingered on the lists for way too long before it was
reviewed) for a regression in a somewhat recent kernel, so it in Linus
own words should be "expedited"[1].

Or are we again just missing a right person for the job in the CC?
Adding Dave and Sima just in case.

Ciao, Thorsten

[1]
https://lore.kernel.org/all/CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/

On 12.05.24 18:11, Limonciello, Mario wrote:
> On 5/10/2024 4:24 AM, Jani Nikula wrote:
>> On Fri, 10 May 2024, "Lin, Wayne" <Wayne.Lin@amd.com> wrote:
>>>> -----Original Message-----
>>>> From: Limonciello, Mario <Mario.Limonciello@amd.com>
>>>> Sent: Friday, May 10, 2024 3:18 AM
>>>> To: Linux regressions mailing list <regressions@lists.linux.dev>;
>>>> Wentland, Harry
>>>> <Harry.Wentland@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>
>>>> Cc: lyude@redhat.com; imre.deak@intel.com; Leon Weiß
>>>> <leon.weiss@ruhr-uni-
>>>> bochum.de>; stable@vger.kernel.org; dri-devel@lists.freedesktop.org;
>>>> amd-
>>>> gfx@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
>>>> Subject: Re: [PATCH] drm/mst: Fix NULL pointer dereference at
>>>> drm_dp_add_payload_part2
>>>>
>>>> On 5/9/2024 07:43, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>>> On 18.04.24 21:43, Harry Wentland wrote:
>>>>>> On 2024-03-07 01:29, Wayne Lin wrote:
>>>>>>> [Why]
>>>>>>> Commit:
>>>>>>> - commit 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload
>>>>>>> allocation/removement") accidently overwrite the commit
>>>>>>> - commit 54d217406afe ("drm: use mgr->dev in drm_dbg_kms in
>>>>>>> drm_dp_add_payload_part2") which cause regression.
>>>>>>>
>>>>>>> [How]
>>>>>>> Recover the original NULL fix and remove the unnecessary input
>>>>>>> parameter 'state' for drm_dp_add_payload_part2().
>>>>>>>
>>>>>>> Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload
>>>>>>> allocation/removement")
>>>>>>> Reported-by: Leon Weiß <leon.weiss@ruhr-uni-bochum.de>
>>>>>>> Link:
>>>>>>> https://lore.kernel.org/r/38c253ea42072cc825dc969ac4e6b9b600371cc8.c
>>>>>>> amel@ruhr-uni-bochum.de/
>>>>>>> Cc: lyude@redhat.com
>>>>>>> Cc: imre.deak@intel.com
>>>>>>> Cc: stable@vger.kernel.org
>>>>>>> Cc: regressions@lists.linux.dev
>>>>>>> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
>>>>>>
>>>>>> I haven't been deep in MST code in a while but this all looks pretty
>>>>>> straightforward and good.
>>>>>>
>>>>>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>>>>>
>>>>> Hmmm, that was three weeks ago, but it seems since then nothing
>>>>> happened to fix the linked regression through this or some other
>>>>> patch. Is there a reason? The build failure report from the CI maybe?
>>>>
>>>> It touches files outside of amd but only has an ack from AMD.  I
>>>> think we
>>>> /probably/ want an ack from i915 and nouveau to take it through.
>>>
>>> Thanks, Mario!
>>>
>>> Hi Thorsten,
>>> Yeah, like what Mario said. Would also like to have ack from i915 and
>>> nouveau.
>>
>> It usually works better if you Cc the folks you want an ack from! ;)
>>
>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>>
> 
> Thanks! Can someone with commit permissions take this to drm-misc?
> 
> 
> 
