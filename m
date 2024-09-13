Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C274D977FB2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 14:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B77B10E081;
	Fri, 13 Sep 2024 12:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=vignesh.raman@collabora.com header.b="DpDYps18";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA4010E081
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 12:19:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1726229954; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AA0OWO+k8gJ6Wg9omSdFa5q1lTJY5LDIZnPSjAEbBkT6fTyytaw1FwtwPebjtyz5WdSP4g0pE+IYPsy/q2vQx5XmtuHR8VuSb4T8p89pQvp6QI0VfhV13ftcYEFDZ1GdCYzCzc4vkqy6UQqzh3K2yp+umTD41dShkNBHDpzQWeE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1726229954;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=cVUFU5KIUA6rufOpcTvDgHhdvtoTT7WEsa6cwDCimqs=; 
 b=X5AyFhZqmTjs+4vGcb0orUaK96tdfG/mNh1GM3fhhPI9tdpUKkituHJZTPuW3knoDJCKdHLY4a3hiTQfQE++pk2c+qL6d5aomODLlqFfp4G/BrcYctJRSXyka045knMUA8DV6w2Y5pjNCHW95pfKWhbAKsSawW9mSo4jR5T/jpg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=vignesh.raman@collabora.com;
 dmarc=pass header.from=<vignesh.raman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726229954; 
 s=zohomail; d=collabora.com; i=vignesh.raman@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=cVUFU5KIUA6rufOpcTvDgHhdvtoTT7WEsa6cwDCimqs=;
 b=DpDYps18x7sGxBrgRJyK1xEF5Kso6NMelwumV6vr05WMPd3yrovcEWiXZVWTPdzZ
 JnBDMWzCvu74n98k71VgN9Ft/nluh8EpLcL5390Xluj1uUarcjy3u7/oL/SDFjBg61+
 VbFNxBYq6QH42k0kKnzacxXzTPcUCnPKH/RcO12Y=
Received: by mx.zohomail.com with SMTPS id 1726229952619949.3254555456753;
 Fri, 13 Sep 2024 05:19:12 -0700 (PDT)
Message-ID: <a81d8d9d-8aa6-4b59-976e-5bca7c8fdaa9@collabora.com>
Date: Fri, 13 Sep 2024 17:49:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/ci: enable lockdep detection
To: Rob Clark <robdclark@gmail.com>
Cc: Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, daniels
 <daniels@collabora.com>, airlied <airlied@gmail.com>,
 daniel <daniel@ffwll.ch>, "guilherme.gallo" <guilherme.gallo@collabora.com>,
 "sergi.blanch.torne" <sergi.blanch.torne@collabora.com>,
 "deborah.brouwer" <deborah.brouwer@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20240812112030.81774-1-vignesh.raman@collabora.com>
 <191483d05a3.129198f97500814.8001634600010504645@collabora.com>
 <0a3db7dc-4533-4111-bec9-35cc68e35d83@collabora.com>
 <1914d612d8e.f2d5101b916106.3138016556910118397@collabora.com>
 <42753719-9619-45f1-b76a-8ff8d19cec22@collabora.com>
 <CAF6AEGuWHER=k-xGad-aAtOfS10R55W37FcU45phNnJpOwFhWw@mail.gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAF6AEGuWHER=k-xGad-aAtOfS10R55W37FcU45phNnJpOwFhWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob, Helen,

On 14/08/24 23:11, Rob Clark wrote:
> On Wed, Aug 14, 2024 at 2:42 AM Vignesh Raman
> <vignesh.raman@collabora.com> wrote:
>>
>> Hi Helen,
>>
>> On 14/08/24 01:44, Helen Mae Koike Fornazier wrote:
>>>
>>>
>>>
>>>
>>> ---- On Tue, 13 Aug 2024 02:26:48 -0300 Vignesh Raman  wrote ---
>>>
>>>    > Hi Helen,
>>>    >
>>>    > On 13/08/24 01:47, Helen Mae Koike Fornazier wrote:
>>>    > >
>>>    > > Hi Vignesh,
>>>    > >
>>>    > > Thanks for your patch.
>>>    > >
>>>    > >
>>>    > > ---- On Mon, 12 Aug 2024 08:20:28 -0300 Vignesh Raman  wrote ---
>>>    > >
>>>    > >   > We have enabled PROVE_LOCKING (which enables LOCKDEP) in drm-ci.
>>>    > >   > This will output warnings when kernel locking errors are encountered
>>>    > >   > and will continue executing tests. To detect if lockdep has been
>>>    > >   > triggered, check the debug_locks value in /proc/lockdep_stats after
>>>    > >   > the tests have run. When debug_locks is 0, it indicates that lockdep
>>>    > >   > has detected issues and turned itself off. So check this value and
>>>    > >   > exit with an error if lockdep is detected.
>>>    > >
>>>    > > Should we exit with an error? Or with a warning? (GitLab-CI supports that).
>>>    > > Well, I guess it is serious enough.
>>>    >
>>>    > I think we can exit with an error since we check the status at the end
>>>    > of the tests.
>>>
>>> I mean, we can exit with a specific error and configure this specific error in gitlab-ci to be a warning,
>>> so the job will be yellow and not red.
>>>
>>> But maybe the lockdep issue should be a strong error.
>>
>> Yes agree. We can exit with an error for lockdep issue instead of a warning.
> 
> I think that is too strong, lockdep can warn about things which can
> never happen in practice.  (We've never completely solved some of the
> things that lockdep complains about in runpm vs shrinker reclaim.)
> 
> Surfacing it as a warning is fine.

