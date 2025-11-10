Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B061CC48B68
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 19:51:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF1110E4BA;
	Mon, 10 Nov 2025 18:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T47Hqr/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013062.outbound.protection.outlook.com
 [40.93.196.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1F010E4B5;
 Mon, 10 Nov 2025 18:50:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FafjJx6xILubSlJq5P0FPhIDqZgjBNW5jz7hCysvRpMnqmvFGzdQHMn9i0tOWTrTXzaURNY3OqXHhseCEKapKpwYGvcI+xq5u36fFmhqgxgQ2s89TiItFYW10yHtDNvrFJ4zr4Vr9kwLRO24ZJngHrguYK7Qzdgm9vRII6DyqUfGS4E1ffSfVgtNnUmXSmvM2V52nDZvcOwwwy2HwMkBjkYgZToGG2Pw4zyrnifaqiRidKHez4aA8uiTu36Gq8fefR4ktz8P7OhSzdErFMgip+E1UySiq/fE+xFlyIBWAm6wDfzBVELs5dm3kETkkKZtz8yfKwf1DfE8IZRPJ6ZYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ds8RlgZCMIh7tgikiJZrhQimtjkj19bAiBDZTbbfFMs=;
 b=K+CGPWWfslxszOVqxSk92VbP5Y7r3J6K8mEMpWuDcL2PvS6q3OADZAYWGqo+Qp1dTn/CiorCr89XpbVw+BQhw0W5V2ZJFUn9Ka4wSvA9oXXVbynN8RJ0Xt3wdBOkMgL83RHnMrmPfiR8V1+1j6+NrHX82eSNt3YulJDTHgrgcExLPNUb6CUpDO2jddRM6SIye8vmpQUgh0CnKvyJSDGXF/Pta2MPG7qreKB9+I0+gVieaXr7mBisMuKE6GsrAjpIJQamz84wtMf9s8RvuNohlLyQ6CUpnfpY9wRnl3ALLKM9qbaurD8Jb1B1qM9CUZlYhy/CQkTxi98rtap3Ugibow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ds8RlgZCMIh7tgikiJZrhQimtjkj19bAiBDZTbbfFMs=;
 b=T47Hqr/4sHqR+61eDYw0N/41Vs9Lwli85vXbuXhm9PnMEZQ6DDlivSvJ3iDEGbZykO5ldDl+IFUkCikZNff0n2/1CX6Ee8i2WdeVUhHAie0/UPrXL3zDI71gALGRjmd5j4H3qoClMMY/9LDA9j+H8xuV3SHcB9M9qd/7IxIvZt0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB9173.namprd12.prod.outlook.com (2603:10b6:510:2ee::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 18:50:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 18:50:33 +0000
Message-ID: <0c9e0534-027d-4875-8631-a91b163b85dd@amd.com>
Date: Mon, 10 Nov 2025 19:50:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/23] dma-buf: Switch to use %ptSp
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Corey Minyard <corey@minyard.net>, "Dr. David Alan Gilbert"
 <linux@treblig.org>, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matthew Brost <matthew.brost@intel.com>, Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vitaly Lifshits <vitaly.lifshits@intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Calvin Owens <calvin@wbinvd.org>, Sagi Maimon <maimon.sagi@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Karan Tilak Kumar <kartilak@cisco.com>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>,
 Max Kellermann <max.kellermann@ionos.com>, Takashi Iwai <tiwai@suse.de>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-pci@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-staging@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Rodolfo Giometti
 <giometti@enneenne.com>, Jonathan Lemon <jonathan.lemon@gmail.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Richard Cochran <richardcochran@gmail.com>,
 Stefan Haberland <sth@linux.ibm.com>, Jan Hoeppner <hoeppner@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Satish Kharat <satishkh@cisco.com>,
 Sesidhar Baddela <sebaddel@cisco.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Xiubo Li
 <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
 <20251110184727.666591-6-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251110184727.666591-6-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB9173:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a6efb7-0b8b-4c26-3e92-08de208a0755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZC9xUWVzQ1RLU1A2a0pYdXdyYk9BRm5BTkUrUk9MbS8zbXFxbVBrR2d6OFZs?=
 =?utf-8?B?SkZoRkxRUDdmeXFtU05hR01YMElwdGQxT3JQZjZFTXJiZFB5N3p3cEtMZmJn?=
 =?utf-8?B?MUVMZEJxUDVwZEYvb1I5OXlIWFZ1ZnlZVUFUaVNYR0tMMFhmM2RvdVRnanJM?=
 =?utf-8?B?UGxZcisrNm1pand0TGlYZnRPOGZzR1ZwRzFCSThqMllLRXFkOTZKYUxxZEha?=
 =?utf-8?B?OEk2UFRkKzJWVU56VE1JMmcvWDhJMEU5Tlo0bWFEdXdSYU5xSWVrMCtOVUhW?=
 =?utf-8?B?ZElBM2tBTnpPRVRBMHkxbUVFeDJha29HRUdxR3RURUJlam1vVlRuZU44MldQ?=
 =?utf-8?B?NkFETmNFNmRIOWJqVDNqMlpRT0lBcjdmSi8vQURJdjB1b0MreDM4aDJPbWp4?=
 =?utf-8?B?Zk4xSzNtUTYwYkMveU4yUVdnUEE0TUdNTzgrUUF2dDZtc1d0WnZkUmpaeWxP?=
 =?utf-8?B?NC9tS1JJUkQ3Tm1FaTl2U1FkeW1INUR0SEJtMnJVdUN6QlFzRk9DR3RQYVZm?=
 =?utf-8?B?UG9rck9QU21tOVZZNTNYa09vS1FsTTZQOWJsRGdWQ2VkY1N2eVlnMEJLZUgx?=
 =?utf-8?B?b3pQdnVMRm1ISXZQWDdEZmNGYlpSNXF5OE5uZDNtdCtPdVpIOVNkeGpSNFZ1?=
 =?utf-8?B?OWFxNmYvQUFSUE5tR3BpdU8zN2ZxcEVRS2pJZXJKRElobDVvb2RDdjVzSXhB?=
 =?utf-8?B?TWxMOE1UeTRTeTAxZWdNQllYMUdlWnQ5cnlKVXVlWGV5cmtndDlXYURiMkVF?=
 =?utf-8?B?a3lORkN0SytMWmsySS9ERi81QU5rTWl1TERRVE5IbEtacXd4S0t6UUtzNnNE?=
 =?utf-8?B?dm9ZWHJDaGlxSmVWdDhvck93WmRiQ2hzeDRpV1U2clEzWkFUY1pLZXlsblpT?=
 =?utf-8?B?QzFFNlFISjJwUzBKYW8xTi82bGNPTzZxQUZxM1VtdmY4Vzl2aFV3eWpwaGZu?=
 =?utf-8?B?d1grRy9MRTMwb0xUNjMwZjFleHZtL0FhMDVVMTQzVTg3NDQzUWFwMmVVYUQ1?=
 =?utf-8?B?SlpVbTJQNjZ0QUt0eUVUUFFCU3QyM0J5dzlUdWhIQjcrZ2VEdFRtUEJDRE5J?=
 =?utf-8?B?bHo2Uk9tdy9TN2RkN2MwcGQyemZzUnFxUHBSM0VMbmtwK2w5TEtVaDRxZE02?=
 =?utf-8?B?NlBEeHJoZHgwZkdwREhSOEZjQWFwOE9qUGdIVEtqRW80NDRvUWsyc3Z0VjQv?=
 =?utf-8?B?bXZGc1R0MlRCTXFCL3hPOXd6Nmd1SkdQbmFCV1BxSSsrUVFqeCtTUE5PdURV?=
 =?utf-8?B?NjdXa1hIMWR0QjJNRWxVbGlYVHQ5eHdNM2JVSFFiakgxQzhCdUZLS1pkbzB2?=
 =?utf-8?B?dS9vM2s4TitHeXZaK1phREcyK3p5bTM2bjF4TGkxdmlYQ3A2YXlkbzJNenVP?=
 =?utf-8?B?YklBY09PTGFXOVg3THU4SDRvN2E2YnZKMGszNG5KNS9TWGl4ejRCSVI2eUJw?=
 =?utf-8?B?QmdNQ2NIa0J1MVVyUUdDS1RDMkJybFIwem0zQ0hBbUJ5WHdTRVlmYkQwVVdI?=
 =?utf-8?B?WE55YnVmQlo0bzlCc3RhZkJ2UTVuT0xxNjBDYXc3MkdleTVwbWx2cjFieVl2?=
 =?utf-8?B?djI2YUpTY1o4OG9GemNNbkoyU2FXdlBkNVVSeDJPNloyQjRITWkvOW5XcEVq?=
 =?utf-8?B?d05PVEdrYUZzL3lpaGU0MGJCUkZoWkN0RExJVDUzQ0kxc1gzZUtTUEJ6YWlo?=
 =?utf-8?B?WVl3aDJ2TmwrcmE2dVlCUTJWdENhSXpSM1FaM1hIY21PM1Vzd3F1cE9mTlNK?=
 =?utf-8?B?VHZBSUtPZ0szY3N5ck9kR1ZwQnoveFFJVW9tamw2MlAxbVNRRGVoQ1dJVk9Q?=
 =?utf-8?B?REdia3ozZm80N0xRTjNzdVVBQXRycVZPbTZLbG1sN2tEZjRoWTFLVDlsM2pY?=
 =?utf-8?B?eHcwWU9zV09nQm1ZbC8xY0gyWXpiMmcvaUJtNzZDRW40RnF1ZWR2dGtLY3Bn?=
 =?utf-8?B?SmJPemFjVjNycW5idEJyM0VGUUcxNjltaExFQk80cWcvbldjaGY1dVhVZjcx?=
 =?utf-8?Q?x8liTAVBRqk95EvbXo2zcYuGiBxX90=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW5TbHZWem5TcDVpZnlCc2R1elFTWk51OFVoLy9NY0Y0dWdFVFQzNHdONEdM?=
 =?utf-8?B?dSsvVnhSaXdQYWJvaEdVWm9FdjVpUDFIaTBvcFlDMFF3ZkRqTUYzaUlXMWs5?=
 =?utf-8?B?amQrbmg2VFg1ZTVsUFJCaHVHT0t4TTE5SmRjVERkL05FT2VHV0lRWi9OUHVp?=
 =?utf-8?B?Uk5DTUQvSHZaRW5hbjhSd2t6ejBoa0trVWc4N0swNkQzTGx0bzhXb3AyMFAy?=
 =?utf-8?B?OXhFMXlkK2JXYStmZjJ1c3JYTDdrMUVVdEpSc0sxNnFLQU4zQXA5QmRhTjhT?=
 =?utf-8?B?ZmUxbGZkd1d4c3R1VmJNZlcvaEQ4Z3QyRGRDVTdMRWlvY1pJYkJYMk9aZlp4?=
 =?utf-8?B?eDFRcXVSMjNYcnJ1bTM2MTlCU2NrK3JIUGZQUXgvbVhxTTRJUml1eitNQnBt?=
 =?utf-8?B?RlY5Qi9kbzI3RG1wS1dOaXpyUEZsUk5qVDl0WGRXSldNT05rdkYyVGhZcDZF?=
 =?utf-8?B?RXovNkU4Z01mK0NtUlhBb1VNVEJpZ2l5R09aVGJoWVc2c0Rjcm82TTRoYTll?=
 =?utf-8?B?WWsxS3BEK3dpUnc2VXFEZ0JHSWJ0eHJ6SEhtNitOaEVORnQwakhTMEV6TE82?=
 =?utf-8?B?WDZhSW5Ld2NwTi9USFJuZTBXdkd0VGlMVkl3VnRnNlBrRWlYMEpocW85ZDVa?=
 =?utf-8?B?cS9rS2lQM2NUYU5zSHBjVCtlTjBSdG1nbjZJeUZVYjNrNXg2eEJPQ1dqOTZu?=
 =?utf-8?B?enhIYUI1V1pjaDhRME1idHMrbG9XZUpBRWtweUUvamJGWmQ2L1I3MkpnRXQ2?=
 =?utf-8?B?RWlKSlMyeWwzWkdSaWZDWU1RSE9UTGJ6bmtMaE5BaHM5SU01cW5ydGFyTlFa?=
 =?utf-8?B?cDluMjFCa0g5bThVb2xhZUgrVkprVDdtc05qcS94cEtodUlGZmJlaFZkMFN6?=
 =?utf-8?B?cEhJc0FWRFdGelk2S2dQaEpiN2tZYUxCMlh2Nkh1YkU3TEFPQW5QeEh1VE80?=
 =?utf-8?B?cTlLaFYxeDNaVWw1N05CaVc4eEc2dWROcVJGdlQ4MVZFWWw3dndqVUxRUkJ6?=
 =?utf-8?B?MGN2TXN1dWFZU1VNWXV2UXFqSDFMK1NuaE9OQVBrWEErN0cvRXBNbnBmSjVJ?=
 =?utf-8?B?a0VId05DQUVIZVo2bkVQZ0drNjVLK1V2YTFIOGV4MjZWMndRUytaeEdQUWtm?=
 =?utf-8?B?a2Y3bldQVEZUOGJEUUEyeExVeHRwTStuREMyYXd0ekszRDRLSmgxcmEyc3ha?=
 =?utf-8?B?Q2lhdjR3Ylphb2dLbkFtcGdCeVphNlNTRGg2b2JmK013Tmo1R3I0ZG54QTF6?=
 =?utf-8?B?dWdWV1AyZjllb0V4V25yT2pHTS9jNGVCdTMyU0VReU9vUVdMZEpNdjIyelM0?=
 =?utf-8?B?b3k2ZVBFdzBvKzhxZjhKVEdyclN1SDBYbzJtOXdMYm4rbUZodGNnVCs5MUh0?=
 =?utf-8?B?OVpZbXVUd3lURkF4VG1uZis5U1ptRXk1Sk1FeE5WVDNaeWlFMDhHMDVaMytC?=
 =?utf-8?B?SGtiREdwczdDaHVvMzRHUXF0Q1F5UmZYWkN2eHhYK0orSmlnTTZmMVRJWXVt?=
 =?utf-8?B?VHYwbGZvWVorNm5Zb2hJSnhDcWxlajVRaFRmWFZFZTV5aEhsdmU2WHlIS1Z5?=
 =?utf-8?B?MHl6Z1pXZnFxVFBPeEplSFA2a3ZyRVk5VTE0M1lHdk9QaGV3V29RNTVBVHNl?=
 =?utf-8?B?U3BLd3NTK0V1TFRuOGF2TkJMK0twL3RuUlF4MzNYRXBqOWgzeVZONm9pcFhB?=
 =?utf-8?B?Wk5DeVNqUEdYUWc1azVSOTFCTndYNDFhbGNJREtRK1hmQnpHTkRoSTBQT05P?=
 =?utf-8?B?eUEvMzRaczk5OHdmQXB0ejRxWGxlN2V1U01VdDBKL2QyblJJUHgxNmQyWmM1?=
 =?utf-8?B?Wkx2TkdKWUhucDd0RjMyQ3hla0Z2anAvNzdOb2hNZzhvNHMxUEcxL2hvREp1?=
 =?utf-8?B?dC8wbk9jZkNrdWNITWNFbUNlOU5BOFpDQVNvR2pId2cwMVlLek1GeXliQzBF?=
 =?utf-8?B?c2JBajUxYmgwNUt6TVVqcnIxVng4ZlJzSjgvcUpHSk9yV2JhWE1sTWRiN29F?=
 =?utf-8?B?bm1Xa2hhbCtrMkFYVzJWMkdvRHhrOHA5dS80c25MZzZROEgzYWlTbHVKSWtj?=
 =?utf-8?B?SFgrR1BGZklFcjc4QmF3NXpnWEVidXoxeHdRZjNhSENzb2RuYk1YZk1VaGxr?=
 =?utf-8?Q?tqJXmnALRAZMMAN7nYmceRRii?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a6efb7-0b8b-4c26-3e92-08de208a0755
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 18:50:33.5884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sDI/e+3aCHt6Lf5YaN9bVRt/Qx/U8zYc3fLHgVtqghcviFZSXNsLd921HagWFzGM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9173
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

On 11/10/25 19:40, Andy Shevchenko wrote:
> Use %ptSp instead of open coded variants to print content of
> struct timespec64 in human readable format.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/sync_debug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
> index 67cd69551e42..9e5d662cd4e8 100644
> --- a/drivers/dma-buf/sync_debug.c
> +++ b/drivers/dma-buf/sync_debug.c
> @@ -59,7 +59,7 @@ static void sync_print_fence(struct seq_file *s,
>  		struct timespec64 ts64 =
>  			ktime_to_timespec64(fence->timestamp);
>  
> -		seq_printf(s, "@%lld.%09ld", (s64)ts64.tv_sec, ts64.tv_nsec);
> +		seq_printf(s, "@%ptSp", &ts64);
>  	}
>  
>  	seq_printf(s, ": %lld", fence->seqno);

