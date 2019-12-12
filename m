Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9768211D0D1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 16:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AAE89BEC;
	Thu, 12 Dec 2019 15:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5A089BEC;
 Thu, 12 Dec 2019 15:20:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUVzH5SNKljoyIuFSGBTFAuzHqcgZA839ABjRS47PEHPJTrjL84ub0F72qqdJrS+hi/P91yLGIyVWjEr5Y6c+Chmz0rx2+Ke/Yt42D2PHE2B0nyUBeLlDHVbvX9+v7azeFu2wmsvcQDBZcque/+q6jekCg0qW+if0DZfEyT14k93WRR50cM1ulG9S4Z+mWXkjJc9U3r8NjMGukRWM3vjpvjWK9/gFIwmD6g8+vwVDosXFiIiaYgIAK64Rbacl/CGuVP18QDb9O6UtZ2sJWA8gbn8jEhQCuJso0RUxnnGAhvKJ+nsPFFaeVx+h6V3KmBQy23KgB15C0odDqrE69y02g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvmhn2m2+mcHTkDODqje7D02hV+6jnDqAEW/H18RHYg=;
 b=edVSqbTQbW8nKgVJB/atdzPObKU3pQppIbcQ2DVHSsd8KeYIKuZsKbPngtBSooU9KQolA1w4b15vVx4e3I2e7B6pK5LfjP+vtxjhcJVI1ZYwysDlYF7dE8WSkJMLT7Vna5+ySNg+B+8GczpULy4g2+3Qls6fpm0seKAi7Q8HXfJVpM2qxCcd0piIbeXs6uQKs0FEMYm4fTcxQ5y+V2CRjkQ8F2p8WKmJGQ4DU5Jm83jRgAgV+UxwSTEG5QLxrtjOtkPxJRFnon67qy9atCTFHTz7TGcYB7gOpabQ5puUaFC5vaKPtPhn1BfaJwu+4Eu7ULD5kUiA2D79xSkMT0xcqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvmhn2m2+mcHTkDODqje7D02hV+6jnDqAEW/H18RHYg=;
 b=hvX6L1ktTwa4mOoNtOnd5fH3qkQa0eDIy90iZHavWsdT7QflZyIhvyaozQxd5d6RcyHlUgc7SN9++JxQmJhoyzOw+yvjcnld8gkYBy7CoXYnadXNR3Ofpo5x8MOYGc3jIRm1aldkskbkyFpq4bG8BY/zXwWfZSzwHDEknuC+Q28=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1693.namprd12.prod.outlook.com (10.172.56.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Thu, 12 Dec 2019 15:20:08 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::514b:dbf8:d19f:a80]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::514b:dbf8:d19f:a80%12]) with mapi id 15.20.2538.016; Thu, 12 Dec 2019
 15:20:08 +0000
Subject: Re: [RESEND PATCH 4/5] Subject: drm/amdgpu: Redo XGMI reset
 synchronization.
To: "Ma, Le" <Le.Ma@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1576096732-3596-1-git-send-email-andrey.grodzovsky@amd.com>
 <1576096732-3596-4-git-send-email-andrey.grodzovsky@amd.com>
 <MN2PR12MB4285C0500B7E9363A2CF7B89F6550@MN2PR12MB4285.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <dae40279-60df-9f50-d65f-0df1005c2efa@amd.com>
