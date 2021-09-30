Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C0D41D934
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 13:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625726EB7B;
	Thu, 30 Sep 2021 11:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21F86EB7A;
 Thu, 30 Sep 2021 11:56:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuAfTUMEPEb4E8wlhoRuG7+uBIvqgSbAdp1d1KPke8QGueS5X8tGSc9TfudET1GGHGTJZBEYbM7S0jsTNewBp87xUUMWM9FFL8ublpn3B8WUq/gNa+Lu+xDJ16fialDBIt06RdfOmI0+Bb/whhqqmAQj/cjsOrz6bayo+XkE/zM9EvqMnjAdEwCc/vTaQSCn0cFAsXJNoDVqwJVZlTDIYsKpGBb2bzKCjpehSNfY/Cn68CN9beL0m2XjD0D7+MlgD7R1FrMEG7p+EiuRbVdwCJfj7+nKSd/nxQApXHEwCuYCFviKaD5OoP6TKlOJCsZFKvZxxQVO7uoMfp2J96P9NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=WmRwddG0FcEc18gfTd0lAYwLfwqDAKvNSRdrN9yyj+A=;
 b=F1bNZ68/q3HSNsxwkrP1hKugCtDqqMu2dQTlCy7X9qcz3fn6yLX/T5kFV0WUvunMc4EnYhDIAk7BsoJPghURyo6qJhzOxN+yuHrtdtS78ES70WpWlBUJVYWrquOVimggswk8JMnoZ+x70daji63aOG5luq0ttcJ/sHxN68my8NIPZkASyYBw4X/WTY02RKCKaLeCD7jUiBQ8jBdUzG7PKAxNRMs67bs5Rq6VeOSWeSgNEQxdXvMj5QbZ3NxQTdmK684Qnal0VDALPXEcN1rQ/6SUi7SMq1bi0CDCNOcivwdBkDFWJdM0vS3rK4sBudR69AXucbrOY0/DXi/lXslbKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmRwddG0FcEc18gfTd0lAYwLfwqDAKvNSRdrN9yyj+A=;
 b=VbbXc7k98qz7CPg2/BEYPd4CR5kSIfPlnKk5xhfmaWiEIzGquUl7JMjlxUhI3G2wk0oJGk9riiADJtb4Z72QBv+ZvlKgGuMlfQfQ5gGE/wTOv1YKZyfnhPg9iDTb5X8QJn2ZxAxU+IcM0qtfzMaRI7dGCW3y45icxlkMpG9hieY=
