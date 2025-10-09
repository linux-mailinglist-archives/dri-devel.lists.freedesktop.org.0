Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C76BC8990
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 12:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C441010E219;
	Thu,  9 Oct 2025 10:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYMVmkNH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC2010E209;
 Thu,  9 Oct 2025 10:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760007142; x=1791543142;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=an+VGZlpeCt07XVMMF8rvt8ayM3Hqd1uSE9fF5pRAL8=;
 b=XYMVmkNHMqb5TN54Kj10uX5073L61t7L5b1oloGHIgUkdlwT7rJ9mqg4
 2RynPQ54NZPl6QR0FT1c/+FtLKLZ2kWjJj0KGL9I3a2GrRvSXLUb+hT4I
 jaTlFq4XZZU4Zin6kbz82MM/NmQKgLMR/31iudR+FFSS+7LKRooJTt8e9
 p9TppPQAwW69SkgsGS+KfDyx4zldPcrdtRHECOccSFENdFN/s3ouWk7F+
 nXE/kDSutAnB5JR/58RWN6iVYYv7RobBIHz0ZPUPIa1Cm9Ct8BUr0obo+
 ibJnDMERFib+TqjrpN9K2qD+J3IICZ7Sk91elgpJa/suCyLP7fr9Cfca5 g==;