Date: Thu, 12 Dec 2019 10:20:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <MN2PR12MB4285C0500B7E9363A2CF7B89F6550@MN2PR12MB4285.namprd12.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::46) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
MIME-Version: 1.0
X-Originating-IP: [2607:fea8:3edf:e127:3a1e:65e:fc37:38e9]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6ed155b6-8bd1-434d-3e78-08d77f16c59e
X-MS-TrafficTypeDiagnostic: MWHPR12MB1693:|MWHPR12MB1693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1693779FD0D19389BBECADCBEA550@MWHPR12MB1693.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0249EFCB0B
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(136003)(39850400004)(396003)(501774003)(199004)(189003)(13464003)(5660300002)(6666004)(478600001)(53546011)(8676002)(6506007)(52116002)(66946007)(33964004)(66476007)(66556008)(2616005)(2906002)(110136005)(54906003)(31686004)(316002)(6512007)(4326008)(36756003)(8936002)(6486002)(450100002)(31696002)(81156014)(81166006)(186003)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1693;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yoJ4dFmypIvOUzOybd7UNETyzggnkf1qWkh+l7WpkRxMlTIzgS51Dcu+xQH6qiy2rw7OMZYIVNmu9JJXyRkAR4eBT5wLAG0zTY+qCJvm6TjVrELG8k+B5wDJ2HqVQJGM247aC90H1uNHm4fIQnh20KjGFqBbv8f6pYGoZIgJUCgSwnkn2kn9yyH9oZwP/iBdDPtXL0yhItTrU8IDgIyQNBct1T1oz66gIHMZnTdhAKVP9+D0AwEfbIcmpmerjIShw4Nyx22cESL7QA3OhFyYVQ2Nz9W7I1MGU11rufY7monecMDS0choElMZC/BwzCvsINh3F7OgXoYFPMo00DsORQKOrRs5BWqJnui8oQU6+j/jwjiyRNZtr5jm4x2MjSqMoMv81V5LgLJ/xzu9De5Uj2940zt/ahKc70yN3jU4FPg5iaeqymLwB0W4MGHfv2N6iLJ7EnFYFy6aWaDFnSFgePEp67Hyx6C9uNm008NG7yq65ITb0TC551rOyt3XxyBrsqjseWV/5dfJBLp6teE68A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed155b6-8bd1-434d-3e78-08d77f16c59e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2019 15:20:08.1273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13tnYTYZKkHazJS/+IlRzCqGjoDY0Mn6ADPfYdrqw/nf1thX44KKF9uuHMWzQMYckTFmhzDMp9FLmG2Fx3hJ0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1693
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============0326678279=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0326678279==
Content-Type: multipart/alternative;
 boundary="------------E1B97FE587FE95F3BFF5E1EE"
Content-Language: en-US

