Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A61BAED7C4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 10:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACD410E3C7;
	Mon, 30 Jun 2025 08:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RMxGERqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D48E10E3C7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:49:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NH7N7j6ofFY7Cg+ufAyW3qXO1tyNnerUPTiRwF/QrSKuuFWiAItsWJ1Q2iuTTSNl6x7uuxeW6x5FxZCaIdvMI5hRyeZcFWcCByOzHsEMsi7PqB8JibOwTQ2B18LnCBm01EKlVTA8LvdPJJh9SW0wO0oMms0XJTXaWwEYbrJuJHuW8EU6hIc1e56ghVL82Spi/v6/iETBgHjR+9Amdx0MwSr9VMMO9V3HPRb3TH0By3ieHQ8VSBkJy6s6PYC0z23sKK7GAmjxJb2asZ9HsJhETE5p6nsfMAED7fVN6zoA2y7tuuNDM+8SwPJ0ikDdK3e6G51kVpX9bw763MvghSlFYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Z5KxvAGVWiD2QlfkqDZgIcau0kE3Jiw+ss5P9L1Q2U=;
 b=BOiXi0hd1zkry9K++UedisFKsVHUert1iqBQgvGp+HOy/mXqOmrrY7vwQlt3umCJZEq04hgdQhjLtgbnSLUy9NDY+W4tuBTXEGDOd+cwLY/MLFdKr9Q+yb7rK+1wycb+pu8Uc0VvLvvm8U657SUSz/Iial+2S4TZ1vqixRxR6MTHlJ5XZPooxYlpYg6FZpRgs3m3bhsxg2sdLlG4Rcb0lhRgX3PPmuTr/jvpPMfONEl21R1kWJwHiF+NJ8TOOVQtV2D0SkZ7L+Z5TPisY6eZrbzaIvXRl2j06tBcin7F2kzS7+En12aDdrXjIeROnLYepwJVvA1oXQYZeUCHGiRZzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Z5KxvAGVWiD2QlfkqDZgIcau0kE3Jiw+ss5P9L1Q2U=;
 b=RMxGERqZDvAwwKWFRi/S1sQcbDk3GT5BTwznMYKWoePeWm5tnD5z4wlkC0SPnKX+KwTUBKRw+b8EZosy3HPL5W48FX1TqS7cG+C/duVa+Dc9t89X5o8Mv0b1C3/fEZnF3GXf5RJR6D0YYmKfkRHJLlFIAmzOXt2x8AVRz7Lnfus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH1PR12MB9597.namprd12.prod.outlook.com (2603:10b6:610:2ae::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Mon, 30 Jun
 2025 08:49:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 08:49:53 +0000
Message-ID: <9009d89b-91f0-496c-a45d-03d8f0fb7bf6@amd.com>
Date: Mon, 30 Jun 2025 10:49:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/gem: Acquire references on GEM handles for
 framebuffers
To: Thomas Zimmermann <tzimmermann@suse.de>, asrivats@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org
References: <20250630084001.293053-1-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250630084001.293053-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH1PR12MB9597:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b66da6-04ee-4654-9491-08ddb7b314b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFFaL1BvZEJLZkxpSUw4REh4dXZhR3pLM2V4MGk2TnVYbDZMV3dMN2gybVFM?=
 =?utf-8?B?aDVoTHhxQWh0ZHFlN1lkY3hVcFNVU2M5SVV4V0xOeDVtVk93QnRrbU04Q1dN?=
 =?utf-8?B?OEFLWHNPVlpsai9OUGo4N015NXhqMkhhUlBSbDFwcW1Cc0s0L2FjSVFSVUFB?=
 =?utf-8?B?ZXJKdkw4V2R6YWhEZnlZeFcvMDJld2UrK2NxZGJ0U29wVXkwdEVSZzhvdjRp?=
 =?utf-8?B?UlFyNm9PRkViNEIxWkRUejZ5VVkrZm0yOXVWbEhlYThaZlJZbVp4bys1eFYw?=
 =?utf-8?B?eDM0bGE2VHczRk82TXhjVytScS80WVBWQTY1VmlTeU52KzdRaUxrT20xSGVp?=
 =?utf-8?B?cDFla0VPU1doc2dabUVaZFpwbWNjRytoOFRyejlFU25IK2dvenZrRmZ5Q2RL?=
 =?utf-8?B?cldZSU1PYU83SWRKSHpwYmNUY250R0pMMkUzRWMwVjlqak95c3NJaTY2OUFG?=
 =?utf-8?B?RVJhSmxBL0p5WmtiVzJBRGlLbzZWb3FKQmoyUkZIaXNXSUdWamphaW9MUXBF?=
 =?utf-8?B?RXNYOFBVbTdscFlPOS91RVpvNlJRRnphbjVieGZMVFBST2RBUWFYK3J0aVg0?=
 =?utf-8?B?UnJURHRzZmtyNERxakkyQ0VsZUxabk9WZFpqcEI1eHFONlliYUQyaG5CMEV2?=
 =?utf-8?B?UnJ5NHZYVkxoOHpJS1ZONTN4cS9pMGhjTFJsQzBhdlBOVzJlQitEUlFLQit6?=
 =?utf-8?B?R0dXVnFKeDh1L0N6S2NoRGJUZlRXaDBqcDE4QVdtNnc0UStoT3RKZjN3Qi84?=
 =?utf-8?B?WEhSNEF3TVViOG1PbG5mWHhyM0ZaRmk4b1prSEs1aDBVTnBEY2NlWUpnb2xa?=
 =?utf-8?B?QTIxQ3doak1CT1cxWGltc0p0MmVXMFdLc0E0RFd6QzZqVXhLVUdqVGhoUnhu?=
 =?utf-8?B?RnVnQTZoaVVOSnBybiszYXJIUmtKTFFqK1UyZnNCZGNBc1dDZkZtaFNFSEpo?=
 =?utf-8?B?V0h3Z0l1eHlWS0NnSm1IcEpmNXlrcXpTRnNXS3BEdFNMVHJmOERweGlxRXRX?=
 =?utf-8?B?RDE3Ym5mbDIyVnFEcEpwclVQSWVOcTVPVXVRQmYwMWI0dzhZVjBhVXpWVlI4?=
 =?utf-8?B?VXoyNTZ4bHlkUGFvOTdYUXV2QzQvZFZxa3JOMjlsK0dobVAwUVdxKzJROXRI?=
 =?utf-8?B?SVdnNlF2amJxeWY4N2ozTHBubGZlb1FBQnRxdlluakc2aWJWY0RjeUZOOVE3?=
 =?utf-8?B?M2NjNzNWSnd2RERIb0dlWFRmUUZ1cUlCV1pEM0gyQnN6L3hVYmsvcGpET20z?=
 =?utf-8?B?UUdaWC96bVhhaWlJZmJhTyt2NWtzZjV2Uk9vNkN4MVZ6d1Z6RHJXMEdVMVV6?=
 =?utf-8?B?QUJWd1Ryb2h6cktrTmVKVlFTT0U2ZzlUd2NaWlF2N1NuWm9sOFJ3clF3NDAw?=
 =?utf-8?B?WUVEekJQaHZUYVRRMUEzT0ZBeUdvWnp6SlQ1QW1sd2JUYmVmVjlnemtEWW9q?=
 =?utf-8?B?L3BOR2RkWDhrd3ByRkxaRTdib2NhL2t1WUVhN0lSUUdIcTRsMWhGdVZkVDlj?=
 =?utf-8?B?bnhlVnBibUlPR24zejZjdUNRNG9hNU9nRkd1MlJZdFBMR2N6czNVcmdNeUlr?=
 =?utf-8?B?ckM3NVo0ZWcyb1ZXd0ViUjJIWGwrdldPakVBNTRDSzBoNyt0L2FzTE56YXQ5?=
 =?utf-8?B?QXZnNi85VzBvSUtpNmUrcEh1dy9PWjlJcVRKcXE3SEFaY1dWcTFnRXVHcHF6?=
 =?utf-8?B?UWcrMDBDZ294eTB5YWsrNlJ6N1ZBY1hqNzg1bmsxK3E1ZnR2T2hhbmtSV0Fq?=
 =?utf-8?B?K20zcDBGcWJzOE9BeTRsbjZnTG5vZFJvN2VkM2dHMkVKd2JyMFFlMkkvNGg4?=
 =?utf-8?Q?ybZdd1RD7Im6EYZd1CvUeVzHl+UcoFEo3Vc/c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1M2emRmY21wME5GZDJFOUdaOTRWb1BheWZqL0FwMkgvSXdTU1ZQRmxhemo0?=
 =?utf-8?B?V1Y4TWZBOXZkOUt2RCs1S3R1dkV1bVhkL2Z0MmxyOTVXb0Z3K0g5cTBseWQ3?=
 =?utf-8?B?a0VPODIwSmpReUlUa3BqQVZYUWtaR3p5SGNNSHdDdUpxR1ZPQ1U3MG5GK3A2?=
 =?utf-8?B?Rnl3M1pLWWVNaDRpTnVkcFJZRUMxYnZoNytGTzJpM2RRUDRBdmduM0RoRnRn?=
 =?utf-8?B?a1I1cGhVdGFrM3lOcTN4QzliZ0xVeHhFUXE5TkluVFZMM1FJNWVaaHBWQlVo?=
 =?utf-8?B?M0dnZFBFTjZRYThNTHBsaHY4VUxmS2JwZmdFdE1halZHUnZkUG9CWTZjU3Vr?=
 =?utf-8?B?Y2NDZmpoQU54RkJXelVDSkNlQnRRTTdzcjh6QWpyYW5FcUtyS0piTXo2bXdR?=
 =?utf-8?B?S0plU3p2NVdSc082M1BYdmtOMjBEZ2ExM083RFhyZkhzdUxJamw0ZkZWOXQv?=
 =?utf-8?B?RkFacXZkUFRTeFg3aVhlbEhrdEhxN1E5Ny9ncUJPQ1RRYVFFTWkzdzB4Ukh4?=
 =?utf-8?B?ZCszVXBsS1VDd2FwZmVHTmlteXVZVVAvNzZlOWhPcnJBT0FOUld1cWhKd3BX?=
 =?utf-8?B?bGd4cyt4V0FSR2dXRG9jMlBja1p6d0tPeXpXQ0NRWG10OExJc1A2NFN5Q1hO?=
 =?utf-8?B?T0FEZFBBMGVZb2lHWVQvb2tUcmJtUDBXM2p5RGN2OWhnaFZvZTZ6ZVM2MUZN?=
 =?utf-8?B?RDJWUTV0dE1tdVlUYnNPU25DamNJaEp4d24zWjVTVEY1QzJhcnA0RjFrV0ZP?=
 =?utf-8?B?WmgrRjd1c2pDVkFGYVcvTTZKN2lPTnpGSC9uS08zR0MrRFA2dStibW1LWktV?=
 =?utf-8?B?NXAzbDk3L1VxNk50OWNkbkZvVFlQOWtPb1BrU0JzUEloMnA0d1hwOHNiMDVk?=
 =?utf-8?B?RGd0bEZhdkxmcWxPVDBZOWpScHBIanRkZE5Jc3E1NnViMktUbytuZUNpWU9W?=
 =?utf-8?B?QUMvZUc1eGtnZGZ2MVdRblBvN0p0RkdaZ2E5QXFtekJkV0JlVnNqcGw2QjlE?=
 =?utf-8?B?dGgxT1pQdHI1dkV3dmd2YU1IazRON2xnTjVueWVRZlFBb2lSa1RSMEhRcTY0?=
 =?utf-8?B?S0s2K1VVZm9iRExPSXd2cXg2aTJnWFVzQldwR2RDaU9TSXI0Sk5OV0o0YXRr?=
 =?utf-8?B?VFZ1eTFhdVZTRDI1bjIzbFpia0RaU1ZtRWlVN1NLeE1ZWEZEdEVQTnUydHFs?=
 =?utf-8?B?eVpVY0lSSnMxVml6cmR5Q3V4cGI3bG5iUmtFMmozNXFIQ2NrRW9waHU0Y2tj?=
 =?utf-8?B?eC9EeW5UZVF2OHdTaE5hdkphUlVnMW9zRjUySzlwZDFzdjVrZ2Y0SHNIcWt0?=
 =?utf-8?B?NHkwWVBPUXlQL2l0V1lVZTZUckNwRkhKbDBvdEtDWGFTd0t4SWgvei9BaTdO?=
 =?utf-8?B?UFZqcDZ2NFV5WDdnWldaWXJSVW1haGtTQ2cyRU5GOGFCb203WnZrTVdCT0xt?=
 =?utf-8?B?bVZBa09rZkxWUzRjZGdhcGU2THRLenVCdDdCeEFONmNaRE1iVGJwc2ZCRm8r?=
 =?utf-8?B?djBYS2lVVmR1aTJLMHIwKzM1RmJrTWdXVnBPdU9FRHgzZ0dUUURtbHpuUTFv?=
 =?utf-8?B?NUpPQUhkNVdCWk8vdnZqZnZKZDFqRzVXdk9EQjhMY084NGRESjVwL01qK3Mw?=
 =?utf-8?B?eXJmYzlSek13ZFN1RWZVd3RlYlo0dFA0RHhxZnZqb0Z4MDlpTEVVQkF1UDhN?=
 =?utf-8?B?SnlueEo4azd1S2J5em9ub0MvbngxclpHbzFkZmorMEVMZ0pjMFNXZ2pwUmpW?=
 =?utf-8?B?ekhQTytIYVVGQm14WnJZbkNTekJZVG5wclJJWmdzOHFQMGhYbFoxMFdtRVlk?=
 =?utf-8?B?NlIxREdNak1YdE10cm5aM0FYenhua3lJeXRsQVdLa3BTTFUvZ1hhaEcrL1RX?=
 =?utf-8?B?aCtJbE9MME1CUC81cDZvaWdaM2lLRDlReTVrSysralF3Nk1pcHFzUnpzMlBE?=
 =?utf-8?B?Zml1Yk9qSFhtREJlejdLNDFpVWlJdDUvUzMxd25JdUh6ZWN1YkJzUjN4WDFi?=
 =?utf-8?B?amI1TEs3MUZUYkFKeVIrVW5Zb241UjdhQ2VIeXJHSVRMSXhrcml1bktKU2sr?=
 =?utf-8?B?MUFvL3l2Q2VxRmJHM1phTEhrblQzSmh0aUxYSGVFd2hBQ0xXc1ZrT1lRR2pW?=
 =?utf-8?Q?rU9Zi1OMNDYgcdEjOAEgcvH7F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b66da6-04ee-4654-9491-08ddb7b314b3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 08:49:53.3971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZvUKbr2ztkNNCPMUl47n7oWLaw2RaoXsKGHErbRrhgbezRnSoDtwasLcnBcpDdi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9597
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

On 30.06.25 10:36, Thomas Zimmermann wrote:
> A GEM handle can be released while the GEM buffer object is attached
> to a DRM framebuffer. This leads to the release of the dma-buf backing
> the buffer object, if any. [1] Trying to use the framebuffer in further
> mode-setting operations leads to a segmentation fault. Most easily
> happens with driver that use shadow planes for vmap-ing the dma-buf
> during a page flip. An example is shown below.
> 
> [  156.791968] ------------[ cut here ]------------
> [  156.796830] WARNING: CPU: 2 PID: 2255 at drivers/dma-buf/dma-buf.c:1527 dma_buf_vmap+0x224/0x430
> [...]
> [  156.942028] RIP: 0010:dma_buf_vmap+0x224/0x430
> [  157.043420] Call Trace:
> [  157.045898]  <TASK>
> [  157.048030]  ? show_trace_log_lvl+0x1af/0x2c0
> [  157.052436]  ? show_trace_log_lvl+0x1af/0x2c0
> [  157.056836]  ? show_trace_log_lvl+0x1af/0x2c0
> [  157.061253]  ? drm_gem_shmem_vmap+0x74/0x710
> [  157.065567]  ? dma_buf_vmap+0x224/0x430
> [  157.069446]  ? __warn.cold+0x58/0xe4
> [  157.073061]  ? dma_buf_vmap+0x224/0x430
> [  157.077111]  ? report_bug+0x1dd/0x390
> [  157.080842]  ? handle_bug+0x5e/0xa0
> [  157.084389]  ? exc_invalid_op+0x14/0x50
> [  157.088291]  ? asm_exc_invalid_op+0x16/0x20
> [  157.092548]  ? dma_buf_vmap+0x224/0x430
> [  157.096663]  ? dma_resv_get_singleton+0x6d/0x230
> [  157.101341]  ? __pfx_dma_buf_vmap+0x10/0x10
> [  157.105588]  ? __pfx_dma_resv_get_singleton+0x10/0x10
> [  157.110697]  drm_gem_shmem_vmap+0x74/0x710
> [  157.114866]  drm_gem_vmap+0xa9/0x1b0
> [  157.118763]  drm_gem_vmap_unlocked+0x46/0xa0
> [  157.123086]  drm_gem_fb_vmap+0xab/0x300
> [  157.126979]  drm_atomic_helper_prepare_planes.part.0+0x487/0xb10
> [  157.133032]  ? lockdep_init_map_type+0x19d/0x880
> [  157.137701]  drm_atomic_helper_commit+0x13d/0x2e0
> [  157.142671]  ? drm_atomic_nonblocking_commit+0xa0/0x180
> [  157.147988]  drm_mode_atomic_ioctl+0x766/0xe40
> [...]
> [  157.346424] ---[ end trace 0000000000000000 ]---
> 
> Acquiring GEM handles for the framebuffer's GEM buffer objects prevents
> this from happening. The framebuffer's cleanup later puts the handle
> references.
> 
> Commit 1a148af06000 ("drm/gem-shmem: Use dma_buf from GEM object
> instance") triggers the segmentation fault easily by using the dma-buf
> field more widely. The underlying issue with reference counting has
> been present before.
> 
> v2:
> - acquire the handle instead of the BO (Christian)
> - fix comment style (Christian)
> - drop the Fixes tag (Christian)
> - rename err_ gotos
> - add missing Link tag
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Christian König <christian.koenig@amd.com>

But I strongly suggest to let the different CI systems take a look as well, we already had to much fun with that.

Regards,
Christian.

> Link: https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/drm_gem.c#L241 # [1]
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Anusha Srivatsa <asrivats@redhat.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/gpu/drm/drm_gem.c                    | 44 ++++++++++++++++++--
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 +++----
>  drivers/gpu/drm/drm_internal.h               |  2 +
>  3 files changed, 51 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 19d50d254fe6..bc505d938b3e 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -213,6 +213,35 @@ void drm_gem_private_object_fini(struct drm_gem_object *obj)
>  }
>  EXPORT_SYMBOL(drm_gem_private_object_fini);
>  
> +static void drm_gem_object_handle_get(struct drm_gem_object *obj)
> +{
> +	struct drm_device *dev = obj->dev;
> +
> +	drm_WARN_ON(dev, !mutex_is_locked(&dev->object_name_lock));
> +
> +	if (obj->handle_count++ == 0)
> +		drm_gem_object_get(obj);
> +}
> +
> +/**
> + * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
> + * @obj: GEM object
> + *
> + * Acquires a reference on the GEM buffer object's handle. Required
> + * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
> + * to release the reference.
> + */
> +void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
> +{
> +	struct drm_device *dev = obj->dev;
> +
> +	guard(mutex)(&dev->object_name_lock);
> +
> +	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
> +	drm_gem_object_handle_get(obj);
> +}
> +EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
> +
>  /**
>   * drm_gem_object_handle_free - release resources bound to userspace handles
>   * @obj: GEM object to clean up.
> @@ -243,8 +272,14 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
>  	}
>  }
>  
> -static void
> -drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
> +/**
> + * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
> + * @obj: GEM object
> + *
> + * Releases a reference on the GEM buffer object's handle. Possibly releases
> + * the GEM buffer object and associated dma-buf objects.
> + */
> +void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>  {
>  	struct drm_device *dev = obj->dev;
>  	bool final = false;
> @@ -269,6 +304,7 @@ drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>  	if (final)
>  		drm_gem_object_put(obj);
>  }
> +EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
>  
>  /*
>   * Called at device or object close to release the file's
> @@ -390,8 +426,8 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
>  	int ret;
>  
>  	WARN_ON(!mutex_is_locked(&dev->object_name_lock));
> -	if (obj->handle_count++ == 0)
> -		drm_gem_object_get(obj);
> +
> +	drm_gem_object_handle_get(obj);
>  
>  	/*
>  	 * Get the user-visible handle using idr.  Preload and perform
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 618ce725cd75..c60d0044d036 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -100,7 +100,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
>  	unsigned int i;
>  
>  	for (i = 0; i < fb->format->num_planes; i++)
> -		drm_gem_object_put(fb->obj[i]);
> +		drm_gem_object_handle_put_unlocked(fb->obj[i]);
>  
>  	drm_framebuffer_cleanup(fb);
>  	kfree(fb);
> @@ -183,8 +183,10 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  		if (!objs[i]) {
>  			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
>  			ret = -ENOENT;
> -			goto err_gem_object_put;
> +			goto err_gem_object_handle_put_unlocked;
>  		}
> +		drm_gem_object_handle_get_unlocked(objs[i]);
> +		drm_gem_object_put(objs[i]);
>  
>  		min_size = (height - 1) * mode_cmd->pitches[i]
>  			 + drm_format_info_min_pitch(info, i, width)
> @@ -194,22 +196,22 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  			drm_dbg_kms(dev,
>  				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
>  				    objs[i]->size, min_size, i);
> -			drm_gem_object_put(objs[i]);
> +			drm_gem_object_handle_put_unlocked(objs[i]);
>  			ret = -EINVAL;
> -			goto err_gem_object_put;
> +			goto err_gem_object_handle_put_unlocked;
>  		}
>  	}
>  
>  	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
>  	if (ret)
> -		goto err_gem_object_put;
> +		goto err_gem_object_handle_put_unlocked;
>  
>  	return 0;
>  
> -err_gem_object_put:
> +err_gem_object_handle_put_unlocked:
>  	while (i > 0) {
>  		--i;
> -		drm_gem_object_put(objs[i]);
> +		drm_gem_object_handle_put_unlocked(objs[i]);
>  	}
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 442eb31351dd..f7b414a813ae 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -161,6 +161,8 @@ void drm_sysfs_lease_event(struct drm_device *dev);
>  
>  /* drm_gem.c */
>  int drm_gem_init(struct drm_device *dev);
> +void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
> +void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
>  int drm_gem_handle_create_tail(struct drm_file *file_priv,
>  			       struct drm_gem_object *obj,
>  			       u32 *handlep);