Will send another patch which will exit with an error if lockdep is 
detected and configure it as a warning in GitLab CI.

Regards,
Vignesh

> 
> BR,
> -R
> 
>>>
>>>    >
>>>    > >
>>>    > > Should we also track on the xfail folder? So we can annotate those errors as well?
>>>    >
>>>    > Do you mean reporting this error in expectation files?
>>>
>>> I wonder if there will be cases were we are getting this error and we should ignore it, so in the code
>>> we should check the xfail files to see if we should exit with an error or ignore it.
>>>
>>> For instance, if we have a case where we are having this error, and it is flaky, we might want to add it
>>> to the flakes file list.
>>>
>>> Maybe this is not the case, I'm just wondering.
>>
>>
>> The tests are passing but log shows lockdep warning
>> (https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/62177711).
>>
>> Moreover if the lockdep warning is emitted, lockdep will not continue to
>> run and there is no need to check this warning for each tests.
>> So added the check at the end of the tests.
>>
>>>
>>>
>>>    >
>>>    > > Did you have an entire pipeline with this? To see if everything is still green?
>>>    >
>>>    > Yes. https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/62177711
>>>    >
>>>    > This is a test branch in which I reverted a fix for the lockdep issue.
>>>    > We see 'WARNING: bad unlock balance detected!' in logs and pipeline is
>>>    > still green.
>>>
>>> But with your patch, it would red right?
>>
>> Yes it would fail and the pipeline will be red.
>>
>>> With the current patch, is the pipeline still all green?
>>
>> With this current patch, it will fail.
>> Pipeline link to show lockdep_stats before and after tests,
>> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1246721
>>
>> Regards,
>> Vignesh
>>
>>>
>>> Regards,
>>> Helen
>>>
>>>    >
>>>    > Regards,
>>>    > Vignesh
>>>    >
>>>    > >
>>>    > > Helen
>>>    > >
>>>    > >   >
>>>    > >   > Signed-off-by: Vignesh Raman vignesh.raman@collabora.com>
>>>    > >   > ---
>>>    > >   >
>>>    > >   > v1:
>>>    > >   >  - Pipeline link to show lockdep_stats before and after tests,
>>>    > >   > https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1246721
>>>    > >   >
>>>    > >   > ---
>>>    > >   >  drivers/gpu/drm/ci/igt_runner.sh | 11 +++++++++++
>>>    > >   >  1 file changed, 11 insertions(+)
>>>    > >   >
>>>    > >   > diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
>>>    > >   > index f38836ec837c..d2c043cd8c6a 100755
>>>    > >   > --- a/drivers/gpu/drm/ci/igt_runner.sh
>>>    > >   > +++ b/drivers/gpu/drm/ci/igt_runner.sh
>>>    > >   > @@ -85,6 +85,17 @@ deqp-runner junit \
>>>    > >   >  --limit 50 \
>>>    > >   >  --template "See https://$CI_PROJECT_ROOT_NAMESPACE.pages.freedesktop.org/-/$CI_PROJECT_NAME/-/jobs/$CI_JOB_ID/artifacts/results/{{testcase}}.xml"
>>>    > >   >
>>>    > >   > +# Check if /proc/lockdep_stats exists
>>>    > >   > +if [ -f /proc/lockdep_stats ]; then
>>>    > >   > +    # If debug_locks is 0, it indicates lockdep is detected and it turns itself off.
>>>    > >   > +    debug_locks=$(grep 'debug_locks:' /proc/lockdep_stats | awk '{print $2}')
>>>    > >   > +    if [ "$debug_locks" -eq 0 ]; then
>>>    > >   > +        echo "LOCKDEP issue detected. Please check dmesg logs for more information."
>>>    > >   > +        cat /proc/lockdep_stats
>>>    > >   > +        ret=1
>>>    > >   > +    fi
>>>    > >   > +fi
>>>    > >   > +
>>>    > >   >  # Store the results also in the simpler format used by the runner in ChromeOS CI
>>>    > >   >  #sed -r 's/(dmesg-warn|pass)/success/g' /results/results.txt > /results/results_simple.txt
>>>    > >   >
>>>    > >   > --
>>>    > >   > 2.43.0
>>>    > >   >
>>>    > >   >
>>>    >