--------------E1B97FE587FE95F3BFF5E1EE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/11/19 11:05 PM, Ma, Le wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
> -----Original Message-----
> From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Sent: Thursday, December 12, 2019 4:39 AM
> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Ma, Le 
> <Le.Ma@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>; Quan, Evan 
> <Evan.Quan@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> Subject: [RESEND PATCH 4/5] Subject: drm/amdgpu: Redo XGMI reset 
> synchronization.
>
> Use task barrier in XGMI hive to synchronize ASIC resets across 
> devices in XGMI hive.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com 
> <mailto:andrey.grodzovsky@amd.com>>
>
> ---
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 42 
> +++++++++++++++++++++++++-----
>
> 1 file changed, 36 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>
> index 1d19edfa..e4089a0 100644
>
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>
> @@ -67,6 +67,7 @@
>
> #include "amdgpu_tmz.h"
>
>  #include <linux/suspend.h>
>
> +#include <drm/task_barrier.h>
>
>  MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
>
> MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
>
> @@ -2663,14 +2664,43 @@ static void 
> amdgpu_device_xgmi_reset_func(struct work_struct *__work)  {
>
>            struct amdgpu_device *adev =
>
> container_of(__work, struct amdgpu_device, xgmi_reset_work);
>
> +          struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(adev, 0);
>
> -           if (amdgpu_asic_reset_method(adev) == AMD_RESET_METHOD_BACO)
>
> - adev->asic_reset_res = (adev->in_baco == false) ?
>
> - amdgpu_device_baco_enter(adev->ddev) :
>
> - qamdgpu_device_baco_exit(adev->ddev);
>
> -           else
>
> - adev->asic_reset_res = amdgpu_asic_reset(adev);
>
> +          /*
>
> +          * Use task barrier to synchronize all xgmi reset works 
> across the
>
> +          * hive.
>
> +          * task_barrier_enter and task_barrier_exit will block 
> untill all the
>
> +          * threads running the xgmi reset works reach those points. 
> I assume
>
> +          * guarantee of progress here for all the threads as the 
> workqueue code
>
> +          * creates new worker threads as needed by amount of work 
> items in queue
>
> +          * (see worker_thread) and also each thread sleeps in the 
> barrir and by
>
> +          * this yielding the CPU for other work threads to make 
> progress.
>
> +          */
>
> [Le]: This comments can be adjusted since we switch to 
> system_unbound_wq in patch #5.
>
> +          if (amdgpu_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) {
>
> +
>
> +                      if (hive)
>
> + task_barrier_enter(&hive->tb);
>
> [Le]: The multiple hive condition can be checked only once and moved 
> to the location right after the assignment.
>

Not sure what you meant here but in fact let's note that while in 
amdgpu_device_xgmi_reset_func it's a bug for amdgpu_get_xgmi_hive to 
return NULL so I think better instead to add WARN_ON(!hive,"...") and 
return right at the beginning of the function if indeed hive == NULL

Andrey


> +
>
> + adev->asic_reset_res = amdgpu_device_baco_enter(adev->ddev);
>
> +
>
> +                      if (adev->asic_reset_res)
>
> +                                  goto fail;
>
> +
>
> +                      if (hive)
>
> + task_barrier_exit(&hive->tb);
>
> [Le]: Same as above.
>
> +
>
> + adev->asic_reset_res = amdgpu_device_baco_exit(adev->ddev);
>
> +
>
> +                      if (adev->asic_reset_res)
>
> +                                  goto fail;
>
> +          } else {
>
> +                      if (hive)
>
> + task_barrier_full(&hive->tb);
>
> [Le]: Same as above.
>
> With above addressed, Reviewed-by: Le Ma <Le.Ma@amd.com 
> <mailto:Le.Ma@amd.com>>
>
> Regards,
>
> Ma Le
>
> +
>
> + adev->asic_reset_res =  amdgpu_asic_reset(adev);
>
> +          }
>
> +fail:
>
>            if (adev->asic_reset_res)
>
>                        DRM_WARN("ASIC reset failed with error, %d for 
> drm dev, %s",
>
>  adev->asic_reset_res, adev->ddev->unique);
>
> --
>
> 2.7.4
>

--------------E1B97FE587FE95F3BFF5E1EE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/11/19 11:05 PM, Ma, Le wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:MN2PR12MB4285C0500B7E9363A2CF7B89F6550@MN2PR12MB4285.namprd12.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:14.0pt;
	font-family:"Calibri",sans-serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
p.msipheadera92e061b, li.msipheadera92e061b, div.msipheadera92e061b
	{mso-style-name:msipheadera92e061b;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle21
	{mso-style-type:personal-compose;
	font-family:"Arial",sans-serif;
	color:#0078D7;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="msipheadera92e061b" style="margin:0in;margin-bottom:.0001pt"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#0078D7">[AMD
            Official Use Only - Internal Distribution Only]</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText">-----Original Message-----<br>
          From: Andrey Grodzovsky <a class="moz-txt-link-rfc2396E" href="mailto:andrey.grodzovsky@amd.com">&lt;andrey.grodzovsky@amd.com&gt;</a> <br>
          Sent: Thursday, December 12, 2019 4:39 AM<br>
          To: <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>;
          <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a><br>
          Cc: Deucher, Alexander <a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a>; Ma,
          Le <a class="moz-txt-link-rfc2396E" href="mailto:Le.Ma@amd.com">&lt;Le.Ma@amd.com&gt;</a>; Zhang, Hawking
          <a class="moz-txt-link-rfc2396E" href="mailto:Hawking.Zhang@amd.com">&lt;Hawking.Zhang@amd.com&gt;</a>; Quan, Evan
          <a class="moz-txt-link-rfc2396E" href="mailto:Evan.Quan@amd.com">&lt;Evan.Quan@amd.com&gt;</a>; Grodzovsky, Andrey
          <a class="moz-txt-link-rfc2396E" href="mailto:Andrey.Grodzovsky@amd.com">&lt;Andrey.Grodzovsky@amd.com&gt;</a><br>
          Subject: [RESEND PATCH 4/5] Subject: drm/amdgpu: Redo XGMI
          reset synchronization.<o:p></o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText">Use task barrier in XGMI hive to
          synchronize ASIC resets across devices in XGMI hive.<o:p></o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText">Signed-off-by: Andrey Grodzovsky &lt;<a href="mailto:andrey.grodzovsky@amd.com" moz-do-not-send="true"><span style="color:windowtext;text-decoration:none">andrey.grodzovsky@amd.com</span></a>&gt;<o:p></o:p></p>
        <p class="MsoPlainText">---<o:p></o:p></p>
        <p class="MsoPlainText">drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
          | 42 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-----<o:p></o:p></p>
        <p class="MsoPlainText">1 file changed, 36 insertions(&#43;), 6
          deletions(-)<o:p></o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText">diff --git
          a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
          b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<o:p></o:p></p>
        <p class="MsoPlainText">index 1d19edfa..e4089a0 100644<o:p></o:p></p>
        <p class="MsoPlainText">---
          a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&#43;&#43;
          b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<o:p></o:p></p>
        <p class="MsoPlainText">@@ -67,6 &#43;67,7 @@<o:p></o:p></p>
        <p class="MsoPlainText">#include &quot;amdgpu_tmz.h&quot;<o:p></o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText">&nbsp;#include &lt;linux/suspend.h&gt;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;#include &lt;drm/task_barrier.h&gt;<o:p></o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText">&nbsp;MODULE_FIRMWARE(&quot;amdgpu/vega10_gpu_info.bin&quot;);<o:p></o:p></p>
        <p class="MsoPlainText">MODULE_FIRMWARE(&quot;amdgpu/vega12_gpu_info.bin&quot;);<o:p></o:p></p>
        <p class="MsoPlainText">@@ -2663,14 &#43;2664,43 @@ static void
          amdgpu_device_xgmi_reset_func(struct work_struct *__work)&nbsp; {<o:p></o:p></p>
        <p class="MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =<o:p></o:p></p>
        <p class="MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          container_of(__work, struct amdgpu_device, xgmi_reset_work);<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_hive_info *hive
          = amdgpu_get_xgmi_hive(adev, 0);<o:p></o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if
          (amdgpu_asic_reset_method(adev) == AMD_RESET_METHOD_BACO)<o:p></o:p></p>
        <p class="MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          adev-&gt;asic_reset_res = (adev-&gt;in_baco == false) ?<o:p></o:p></p>
        <p class="MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          amdgpu_device_baco_enter(adev-&gt;ddev) :<o:p></o:p></p>
        <p class="MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          qamdgpu_device_baco_exit(adev-&gt;ddev);<o:p></o:p></p>
        <p class="MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<o:p></o:p></p>
        <p class="MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          adev-&gt;asic_reset_res = amdgpu_asic_reset(adev);<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Use task barrier to
          synchronize all xgmi reset works across the<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * hive.<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * task_barrier_enter and
          task_barrier_exit will block untill all the<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * threads running the xgmi
          reset works reach those points. I assume<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * guarantee of progress here
          for all the threads as the workqueue code<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * creates new worker threads
          as needed by amount of work items in queue<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (see worker_thread) and
          also each thread sleeps in the barrir and by<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * this yielding the CPU for
          other work threads to make progress.<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<o:p></o:p></p>
        <p class="MsoPlainText"><span style="color:#203864">[Le]: This
            comments can be adjusted since we switch to
            system_unbound_wq in patch #5.<o:p></o:p></span></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if
          (amdgpu_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) {<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (hive)<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          task_barrier_enter(&amp;hive-&gt;tb);<o:p></o:p></p>
        <p class="MsoPlainText"><span style="color:#203864">[Le]: The
            multiple hive condition can be checked only once and moved
            to the location right after the assignment.</span></p>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Not sure what you meant here but in fact let's note that while in
      amdgpu_device_xgmi_reset_func it's a bug for amdgpu_get_xgmi_hive
      to return NULL so I think better instead to add
      WARN_ON(!hive,&quot;...&quot;) and return right at the beginning of the
      function if indeed hive == NULL</p>
    <p>Andrey<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:MN2PR12MB4285C0500B7E9363A2CF7B89F6550@MN2PR12MB4285.namprd12.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoPlainText"><span style="color:#203864"><o:p></o:p></span></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          adev-&gt;asic_reset_res =
          amdgpu_device_baco_enter(adev-&gt;ddev);<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if
          (adev-&gt;asic_reset_res)<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto
          fail;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (hive)<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          task_barrier_exit(&amp;hive-&gt;tb);<o:p></o:p></p>
        <p class="MsoPlainText"><span style="color:#203864">[Le]: Same
            as above.<o:p></o:p></span></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          adev-&gt;asic_reset_res =
          amdgpu_device_baco_exit(adev-&gt;ddev);<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if
          (adev-&gt;asic_reset_res)<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto
          fail;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (hive)<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          task_barrier_full(&amp;hive-&gt;tb);<o:p></o:p></p>
        <p class="MsoPlainText"><span style="color:#203864">[Le]: Same
            as above.<o:p></o:p></span></p>
        <p class="MsoPlainText"><span style="color:#203864"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoPlainText"><span style="color:#203864">With above
            addressed, Reviewed-by: Le Ma &lt;<a href="mailto:Le.Ma@amd.com" moz-do-not-send="true"><span style="color:#033160">Le.Ma@amd.com</span></a>&gt;<o:p></o:p></span></p>
        <p class="MsoPlainText"><span style="color:#203864"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoPlainText"><span style="color:#203864">Regards,<o:p></o:p></span></p>
        <p class="MsoPlainText"><span style="color:#203864">Ma Le<o:p></o:p></span></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          adev-&gt;asic_reset_res =&nbsp; amdgpu_asic_reset(adev);<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText">&#43;fail:<o:p></o:p></p>
        <p class="MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;asic_reset_res)<o:p></o:p></p>
        <p class="MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_WARN(&quot;ASIC
          reset failed with error, %d for drm dev, %s&quot;,<o:p></o:p></p>
        <p class="MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;adev-&gt;asic_reset_res, adev-&gt;ddev-&gt;unique);<o:p></o:p></p>
        <p class="MsoPlainText">--<o:p></o:p></p>
        <p class="MsoPlainText">2.7.4<o:p></o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
      </div>
    </blockquote>
  </body>
</html>

--------------E1B97FE587FE95F3BFF5E1EE--

--===============0326678279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0326678279==--