X-CSE-ConnectionGUID: ET0gjTgQRjyJAU7oxYoAUg==
X-CSE-MsgGUID: fss6MMM1SQOu1lh4tYzvbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="64832881"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="64832881"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 03:52:21 -0700
X-CSE-ConnectionGUID: hOt08gExQGOuEXGF51zFdw==
X-CSE-MsgGUID: 992QJLTmTlykJTVvyn33pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="211323649"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 03:52:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 03:52:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 03:52:20 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 03:52:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMs+z8wHl+VNj6mbjk+xqxE1V+fVncDo7kpTevD4KE6uXL0VrzsoGfae5Pp4Uat1VVPbWgR0m5XQZ39R5EjBvnWuvaOq+hKYDs9DEg4tU2Tpf1f58zVP0WkhNUdIWE64DiZm+ZCIhYUDYFwj/7l7nNGLzL0OvSbjI7FO13BRfdNZ6O3n5jzDS/bY0C68ym0K4fXKlAOWvMyVBs7fxq3tj0OI2yNxFbo1+ae4qJqIjf3GNhfSi5JC06hBHTMZb2WKFPexaOemANLOAxq9F8GKdHS7TI6bGFK2Gep/nbs8bpMMAGC1YWVhQMP6CIMrrQWj4K3eTO/hzJmmYnA9JSHA4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XK4aOXHvaqOs1G3mNcOBd5qlRiu1od59PF/GPeBk9nw=;
 b=VW0IYFYgfnWsf48fDUZ4EXNf8tgdfPZyFBiLrDay19J4X1MmAmox2wQnp4zJ7qYxsVdNtGtY/JU5UenK+w/iFzMbA0mCSqL2ZpC+iSw66lyLZX+pSzKi2r/IxCsBWCOvFRkYQhYSHxnXSWbeTOyL26/mI5wAscNwdrQCA79lXmtkQZMDQykuQ1VnRzWHaI++yiIFWCp3NWXcDqfjViV6r7jyXsW4AjP9KwU08m3c78wnQVyj4V/PhPtPLnCyY+SCNw4YzdT882jRfEmHMSe6iDgbDj1Ys1sLn97APgVy2BLKd+NphUIWNksF0iUJr9yPpzhBDTTI5K3KrOkW3uXnAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by BL3PR11MB6316.namprd11.prod.outlook.com (2603:10b6:208:3b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 10:52:17 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 10:52:17 +0000
Message-ID: <35451049-3933-431a-9603-aec868d1d105@intel.com>
Date: Thu, 9 Oct 2025 16:22:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] drm/i915/display: Compute the scaler coefficients
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20251001063500.1259687-1-nemesa.garg@intel.com>
 <20251001063500.1259687-6-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20251001063500.1259687-6-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0042.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::10) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|BL3PR11MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: fd774591-f328-4e06-f81e-08de0721e983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXVpSDA0L3lTTEl6ODl1K3RoVy9iTituNExGWlY2ZU1zUXp0bG5qSXRYNUxa?=
 =?utf-8?B?NFh3UEpweG5kTDI2WTZqWlJldFVEbitxQk5ydGFOdTI2cFNvWVRqS3l3Q1pz?=
 =?utf-8?B?cVpjSFJqaE9waHliNzF1dUNhMlR3SWFMYUJvRlhobDZIbDB1NzIrZnpEbU9q?=
 =?utf-8?B?ZmFUS0UvSmxpU2tiazMrODdPVVhMSC9hSDJ3d2lEQ2FLa0hYZHd5anNKUE1B?=
 =?utf-8?B?a1RkbXJqNWh3c1pldXhUeWViZ3E0U0ZBdXFXK05xRDlqRzNhdy9wb1BkVmwx?=
 =?utf-8?B?a0ZpZDVqdGh4VzdXL2cwN2huRlI1ckd3REppOHQ0ZWlLYVAxdkRyTnNXSUJl?=
 =?utf-8?B?ck5Jc2Q2WENBcDNKOVlTdG1uYXc4L2podmZWZjF1cDk5b2NCUUpsSjgrRk1a?=
 =?utf-8?B?L1doclNtYlFQS2Ivck1DVUo1TGhZbURJT1dxYnpwNGdhZXVEcnllY21QeVVN?=
 =?utf-8?B?bE9naTQyQUpFdWhqL3hoeXRIblowYzlpL01uWFUyeXlSdU4wZ1dhTVNQeEls?=
 =?utf-8?B?RlRiTmFRbXROMDcvdXpIZjFFTUNpRkptMnZVUGdId3BRR2RpMHhKZm1OanJu?=
 =?utf-8?B?SVljOVFMM1BGVkxWbHRhcmthQkxPb21yc1lxbHhoK3ZNdnpYRkhhS3dxY1dS?=
 =?utf-8?B?eHZnMjlUWTgweTlvM0p4eS91WER3TURDWnF0U1RFaCs4dUtqazBvb0lVR2tY?=
 =?utf-8?B?bXlBSGpYWTF0SmFtenpnVkpleW54Wk9EMDYyU0JYZWVzSGUxazlkR3cyUGJp?=
 =?utf-8?B?Tkg0K1Q1TTVEQ2w3ZDEvUTN6aGwvQ0ZIMlJaNlk0S1N4bXlGS0ZkWks1dFFH?=
 =?utf-8?B?dmJpbzdXL213WG1jbmZacTczZ0k4aGpSYnBpS0dwdTdoTjE3TXA4SHlUbGxN?=
 =?utf-8?B?VGFqQ0VvbUhVLzg1ZW5HMDZKeU44elZveHJ6b3AwOWxEK1Y0dGkxOWZXYTd1?=
 =?utf-8?B?ZUxMVDAwZVJLZWd4cGxPOUlTWGREd3lZMnEzTnFSK2piNEZrcVVEeWRrdGUv?=
 =?utf-8?B?dzBoY1FsR3NqdThaYmNCZVRra1VNUGZOS1VodHBlWG1JN1hUREdmd0IrMVpp?=
 =?utf-8?B?V2lLSEVWT0pNbmdFdW1NcjlHdlc5Ym1VeVJwL3VzOExMcVd6Ung2VTVtakpL?=
 =?utf-8?B?MTB3V1VQNkxWWW9hdjFsTDMyOUVlWkJBL1lMdGh4dGZCTVNHUVpVT2RTWVNK?=
 =?utf-8?B?YjRoakVOYzNXYXc2Tk9aUlhwYXZ5M0Mwb2FZQ3ZPWGZpZ0EzNVUySkt4S2ZM?=
 =?utf-8?B?THRkdWpCRStUcXhUQnp0VzVSMnBaR1pLR1FRZmV4REk4Y3drTldoZ0VCMHZY?=
 =?utf-8?B?VnBLaW1mU29HQ3A5TkhtUERVdE02WEc2WDhpcjJTRGRrTTJCcXJScVpGTjcz?=
 =?utf-8?B?UUZqN000Sk04Z1NnUjdHNW5ZeGxUT1IzYStaZTM5WEROdk1VdkduVk95WlFx?=
 =?utf-8?B?RzRwVzByM0lUQitwZEw4aUxMN3BETE52MTVKOFlRY0w5eTAzelpRTE9pS0dY?=
 =?utf-8?B?RUEwQ2tCUWhvVDBiUXR4bVh6OUxBVmZvN3dwRG1mdmtxSmtEcEVQWUdWSzBX?=
 =?utf-8?B?V3A0dlpXSkNuQzZ1WDB5WjVKQU5QL1Z1ZmF2eXdPU2w1S0hqZ2U2UEE3OXMw?=
 =?utf-8?B?Z3kwNi9HcEIrZzZSb05FWVRYS0ZhTkIxRnhMWVl3d1JkL2M5SjY1ZFdtYnly?=
 =?utf-8?B?V3RxYUtjK3JudkZ2bTR3dy9sRUEycW5ZS1dZRUVidnF4MVpOQWw0UDBzTlNp?=
 =?utf-8?B?RWlLTWFjR0RIUEVUMkoyODZMc1ZlU3k5MW1jejE4RFVpLzdQMGlXMk8wMVky?=
 =?utf-8?B?aWpYczZLV3FudVI5SU1tcWhvazdsM2tiZ0ZxdTZQdndmbmlBSHRWYjBzKzFI?=
 =?utf-8?B?QnN5bW4yaXpJbGt2NXdHaTAwT1dSdzFrWnZOaWs2VFRYN3lkc1duNWN1TlU2?=
 =?utf-8?Q?wFy3cD63M94kDWoIxQHJ/gf6mNzNq9dO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW05MEI1REFIVmxlUE1lWFJYRmlsMVV6WElOU1ZweU9sRTVTUkhyZnNLUUFO?=
 =?utf-8?B?RUFDanNXNjZhc1lvK2lWWVBMZHRQUVRhYWptczkwaVQyb3FkZHRJUnFoenBL?=
 =?utf-8?B?M2tKQ3BIN2ZuYUdFVnoyWWkwcjZsSng4T1NTdWIwTktkSmR1eHFXWkplK25v?=
 =?utf-8?B?OTNhWEJJZ1RMVFFJcVc5aUJOVm9OWXpDeTdqUjQ2d2VPVUJPZVZnaU93UGZJ?=
 =?utf-8?B?dE9ieWo4NkZzV0l2eVYwWWdZN2dYenFzT1pSTFdYZkNHZnZFWm43ZFJORkZ4?=
 =?utf-8?B?RWk4Rkx4dWNSRnJWd3JxSmpKWDdjL0Z3a0RnZ0EyT0tIOHd6SGVGUVM0YUtM?=
 =?utf-8?B?TG5iTlV4U3pMQ3dxV3cyczNONlFvVThQemFoZmRUcGxOR2tUcHhtVHcwYy9W?=
 =?utf-8?B?Z0dlSmlyVy81Ym5UcStvUjdmRW1BRjZ1eGYvdUUxN2QzQ2cyT2pBeUJZWng0?=
 =?utf-8?B?Sks3YnBSTXdRSDNwbHB1WjhLNnlmczY3Qi9CSnFVMTFYNGFKM2VaLzBUb0cr?=
 =?utf-8?B?dXpzblNVZURtYlI3TEk0Y2ZaNW9ISVJVVUJRblBBUjF3QUx5OC90VDFmV3do?=
 =?utf-8?B?OW5NVHRsb3A5dXNrNkphMm0rR0Z2VWQ3OERqQ3krRmtQWGRuQ2gvUGdnOEg1?=
 =?utf-8?B?UVlVL0pxaFB6Z0ZhODBYcGpyM0hkMlV2NGtDcEh6L25JYXRHQlJGQjNOL0pp?=
 =?utf-8?B?Z0dwaXN0ZFVXSUlXMjIyNHdoR0kzQkxsSFdQWUtxRG9CRW00ejFwdURzdWFO?=
 =?utf-8?B?czd4L2V3SUJkRTlGSk5WdzRiK3JabzFlaTZ4UGhodm5LU216cHEvR0RtRm95?=
 =?utf-8?B?dmNiVjNDRVhQOE9BYlJBaVF3NVhpS2QxQmpyY0lqbytlcFRpb2ZQbHUyTWhK?=
 =?utf-8?B?cVAyTVhvamRwaCt0TjhyRlY0UjBSci9yM0JGck0ySzJYUXcxNGwwWjMyWVoy?=
 =?utf-8?B?UkFaYmkyRUdqaTJFVGszYjltK0NXd1FWWDFjK1RFTFVCbEttMlNSeXJuWDIw?=
 =?utf-8?B?ZW0zalRxb2taK0t6Y01OOEtZQ0V4b0VtR0J3KysyOVpWdk1lL0VEMzZKZFll?=
 =?utf-8?B?anZSRWw3RURyTUZkd054Wnp6WDhBcldka21EdnVNZi80NENDbjN0bWsxRjhv?=
 =?utf-8?B?VFNwb3A5UFhtaEFtSVRiTHBYeFdPNXVFOW56S1EvUTVoYVZnVWZKeStmVE1V?=
 =?utf-8?B?US90TTZ3VERmakdGOU5JdWlTOEQ2YnlBR1VqZHFSQ3hWdFJ3N3h1Uncyb1JM?=
 =?utf-8?B?Q092L1o5TFY0anE1UmJWUFI5MDZnSUFXTTVIWlYvUVAxQ2JHT3N5bTdKYmda?=
 =?utf-8?B?ZW9Mb0FoK0hEQjFYcWZpVjgyVkRPR2xwSUJvRjl6NXZkdU5Dc1JYRVlhUERX?=
 =?utf-8?B?VmUvU29MZVdOUUxwZkNhc1lBODBHdXg1aFFQRm9NUDd6N2w3dnlxcDluc1pF?=
 =?utf-8?B?QjV1dGdjRVpsWWErdmp3bk0rVElWWmxDNEY5U09waFhVM3ZUYVZXOFFMMjV3?=
 =?utf-8?B?TFVBNUZkM25DTVk2Z2JLWXNiSVY5clRzNWxFL3p3Q0Y4eWNLQ3lqdU9JRXd3?=
 =?utf-8?B?eHlHbVFLbDZaTlRsM2pyMmR0cTlhUUg3YTNmU0RmZ3d2Y3JRbW9rRjN2NnJQ?=
 =?utf-8?B?UW5UaXhrK2JRNW9Vd2w3K3BTMTdJMEJxWnhDRWFhK1owaFIyTHZ4NUtvcWtJ?=
 =?utf-8?B?MWMwa1pqSVRBUDRYcVcxR3dJZDM5Z0lJVzFZMzhQTHRsSWJ0bkhCYm91YTVQ?=
 =?utf-8?B?VE9QODZ2MUNmcmIvYnRZOS9rZFVueVRWNU8vWSs2cWkvRnJ5UDVpSURnVkoy?=
 =?utf-8?B?b2liT2ptNEw1aEc1QmxkVHBwNWRKajA4ZW1YU204WjZ0YzA4OTQwWUk5UTIv?=
 =?utf-8?B?cjRicDNNTVhiWmZ2SzJDaFRmMktrcEZvbjdPU3BpUDVmVjJUeUNRalMySHp1?=
 =?utf-8?B?UkZnS3IzZE8zeEE3NWxlZXgwbUN1V2x5cFhlVnBYVmxVa0pCbWo2VEZ2WHdh?=
 =?utf-8?B?Q1diNEkwZDZRcXZTUUxKUUxMQUJqc2REWDd2SHYyanBCcXJ6RHl2UUFQcjNq?=
 =?utf-8?B?SnBmYno2RXNxUTE3R1JKay9mWWg4VUtSY3RMRlJRU29tb21waU5sZ0ZDRmtx?=
 =?utf-8?B?b0lSRnc3TnNVejNMdStlZE9mSXNXak5XeURzYjNZRW96YTlLUlRHLzJxNkpJ?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd774591-f328-4e06-f81e-08de0721e983
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 10:52:16.9849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkdrgMqF3DNRjZdiqZtBT87PMgmgLTZvjGCkd/4YStigYA1DyLryCN5RvD6pVAY2/ORYDHrxQoAxjfekpjaIc/N8uxXsl0tQmsPGadLERRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6316
X-OriginatorOrg: intel.com
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


