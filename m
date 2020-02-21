Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F35167E76
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 14:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DED6E2B2;
	Fri, 21 Feb 2020 13:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2DE6E2B2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:24:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2oLydSIo8UjSBiK8E0J/nuDVzO6l0NTOO+btgR7W7v5mPBq+RK9fRPjxsUxCknVqZW1S9VXrfYiaDQGpRAuzOxHSTHDCDc7tEnEEy4I77K276DAChQoJGcx0BWSEWrRXAmkki3FXWieqpmrUilWt82FkTtg+e+7lZQOvYFIvxto5vFf5RfkpTbMQDFDuoiye46zWZkGtF7aEZ9XjQ3j5BdnXCTv+Z43UICni0dHnTtTCcD9DIkRWfrD4RK+m5453EFuWQMjU6sIFEvpA/5iF7OY/VvpNbONuffQK7aJVGK9VoYlCknSGMZw5E6ysFdNGv4aNg/ZPdEh2dMOLZkIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKGZqDbHa+QR2oKqK/vAlWeAPfcgKDtrlvzHjCzThyg=;
 b=Iiuof0/XInecV8YDgX1xnSbzKmhkak9EZslMbz6qxuMPhqYl9nWOhT0NWl5nU15xeGKmloA6QkvetkvMef3BwpdQZRPSUejUxuAQzVDineyWf3qSI72LT2qlRiNCk6Zg4twZIeWTjqEXNOork5c7TR3vOtfO2INNzIPbcH9RXpmiEbLWPu+lF/t/9Psymy39zW7fDXUS7nZ+CzrAvVpesWa6zuxqydvS984bLDKENXzXLoYHiWjyr3xGyjEAtt7LMt/0u40LdL9YNxS5GotTmUm/em3A5dC9cXgcF8pK9jqNXzDryOF126VnsLlpPCtfMaQcd2ktM+MjKwj/Nlbgqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKGZqDbHa+QR2oKqK/vAlWeAPfcgKDtrlvzHjCzThyg=;
 b=S5rVjGGMkDpkyabW7E5Ny26mDlccXtho9lO3pxdK/I1E9/rra5SAWLCkJ/q1juLSLqd9+AWdhLeXlVdQztpEPGevPxa7ZmXSfhtKziwn6tKGtjlGUW+AExx4ynF5ULIGMjwtOI3NNB1s+F4SqiY+UGNwjTEecLB6M/CZY8ae4PI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (2603:10b6:4:b9::11) by
 DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.23; Fri, 21 Feb 2020 13:24:58 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904%4]) with mapi id 15.20.2750.021; Fri, 21 Feb 2020
 13:24:58 +0000
Subject: Re: [PATCH 2/8] drm/radeon: don't use ttm bo->offset
To: Luben Tuikov <luben.tuikov@amd.com>
References: <20200219135322.56463-1-nirmoy.das@amd.com>
 <20200219135322.56463-3-nirmoy.das@amd.com>
 <9e26a27b-eeaa-39b3-dacc-9f3777f3cf92@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <ceff0e39-2b74-ab61-269f-fcb4bc59f70c@amd.com>
Date: Fri, 21 Feb 2020 14:27:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <9e26a27b-eeaa-39b3-dacc-9f3777f3cf92@amd.com>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::12) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.76] (93.229.51.79) by
 FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18 via Frontend Transport; Fri, 21 Feb 2020 13:24:54 +0000