Authentication-Results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1488.namprd12.prod.outlook.com
 (2603:10b6:301:f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 11:55:59 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4566.017; Thu, 30 Sep
 2021 11:55:58 +0000
Subject: Re: [PATCH] drm/amdgpu: fix some repeated includings
To: =?UTF-8?B?6YOt5q2j5aWO?= <guozhengkui@vivo.com>,
 Simon Ser <contact@emersion.fr>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, "Chen, Guchun" <Guchun.Chen@amd.com>,
 "Zhou, Peng Ju" <PengJu.Zhou@amd.com>, "Zhang, Bokun" <Bokun.Zhang@amd.com>,
 "Gao, Likun" <Likun.Gao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 kernel <kernel@vivo.com>
References: <20210930094239.7435-1-guozhengkui@vivo.com>
 <AGiYadRf5XyGUqLxwu3ykKzfwM2BgZo4yCAaEXdQiYfH2dbyKmipDNrclnI2lZH3HzNh71VBy5QKz3O4fFvQETjTI9hoKzKHjZNBz9ERKI8=@emersion.fr>
 <AIAAqwDqEh5BcgkyUT78Xaql.9.1632999287613.Hmail.guozhengkui@vivo.com>
 <HK2PR06MB34922067627E3951C991B678C7AA9@HK2PR06MB3492.apcprd06.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6d5646a2-c5fa-f204-920e-6a04e15d1521@amd.com>
Date: Thu, 30 Sep 2021 13:55:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <HK2PR06MB34922067627E3951C991B678C7AA9@HK2PR06MB3492.apcprd06.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------AFA7FFF2690A5A037A6E3DB9"
Content-Language: en-US
X-ClientProxiedBy: AS8PR04CA0025.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::30) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AS8PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:20b:310::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 11:55:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3d87aca-c179-4807-7477-08d984094408
X-MS-TrafficTypeDiagnostic: MWHPR12MB1488:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB14882641ED7C6DCE2364BEAB83AA9@MWHPR12MB1488.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: leJ+dYR9gAfTScCCeJSawklj4Sgn2Wh4nrJpGTVcOksPpZGYmplOogaL8m4gsSbk7g3AQVwT0lkVz/+VW1QhC8kHj0p8v7NLZzwwMDLxjwhClCtBHfJWcLgLMCxcnkkmUBKU7n8UK5sh28ejC+iCFCU/rTaZIjZCheeo+oWOpA/CTZ9BjeJVRCOEVsumaq4qY47zknAPm6UI7/UzVwKCMn2RkGaeqDpSxZfTwDvhu5315BDKcKaHGS4JqygOC39UqywwAEFBUxUB7s9WJuYpg6CUia2TAG0vG0xUBL1AgkywmziLDj0FYyVT6iV0wyx32unTCCLloRFfeO7o5+FxjZvjJjCp4mXNi4Cre3IUHwnpM43yHH3WTCuLu252QhkIPizlV4Wt2g/lwiL3c5vLGsCuhvreLSywL3AzNAaCQGJshJjPTogKinNlHS0xs3BAmt1UlQ80/rT3mVvtesrx9gNCvecs1FN1SDnnODl4FUZwQj9r5IhpNbCe6anVjhtq7sMXT9dLwaxcMTJ/mNf+EjrdgjRdmwnfsySeEIG5tGCFVAOO2fT/k7Ep7Ws8/Nw1EHPM+YIMgrTTfTqNYFSG2Zuu3cuonezTXtmdY7yQFUBUCpuHqfwD4VPh7UYYaPtnv0pCAx+Dx8VD/bPqibGzXRUcFSJljAz/ah2OfW/JQTkufTPdMudg/ro0GawPQB9jFyKbXtiiKJAjTP3IYYpH3Tj8dH077fWaB+dA/TSUV/4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(2616005)(86362001)(26005)(31696002)(5660300002)(6666004)(38100700002)(83380400001)(66946007)(66476007)(66556008)(8676002)(33964004)(186003)(8936002)(36756003)(54906003)(110136005)(316002)(6486002)(16576012)(31686004)(508600001)(2906002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V29BYlJXL1RKeGpLZmhLYmxLOFdCc1RzMTVMaUJwY3YwSEcyUGlyRkV4ckxO?=
 =?utf-8?B?TktPSEl6M2FMbVpTalhCY0tBSEc4cVVVYmxTTGIrSXI4WmJKZTd6Mm9Fa1My?=
 =?utf-8?B?QStzNytUdEovenRzY05mK3hzd2xvSitNSnplQTRvbVdTZGV4UnFYRG1ibmox?=
 =?utf-8?B?ZlIwYitZeTdlc0c0RU1IaEgrcS9PL09YSXYzZm5vWUkrNkhBZXBEczAvVGZN?=
 =?utf-8?B?ek90R2lYRTlsOXhjNGlXdDRtVnJESDArbVRYTVcxUU51cWNYNnJrRWFBTFJS?=
 =?utf-8?B?NEd2ckk0cHFuVW9MZ2RjanZNdUY1bFpmWERDeWFPYzg1eWxTNE1zYnhBWmQz?=
 =?utf-8?B?eUgrenRjYUlFN00wRzMycitFeUFCbWxxV083OXZjaXlGTU9zSTQxMkZPcUw4?=
 =?utf-8?B?aUxRczRFcjBmU1hBdVkwL09VeWJhUGVUU2VZVHcvZSt4KzVPNldkbFpYOUJz?=
 =?utf-8?B?d1ZjekxMTjlnMUdpbzNFRkt3cVNJNnhuaEZqOUx1UVozbEptZVpsdzdZRk9K?=
 =?utf-8?B?T1JldVoxNTJvZUY0YzU0M0poTWtaWHNTRXBHMDFqQjBzTTBGNGpIV2s3SkFR?=
 =?utf-8?B?T2hTNUxrN2tpb2RqeWZoYkJFbTBsSGdEZGMrVW16bzM3YXJ4ckVVY2RrWWJ6?=
 =?utf-8?B?QzNZdGNxOFdMK2VvQzJTMnE2Y0I2UWFySXgwbFJjQW9rME0wMkZiZlVuNEVI?=
 =?utf-8?B?NGFOenIxaCtmMGdGRXVtanFWS2h5ZHNYMG9QNS93c2grSVptdWpvZS9RclB4?=
 =?utf-8?B?dEpoN0JRTytFSytqY1VicmxYeklVclU4RlB6SzVkSmRqYmgzQUN0eXZmSmtS?=
 =?utf-8?B?MW9Nb1hpckFDRWtPWk80S2xTN2w2NVAwZUhUSWdTaGNFOXQ3akw1dU9JS2da?=
 =?utf-8?B?aW4rQkE2L2kwakxWVDdkT2VXNGRyb1BCK05VVFAxS0c1TUt0NjR5WmxqUHpO?=
 =?utf-8?B?MlV6TFhhVnVwdi8zSUkyZ1RORXkwWERhRUhNL0FQbjh4R0oxd3hLb1RkQUR3?=
 =?utf-8?B?amR3REd0dWQ3Nms1OTFKc0t5clJHVzJzSFAxMWNoSVNrQ1JHblBCYVJhUDhj?=
 =?utf-8?B?alUraE82dXFnakgyd3R1bjh2NUNBSEJPRkg0andKSzVzSGN0U2UvaWJKbEc2?=
 =?utf-8?B?RkYvNFBOZVhDcUVvem5NYkZ2eGpkbVVmZEpCZTdHRDNxVjl2SlM1S2V1ODd2?=
 =?utf-8?B?Tkx6UEJVS3VPRGRmRDR5a0V6SGo0RFRCQkw5bFlkNnRoaGFUamZaL2l4d1Fs?=
 =?utf-8?B?ODc4OGhjaEc3cFp2YmZuYTVEZGZwWlBZRFVVNnRmRGs3bThnSExWL0lWa3lp?=
 =?utf-8?B?M2RESzgxVW9xSjBLamg0VGJSbTkyMi9WOTJySVQ3K1ZhWTFPUGV4YWxVNXZv?=
 =?utf-8?B?QUFXWDJ5dFFnRFJSallpY2gzWXA1SXkvZGdVeGROZndRSFpHeXJqMGhRZEw5?=
 =?utf-8?B?dW9hejNvWDlZaTZSVVFPYXZiVVE5c3NNNkJsUTBnUXVjZStJejlHT29YcDBw?=
 =?utf-8?B?dWpKemhOcEJJUHZBaTA1QndTcUdpQlZ5UXNCYlE4UEJ3b3QwYnloUGdDZDNM?=
 =?utf-8?B?TkVJOG1DcjQ0RmZsY3R0ZVRZOWxmUUVnWkd3MGVhbmlMNThFSHp6Uk0rZU1Q?=
 =?utf-8?B?ako0U29jQzBDVyt6VWo2bzdCaWZzMU91NkVadDNqbzd4N05QSnk0M09Ia2Iv?=
 =?utf-8?B?MHdaakkwd1hFSjJ6UlQxTk8yWU5OQUtnUm9UcEl4TnFBKzVVVTN0dWJ3dFFJ?=
 =?utf-8?Q?ff4Bp3tOOmc13Nomglr2JGAz1lZ41rFMi73WZo5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d87aca-c179-4807-7477-08d984094408
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 11:55:58.5170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRoYDs68uXdYWWkb24kwBEDomEBrF3k86fbbSzeL/M1nN0xoeBS7K+XsFbES5Lgt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1488
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

--------------AFA7FFF2690A5A037A6E3DB9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Ah, that makes more sense. Then please remove the duplicates in lines 46 
and 47 instead since the other ones are more correctly grouped together 
with their blocks.

Christian.

Am 30.09.21 um 13:54 schrieb 郭正奎:
>
> Actually the duplicates take place in line 46, 47 and 62, 63.
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c 
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>
> index 291a47f7992a..94fca56583a0 100644
>
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>
> @@ -46,34 +46,32 @@
>
> #include "vcn_v2_0.h"
>
> #include "jpeg_v2_0.h"
>
> #include "vcn_v2_5.h"
>
> #include "jpeg_v2_5.h"
>
> #include "smuio_v9_0.h"
>
> #include "gmc_v10_0.h"
>
> #include "gfxhub_v2_0.h"
>
> #include "mmhub_v2_0.h"
>
> #include "nbio_v2_3.h"
>
> #include "nbio_v7_2.h"
>
> #include "hdp_v5_0.h"
>
> #include "nv.h"
>
> #include "navi10_ih.h"
>
> #include "gfx_v10_0.h"
>
> #include "sdma_v5_0.h"
>
> #include "sdma_v5_2.h"
>
> -#include "vcn_v2_0.h"
>
> -#include "jpeg_v2_0.h"
>
> #include "vcn_v3_0.h"
>
> #include "jpeg_v3_0.h"
>
> #include "amdgpu_vkms.h"
>
> #include "mes_v10_1.h"
>
> #include "smuio_v11_0.h"
>
> #include "smuio_v11_0_6.h"
>
> #include "smuio_v13_0.h"
>
> MODULE_FIRMWARE("amdgpu/ip_discovery.bin");
>
> #define mmRCC_CONFIG_MEMSIZE   0xde3
>
> #define mmMM_INDEX             0x0
>
> #define mmMM_INDEX_HI          0x6
>
> #define mmMM_DATA              0x1
>
> static const char *hw_id_names[HW_ID_MAX] = {
>


--------------AFA7FFF2690A5A037A6E3DB9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Ah, that makes more sense. Then please remove the duplicates in
    lines 46 and 47 instead since the other ones are more correctly
    grouped together with their blocks.<br>
    <br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 30.09.21 um 13:54 schrieb 郭正奎:<br>
    </div>
    <blockquote type="cite" cite="mid:HK2PR06MB34922067627E3951C991B678C7AA9@HK2PR06MB3492.apcprd06.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:等线;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:"MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}@font-face
	{font-family:"\@等线";
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:"\@MS PGothic";}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"MS PGothic",sans-serif;
	mso-fareast-language:JA;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"MS PGothic",sans-serif;
	mso-fareast-language:JA;}span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:等线;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">Actually the duplicates take place in line 46,
            47 and 62, 63.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">diff --git
            a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
            b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">index 291a47f7992a..94fca56583a0 100644<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">---
            a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">+++
            b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">@@ -46,34 +46,32 @@<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;vcn_v2_0.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;jpeg_v2_0.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;vcn_v2_5.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;jpeg_v2_5.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;smuio_v9_0.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;gmc_v10_0.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;gfxhub_v2_0.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;mmhub_v2_0.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;nbio_v2_3.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;nbio_v7_2.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;hdp_v5_0.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;nv.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;navi10_ih.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;gfx_v10_0.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;sdma_v5_0.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;sdma_v5_2.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">-#include &quot;vcn_v2_0.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">-#include &quot;jpeg_v2_0.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;vcn_v3_0.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;jpeg_v3_0.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;amdgpu_vkms.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;mes_v10_1.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;smuio_v11_0.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;smuio_v11_0_6.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#include &quot;smuio_v13_0.h&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">MODULE_FIRMWARE(&quot;amdgpu/ip_discovery.bin&quot;);<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#define mmRCC_CONFIG_MEMSIZE&nbsp;&nbsp; 0xde3<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#define mmMM_INDEX&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#define mmMM_INDEX_HI&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x6<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">#define mmMM_DATA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x1<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span style="font-size:10.5pt;font-family:等线;mso-fareast-language:ZH-CN" lang="EN-US">static const char *hw_id_names[HW_ID_MAX] = {<o:p></o:p></span></p>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------AFA7FFF2690A5A037A6E3DB9--