On 10/1/2025 12:04 PM, Nemesa Garg wrote:
> The sharpness property requires the use of one of the scaler
> so need to set the sharpness scaler coefficient values.
> These values are based on experiments and vary for different
> tap value/win size. These values are normalized by taking the
> sum of all values and then dividing each value with a sum.
>
> Add helper to compute and set the scaler coefficients.
>
> v2: Fix ifndef header naming issue reported by kernel test robot
> v3: Rename file name[Arun]
>      Replace array size number with macro[Arun]
> v4: Correct the register format[Jani]
>      Add brief comment and expalin about file[Jani]
>      Remove coefficient value from crtc_state[Jani]
> v5: Fix build issue
> v6: Add new function for writing coefficients[Ankit]
> v7: Add cooments and add a scaler id check [Ankit]
> v8: Remove casf_enable from here[Ankit]
> v9: Removed REG and use shift operator[Jani]
> v10: Remove filter macros
> v11: Add casf_write_coeff funtion to casf_enable
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_casf.c     | 99 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_casf.h     |  1 +
>   .../drm/i915/display/intel_display_types.h    |  8 ++
>   3 files changed, 108 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index 313ed6b10317..91f2362405b9 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -133,6 +133,8 @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
>   
>   	intel_casf_compute_win_size(crtc_state);
>   
> +	intel_casf_scaler_compute_config(crtc_state);
> +
>   	return 0;
>   }
>   
> @@ -156,6 +158,101 @@ void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state)
>   	}
>   }
>   
> +static int casf_coeff_tap(int i)
> +{
> +	return i % SCALER_FILTER_NUM_TAPS;
> +}
> +
> +static u32 casf_coeff(struct intel_crtc_state *crtc_state, int t)
> +{
> +	struct scaler_filter_coeff value;
> +	u32 coeff;
> +
> +	value = crtc_state->hw.casf_params.coeff[t];
> +	value.sign = 0;
> +
> +	coeff = value.sign << 15 | value.exp << 12 | value.mantissa << 3;
> +	return coeff;
> +}
> +
> +/*
> + * 17 phase of 7 taps requires 119 coefficients in 60 dwords per set.
> + * To enable casf:  program scaler coefficients with the coeffients
> + * that are calculated and stored in hw.casf_params.coeff as per
> + * SCALER_COEFFICIENT_FORMAT
> + */
> +static void intel_casf_write_coeff(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	int id = crtc_state->scaler_state.scaler_id;
> +	int i;
> +
> +	if (id != 1) {
> +		drm_WARN(display->drm, 0, "Second scaler not enabled\n");
> +		return;
> +	}
> +
> +	intel_de_write_fw(display, GLK_PS_COEF_INDEX_SET(crtc->pipe, id, 0),
> +			  PS_COEF_INDEX_AUTO_INC);
> +
> +	for (i = 0; i < 17 * SCALER_FILTER_NUM_TAPS; i += 2) {
> +		u32 tmp;
> +		int t;
> +
> +		t = casf_coeff_tap(i);
> +		tmp = casf_coeff(crtc_state, t);
> +
> +		t = casf_coeff_tap(i + 1);
> +		tmp |= casf_coeff(crtc_state, t) << 16;
> +
> +		intel_de_write_fw(display, GLK_PS_COEF_DATA_SET(crtc->pipe, id, 0),
> +				  tmp);
> +	}
> +}
> +
> +static void convert_sharpness_coef_binary(struct scaler_filter_coeff *coeff,
> +					  u16 coefficient)
> +{
> +	if (coefficient < 25) {
> +		coeff->mantissa = (coefficient * 2048) / 100;
> +		coeff->exp = 3;
> +	} else if (coefficient < 50) {
> +		coeff->mantissa = (coefficient * 1024) / 100;
> +		coeff->exp = 2;
> +	} else if (coefficient < 100) {
> +		coeff->mantissa = (coefficient * 512) / 100;
> +		coeff->exp = 1;
> +	} else {
> +		coeff->mantissa = (coefficient * 256) / 100;
> +		coeff->exp = 0;
> +	}
> +}
> +
> +void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
> +{
> +	const u16 *filtercoeff;
> +	u16 filter_coeff[SCALER_FILTER_NUM_TAPS];
> +	u16 sumcoeff = 0;
> +	int i;
> +
> +	if (crtc_state->hw.casf_params.win_size == 0)
> +		filtercoeff = filtercoeff_1;
> +	else if (crtc_state->hw.casf_params.win_size == 1)
> +		filtercoeff = filtercoeff_2;
> +	else
> +		filtercoeff = filtercoeff_3;
> +
> +	for (i = 0; i < SCALER_FILTER_NUM_TAPS; i++)
> +		sumcoeff += *(filtercoeff + i);
> +
> +	for (i = 0; i < SCALER_FILTER_NUM_TAPS; i++) {
> +		filter_coeff[i] = (*(filtercoeff + i) * 100 / sumcoeff);
> +		convert_sharpness_coef_binary(&crtc_state->hw.casf_params.coeff[i],
> +					      filter_coeff[i]);
> +	}
> +}
> +
>   void intel_casf_enable(struct intel_crtc_state *crtc_state)
>   {
>   	struct intel_display *display = to_intel_display(crtc_state);
> @@ -164,6 +261,8 @@ void intel_casf_enable(struct intel_crtc_state *crtc_state)
>   
>   	intel_casf_filter_lut_load(crtc, crtc_state);
>   
> +	intel_casf_write_coeff(crtc_state);
> +
>   	sharpness_ctl = FILTER_EN | FILTER_STRENGTH(crtc_state->hw.casf_params.strength);
>   
>   	sharpness_ctl |= crtc_state->hw.casf_params.win_size;
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> index e8432b4bc52b..13e5003a23fc 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -16,5 +16,6 @@ void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
>   void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state);
>   void intel_casf_enable(struct intel_crtc_state *crtc_state);
>   void intel_casf_disable(const struct intel_crtc_state *crtc_state);
> +void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
>   
>   #endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 771026f788d8..0eae95add055 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -946,7 +946,15 @@ struct intel_csc_matrix {
>   	u16 postoff[3];
>   };
>   
> +struct scaler_filter_coeff {
> +	u16 sign;
> +	u16 exp;
> +	u16 mantissa;
> +};
> +
>   struct intel_casf {
> +#define SCALER_FILTER_NUM_TAPS 7
> +	struct scaler_filter_coeff coeff[SCALER_FILTER_NUM_TAPS];
>   	u8 strength;
>   	u8 win_size;
>   	bool casf_enable;