X-Originating-IP: [93.229.51.79]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3fdb0dda-f61b-4b08-801a-08d7b6d17287
X-MS-TrafficTypeDiagnostic: DM5PR12MB1753:|DM5PR12MB1753:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB17531EA18F017C69D48078438B120@DM5PR12MB1753.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0320B28BE1
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(199004)(189003)(31696002)(37006003)(52116002)(36756003)(81156014)(81166006)(6636002)(8936002)(8676002)(6666004)(6486002)(4326008)(186003)(53546011)(16576012)(316002)(16526019)(26005)(33964004)(478600001)(2906002)(956004)(6862004)(5660300002)(66946007)(66476007)(2616005)(66556008)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1753;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w19ax5b31FFW3tf8iDdPlsiHhKmEJuVVibA5TFB/5n1RIONi05sXUEOXZS7bBzq+OT57O1VPoTNPHqQTUM7kmbhLvve+JFgUrv9XrcV3rTpbIj8UDEE358X6SELUnoci3+QgDpBe4FYt2Fvpr+VCGAoN5h/ZTn2LV/Zp8XpDoZc8gHpuf4ETO9odWRt5OsbdwhSwNU6i+uCm1yTlY56OSTIWRK/p5IChS2cZo+WyyJ3t9AVkaRXpR0PrpJQ078r0R+zfpkBfC59/M6DpRQyDAYQr5ktrijFVIagmz+8fkmcKQmeXciSd2aepGlYkcd6KbEL5lUK0d05WmIVdzK3PJcaC/j1nI+ApwqIa39lyc7nR/jIqlMC6T7YTZvFOuw3h3/lG50VHFD/rWFi+jos5XOIXslk6R6cwczKeDjPAxbpYb796d9byNwQU+LHyEzjs
X-MS-Exchange-AntiSpam-MessageData: pgGLH/WkV+pGvgt/8DFJWqtvD6f9ZUwiRDLCW8g02SdZfL/44XUdJXc4VrzrXeuX4ViQLVY0NnbpbhQHiiGL+W03gubP4WQ2NDmwhpwUgFXe4cDPHtbTKKgMA7zVMHh5KA/EoUvOVDKihxYqSWXwXg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fdb0dda-f61b-4b08-801a-08d7b6d17287
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2020 13:24:58.4326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K847MCiF1j0G45UpNB+fn3dmtCxloCigtumLwJfK5Ra7jx2ENqy0/6JI+ND6ckO3ASrtNlRNcqmVZ9Jfil4ENQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1753
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1269864898=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1269864898==
Content-Type: multipart/alternative;
 boundary="------------633FBD961B13A8C06492B754"
Content-Language: en-US

--------------633FBD961B13A8C06492B754
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/21/20 2:19 AM, Luben Tuikov wrote:
> On 2020-02-19 08:53, Nirmoy Das wrote:
>> Calculate GPU offset in radeon_bo_gpu_offset without depending on
>> bo->offset
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>> Reviewed-and-tested-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/radeon/radeon.h        |  1 +
>>   drivers/gpu/drm/radeon/radeon_object.h | 16 +++++++++++++++-
>>   drivers/gpu/drm/radeon/radeon_ttm.c    |  4 +---
>>   3 files changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
>> index 30e32adc1fc6..b7c3fb2bfb54 100644
>> --- a/drivers/gpu/drm/radeon/radeon.h
>> +++ b/drivers/gpu/drm/radeon/radeon.h
>> @@ -2828,6 +2828,7 @@ extern void radeon_ttm_set_active_vram_size(struct radeon_device *rdev, u64 size
>>   extern void radeon_program_register_sequence(struct radeon_device *rdev,
>>   					     const u32 *registers,
>>   					     const u32 array_size);
>> +struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev);
>>   
>>   /*
>>    * vm
>> diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
>> index d23f2ed4126e..4d37571c7ff5 100644
>> --- a/drivers/gpu/drm/radeon/radeon_object.h
>> +++ b/drivers/gpu/drm/radeon/radeon_object.h
>> @@ -90,7 +90,21 @@ static inline void radeon_bo_unreserve(struct radeon_bo *bo)
>>    */
>>   static inline u64 radeon_bo_gpu_offset(struct radeon_bo *bo)
>>   {
>> -	return bo->tbo.offset;
>> +	struct radeon_device *rdev;
>> +	u64 start = 0;
>> +
>> +	rdev = radeon_get_rdev(bo->tbo.bdev);
>> +
>> +	switch(bo->tbo.mem.mem_type) {
> LKCS wants a space after a keyword, "switch (" .
Thanks Luben, will fix that for both radeon and amdgpu.
>
>> +	case TTM_PL_TT:
>> +		start = rdev->mc.gtt_start;
>> +		break;
>> +	case TTM_PL_VRAM:
>> +		start = rdev->mc.vram_start;
>> +		break;
>> +	}
> Could this lookup have been parameterized by "mem_type"
> to be looked up by an index (possibly "mem_type") to result
> in something new like (pseudo-code):
>       start = rdev->mc.mem_start_table[bo->tbo.mem.mem_type];
> Where "mem_start_table" is a new table holding memory starts
> of particular memories.
> Then you don't need the switch-case.

That would look good but I am afraid, amdgpu_ttm_domain_start() and 
radeon_bo_gpu_offset() will be the only consumer of /mem_start_table./

I think it is not worth to do a intrusive change for this patch series.

Regards,

Nirmoy



--------------633FBD961B13A8C06492B754
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/21/20 2:19 AM, Luben Tuikov wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:9e26a27b-eeaa-39b3-dacc-9f3777f3cf92@amd.com">
      <pre class="moz-quote-pre" wrap="">On 2020-02-19 08:53, Nirmoy Das wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Calculate GPU offset in radeon_bo_gpu_offset without depending on
bo-&gt;offset

Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@amd.com">&lt;nirmoy.das@amd.com&gt;</a>
Reviewed-and-tested-by: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
---
 drivers/gpu/drm/radeon/radeon.h        |  1 &#43;
 drivers/gpu/drm/radeon/radeon_object.h | 16 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 drivers/gpu/drm/radeon/radeon_ttm.c    |  4 &#43;---
 3 files changed, 17 insertions(&#43;), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 30e32adc1fc6..b7c3fb2bfb54 100644
--- a/drivers/gpu/drm/radeon/radeon.h
&#43;&#43;&#43; b/drivers/gpu/drm/radeon/radeon.h
@@ -2828,6 &#43;2828,7 @@ extern void radeon_ttm_set_active_vram_size(struct radeon_device *rdev, u64 size
 extern void radeon_program_register_sequence(struct radeon_device *rdev,
 					     const u32 *registers,
 					     const u32 array_size);
&#43;struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev);
 
 /*
  * vm
diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
index d23f2ed4126e..4d37571c7ff5 100644
--- a/drivers/gpu/drm/radeon/radeon_object.h
&#43;&#43;&#43; b/drivers/gpu/drm/radeon/radeon_object.h
@@ -90,7 &#43;90,21 @@ static inline void radeon_bo_unreserve(struct radeon_bo *bo)
  */
 static inline u64 radeon_bo_gpu_offset(struct radeon_bo *bo)
 {
-	return bo-&gt;tbo.offset;
&#43;	struct radeon_device *rdev;
&#43;	u64 start = 0;
&#43;
&#43;	rdev = radeon_get_rdev(bo-&gt;tbo.bdev);
&#43;
&#43;	switch(bo-&gt;tbo.mem.mem_type) {
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
LKCS wants a space after a keyword, &quot;switch (&quot; .</pre>
    </blockquote>
    Thanks Luben, will fix that for both radeon and amdgpu.<br>
    <blockquote type="cite" cite="mid:9e26a27b-eeaa-39b3-dacc-9f3777f3cf92@amd.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">&#43;	case TTM_PL_TT:
&#43;		start = rdev-&gt;mc.gtt_start;
&#43;		break;
&#43;	case TTM_PL_VRAM:
&#43;		start = rdev-&gt;mc.vram_start;
&#43;		break;
&#43;	}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Could this lookup have been parameterized by &quot;mem_type&quot;
to be looked up by an index (possibly &quot;mem_type&quot;) to result
in something new like (pseudo-code):
     start = rdev-&gt;mc.mem_start_table[bo-&gt;tbo.mem.mem_type];
Where &quot;mem_start_table&quot; is a new table holding memory starts
of particular memories.
Then you don't need the switch-case.
</pre>
    </blockquote>
    <p>That would look good but I am afraid, amdgpu_ttm_domain_start()
      and radeon_bo_gpu_offset() will be the only consumer of <i>mem_start_table.</i></p>
    <p>I think it is not worth to do a intrusive change for this patch
      series.<br>
    </p>
    <p>Regards,</p>
    <p>Nirmoy<br>
    </p>
    <p>
    </p>
    <br>
  </body>
</html>

--------------633FBD961B13A8C06492B754--

--===============1269864898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1269864898==--
