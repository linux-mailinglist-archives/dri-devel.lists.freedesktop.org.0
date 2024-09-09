Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3B5971331
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28E810E341;
	Mon,  9 Sep 2024 09:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="nJg+gNv7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2043.outbound.protection.outlook.com [40.107.255.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C3910E341
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 09:19:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmJ7oQ5glLOYLbnX5sUr28Llpl+g2ck0WbNTeV9UjjCq5CrDxWEMR0aIxB3svbY1pRh2jV8WM/qybvKHQOo4++hq8rRF1w3HRVPj6f+lYcw0GjCm4r5/6xn2Hv9HtSRpCd0iDBVl5smMuogEb7X6e6QaBAhb/9FUH6adeAxc0MbZurVJcfAS5qk59ff2McVEaWtag77SLdfm22VFIZVS7t0UoMxqigAslsx7gIkAB2ADywzvrNwS+Jn1lmQxfi1ymFpIrVSi8fwefZj41hvJrCIPZcKmU/+I6TkP0KrGYYhBX8lB8zMmBxAhHnPTza53pdRkwQ16g7dVoA9zYeqPFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82eGfnCbo8KkdrPCLtzYYdJ3/a5cBJrrBEqwde4qPso=;
 b=fyQxOWluupoCeWtxGEYlei1+X+dXhWhXiV3mFPZe1JvA9N9BV7Yzq8oz5oLzEuv1+EE+AZBwrV4dDABs67nWkrHL+IKd8MnB2B1Mtp5GzT8ROoFhDCAHLESKf6nVTT2X3lUydTYUca9QcKpjsNA7+R8KZrBZZz0FCxzVKNFLQFyuW+KQS7B9fYC0moKO1rcGEkjmwqgggkTErN82AalzZ1ENC0y+JzSCYHPAfNpG659ufdxSibF6G4jln+0s6Q4f3oPMkFS6pXHBpm/9uod6cjKP8gVAAqnHhylqA+OGIlLdPV0w8S+2Ghy6Hi/nHIlnS32OVup0ZgP5MoUTp51rdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82eGfnCbo8KkdrPCLtzYYdJ3/a5cBJrrBEqwde4qPso=;
 b=nJg+gNv7IZPWRaBmdPdmoDdKJKuzWlPlO9g8KvdYei3xNQjX7OATf7a28FVHiF9JM16iWEij/Pvvt/whlVt0IYnPocwZJP4gWK7EwzbBr3dBbxlI6abRf84M/OAyhf23jVAcN1ui+5lEwQ07+RIEPFsBg6FMlrT2iciTnb9CaEU5RfIW+/RiuSkOIDR14+TzzjuPzREc1bsok4cMxvbODBKv4rQsZZ7UZMOoibixUcY3AEPvynb3CpqI6o59gwyOMQWTe18OxHsYsVQBrugkJKATh4PiSg5s/saeTWPSL3JIvrDyRITcfx3MCPIyrg0yIltnhOsjXPLBfjQ7eEnyFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by JH0PR06MB7180.apcprd06.prod.outlook.com (2603:1096:990:98::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Mon, 9 Sep
 2024 09:19:06 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 09:19:06 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v6 0/7] udmabuf bug fix and some improvements
Date: Mon,  9 Sep 2024 17:18:38 +0800
Message-ID: <20240909091851.1165742-1-link@vivo.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|JH0PR06MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: 4230fead-4628-4670-7f02-08dcd0b07411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0Q5US9LY2ZMYUkreGFHNHhFNHRlSUxrQ1YrWUpWbUxCUEhUYWFUeThxcnVw?=
 =?utf-8?B?a1l6aDJqVlJ2UWlRTklxNFR2bHRnNzBRYlBSRjdHRElEYVFHTnpkR1Njd2U4?=
 =?utf-8?B?bkk0QXJab21NMXZyMkJrWWdHaXEvekVTNlQ5NXJmS0QySkRPc1FGeDFnZkxV?=
 =?utf-8?B?SWlxQWVHOW85c2VTZnBwdzN2YUZIK3FsOEZDS05iNnZmVFBnTnFPaW5QTHhj?=
 =?utf-8?B?OWRKNktHVnppMHNpc2RlVlk5TzllY2kyWVFScDFkVFE3bGdiekFUaU9aZFJY?=
 =?utf-8?B?emFtQlVoVVE3Q09ZVUtRdTFRMXJLWFU2Ymhxd01LaW1WdXZmaGliUTE0TDkw?=
 =?utf-8?B?MXNnenNQQzBHbUpRcHA3QU9uWjhiTkxKYzJFSWsyb203RkJHTzRFR1BDLzRj?=
 =?utf-8?B?d1kyODFKYW83cGh4elpONkdldVhFaFNJR3dRcVJWV21iSHJRUjZDSW5XMUdr?=
 =?utf-8?B?NlFxdFVsbjE4S0phN3BjcUxmNkNFSy9sNy9yMVVoa1NrTDMyZEQ0N1E0Qm40?=
 =?utf-8?B?cndYVkFjL3d3SHptVEhidUVNWmY0WEszcVY3K1RPQ3l4dW05aDZ3SGNodkJS?=
 =?utf-8?B?OWc4dVJzbXBsaCtNczcrT2gyc1VSTzhkK1RnS1NKV2NrUTBiN09XNFErNFB2?=
 =?utf-8?B?UmJ5Q1YvL1ZUR0ZVVGEwWTNWTi9rWlpZZUN6SmVsczBzN3o5ZTlUNE1jOVgy?=
 =?utf-8?B?enZhYm1rekhRdEtsdTBPWkNTNGlRdTVwZW1mY3AwNDJka215em5EWWxrWjh6?=
 =?utf-8?B?d0tWTWhXTEQ0NENaVmt5ajlqZFJZS2lKcVlMK1dSaW1UVGducTdVRkVpTUVw?=
 =?utf-8?B?dnUwUWhpb1ByY056cWY2Y29tMjhKY1YvQ3g3TlI4b3E0ZGlsWDlXaE1wcTRp?=
 =?utf-8?B?d1I5WUhpck1wOGE5V2tab0tLNFAvakZMNGpBRC83cVc1KzVFUW5yN3FaM0NE?=
 =?utf-8?B?T1dtWEN2YUdscG1nSUwxT3NHL2Fvcm0wTjd3NE5Ncml3dEVwV0tDSkdRTWVt?=
 =?utf-8?B?K1ZMWStERS81dTZ2SDdhc2llTHBNYW9lMHdNNHZSRmw0b21NTzFSelRlcUhS?=
 =?utf-8?B?WUdBenBxenhLblkrTjBHTXJzdW9JWnBLL1ZBS25Rd0FUQldGY0sxS1d2ajN0?=
 =?utf-8?B?VURvWTNtTUp5YW1MV2xLelk3MXdMcUgzb3pWTlMvTitPN1VjMW5BSksvZTFw?=
 =?utf-8?B?am1mdFZtUzQ2Wk5ZbHF6ZVpDTUZIWDhDSWd4b1VkNSsycWV2NWYrTjNYQWVn?=
 =?utf-8?B?U0kwdzZpM0hYNkVDWXJNTWxzeXVPY2FUeXpPTHQ3bzN3aldic0pxZ2czRFBW?=
 =?utf-8?B?Q1l3M2k0UlBHQlc0SjdRV2ZqOWlVelhoK2JtaXBHWGJuU3c3V3NlaktrMXdJ?=
 =?utf-8?B?bEEyZ1JDUC92Qm92cThTOFN6ZHB4UVRZSEFvWW1RWDFrZjdMZTVpVFB1ZGVL?=
 =?utf-8?B?dnZWbWlMWncxSWZ3anNmN1JscFNpU3g5VWk3aER6OVBKRCtXTGx2SnMwS3NY?=
 =?utf-8?B?RzRHOUxIMGtmU043WDE4UUV5SExKcFlhK1hoVlVkSHNreHBVTFdxVGRJREI3?=
 =?utf-8?B?T05iMkorbzJ0dUE5VFcxM2hSYkw4aEdtdUdkM1FvckVxb2VOQ3FHKzMvYVJw?=
 =?utf-8?B?THcxU25NMXhySXh4TWVnZE1XZERxYjJIblR4ODk4cG93WFBKQnR0ZXppTnd4?=
 =?utf-8?B?dld3dUdrSldqTEhiQlRCRHNiazc2MVFPM2hSNTk2NFQrUDZ4NjlodDJ0YjJX?=
 =?utf-8?B?c0FobHJwUHZUQUxFZmF2bVowemNEY29abzY1ekt0cDhjODNSbXNsWDcvSS8v?=
 =?utf-8?B?c2tWbE1JaXVKS2NqaFpXWkVnUG5CRlhNNU1iNDVQbGk2ZFVCZDF2anQ0eEVZ?=
 =?utf-8?B?UjFrdkJ4eUFuZktjeTcyNFlETGxYQzIwVkJKalNVeStpVlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGk5K00xL1NMSjF1cFFiWmhNZmYrclJHZW15Mk44Wlpja0NNZVlSOXNJdnFT?=
 =?utf-8?B?WHlCdVgxd084eTdrbyt5YmdXL0kxZ21hWCt2YTJ2ci91T2xGZDRXNk5ScndQ?=
 =?utf-8?B?UEx4ZjVFRFF1M0dLckdWOHdmNkJoc0JwRXI4QzF6eGFwRVhhcjFxSy84NHRY?=
 =?utf-8?B?dG1XM1NFZWJvd3QwL0d1OEdjZCt6cDREWUQrZnhJdjdPWlNRYnFOQUptQ2JR?=
 =?utf-8?B?ZWpuZzNrWnkvRmc0azc1OGdiZlNZVjJQSHFJbEVqYTJ0cnl1Q3RLbFdPb1c1?=
 =?utf-8?B?STJ2eGNuZmFqZ0dOc1l1cm8zMTUyNnZxandzYzYvS0w1VjBPSVZyUWJGcjEr?=
 =?utf-8?B?b1NybkQvVGN6emJEdEwwSDFiZGxrcHB0eDhIRzJsYjRUemNvcnphYTRZVjF2?=
 =?utf-8?B?c1NHN1pyb0dxNWU1UVNqV29uMEFEV0VoWUhhL2JUcFY0bUhwcGxpem5VNzl4?=
 =?utf-8?B?NnB3bllpaXFScU1BYzBWajRjRmFCR0hsejRLZTMrSHoyWUxqamJIS1Nmd1Ur?=
 =?utf-8?B?MDVyeVRiQ1FIREpjVFMzdS91b2xmVXlNamVqcm5sYUFqQUNWM0kvNEY4T0ts?=
 =?utf-8?B?WW9Yd2hPZTBhck94a2VlbThOMWVKelArQkQ4LzFNQjFHemg2RHBOdHhlNTZU?=
 =?utf-8?B?QnN0TE1tcXoxUjh3SnBxQWVuK1RNd0FmVWpYajc3aXNvVmFRanFaUHFmYlc0?=
 =?utf-8?B?QldLUzdJL1g3UHdTcWcvZllQbTJmbUcxaFpjMjhkNTJMWU9xRlFUVUhXdXZR?=
 =?utf-8?B?Q05Cb0RIZS9qem01c0VGbkR6bnNpWVdVbjFIWHNONE1GZ25XT28wZTVHVlZx?=
 =?utf-8?B?dzh1Z2VXWlF4TURYUjIxTE9xYXo2Q2FlMjdEU080Zno3SUZ2NGlkY3FsVHFJ?=
 =?utf-8?B?Q3loaXJzbWZUNTA0Z0hZS0F3QXI0aFc3K1lrYXU5dFNvUHpwMWFQdFcvaUdL?=
 =?utf-8?B?cjdhWGFDVFI0YXZIRXRDY1IwcDlna1RGMXhLUzNjYVhYZ1VoNnVXRjN5eC9h?=
 =?utf-8?B?akNxcGdDR1RDRWRZa0haQXM3NSt1TFB4V1pnN0dGNkRjZnkwNFVsa3FzLzVp?=
 =?utf-8?B?VS81ZE5xbkNQQnB4YkVHSnpIVGEvc0ZxV01XNXJlazBZKzZsWG1WVnM4ckkr?=
 =?utf-8?B?SkRTdUdIbHFRTDJNYkQxejAxampNemcxTTdIbVFSMTByazIva1lId3Z4VERL?=
 =?utf-8?B?UlpUSVZ6Nnk5aTNPRzAwL0RaTEE4Y1lTU3YvRmIwdjdqV01tK25QbE1zcTU0?=
 =?utf-8?B?Ymx0V2dkT0gwVVB3VlNSaEV1YkZrZ3JCZ09Ocjk2S0F4ZnVxeU5TeVFobE96?=
 =?utf-8?B?VUVaRzBGUy9ZWkMwUUJta1Z1Q05NWVlQM0t2S0g1bmJ6Rmx2cVN3YVJMQmtL?=
 =?utf-8?B?NVo3MnlPS3dhRks0M1NBVGE3RnB6bWRtMnpzWXRTRzB3ODlUSDhnVldqeUwv?=
 =?utf-8?B?ajArL0NuVnJCU3FLV3ZQNkNXT0RuaGZmOGVyMFlHMWllMVB6aVpGNVJUQTBS?=
 =?utf-8?B?RG9acTdSemdMdkgzTElvMlZIYnppSTRreW9uTy9ZeHRQQlc2N25HZllWeGdl?=
 =?utf-8?B?OXJUR1JwNjg1TkFpdFlmcFBlYTlGcXN0VXlXczdkb1V6UVZnWWFtT0tKRnJT?=
 =?utf-8?B?SnRwWEtUcER1cWZzbEJCREZXUzcvczFzRkg4YWVDSEJXNmdWVjRhUDlwaHFv?=
 =?utf-8?B?dm56Sk9PYkkrcld4cEY5Wlc5SU1PcHVVTnRDbkpLclFYZmdlWHUvWWtUenFy?=
 =?utf-8?B?WTRZTDlNOUlWZWY2TXArbUpBNXZrWXBpSEFMZytNZW15V2xMTldpaWVMRTV0?=
 =?utf-8?B?eXNDYWpnQ2hXL2xVdEpncUx0cTJQd1B1cjFCUHUvWWdML1FOYUZBTDMrcXpY?=
 =?utf-8?B?aklCUjYxeG9jOGVwS3gxOTBIblU4c0R5ZUNjUlpRMk1YRnBFOVpyZ2tiRUJY?=
 =?utf-8?B?eHduVXVJaUdlTi9QN0p0YU9MMFM1SEtXczc5bXU2N1R1U2xHVjRFM1lpT2hv?=
 =?utf-8?B?cTkvOXF1TUpwdmlEeUI0RE5RUU1GWEJpSkcvb0N5L1BTZ1NiYW1SQmE0WlR2?=
 =?utf-8?B?Y21FN0xMRFMzTnFXSGpVTTVZcUZQWDRRM0FoQnZTMUc4NUE1MmdOYVhnRHh0?=
 =?utf-8?Q?UPKjEGt1Tv9oZFQa/D8fdY1AO?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4230fead-4628-4670-7f02-08dcd0b07411
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 09:19:06.2222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /UpAnwgNq7e01R/iF+s1Qfuc1KNslZY3SLw+XbOvBxYpCNueKjn66Maj/mMi88tpiIpTeDBfKqhGnuoEmE0w5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7180
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

This patchset attempts to fix some errors in udmabuf and remove the
upin_list structure, also try clean up code.

By this patchset, udmabuf remove page struct relay, only use
pfn and folios.

Some of this fix just gather the patches which I upload before.

Any patch has passed the udmabuf self-test suite's tests.
Suggested by Kasireddy, Vivek <vivek.kasireddy@intel.com>
Patch6 modified the unpin function, therefore running the udmabuf
self-test program in a loop did not reveal any memory leaks.

Notice: Test item 6 maybe requires running the command:
  echo 1024 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages

Changelog
===
  v5 -> v6:
    Patch1 use Vivek's comments(thank you), fix code style, update ack-tag.
    Patch2, 3 no change.
    Patch4 fix memfd miss fput, use Vivek's comments(thank you),
           fix code style, update suggested-by.
    Patch5 update ack-tag, fix error word in commit message.
    Patch6 update ack-tag, use xmas style.
    Patch7 update ack-tag, remove unused ret variable.

---
  v4 -> v5:
    Patch1 doc why pre-fault failed not report error.
    Patch2 no change
    Patch3 update ack tag marked in v4
    Patch4 split some change into patch5 and patch7, this only contains
           udmabuf pin folio's function
    Patch5 add helper init/deini to clean udmabuf struct initialized
    Patch6 remove unnecessary code
    Patch7 remove reuse folio remove v4 patch4

---
  v3 -> v4:
    Patch1 fill vma area with pfn only when true access.
    Patch2 no change
    Patch3 select VMAP_PFN
    Patch4 use function pin each item.
    Patch5 use pinned folio array instead udmabuf_folio struct.

---
  v2 -> v3:
    Patch1, avoid use page, instead, use pfn, and use vmf_insert_pfn map
    suggested-by Kasireddy, Vivek <vivek.kasireddy@intel.com>

    Patch2, update acked-by Kasireddy, Vivek <vivek.kasireddy@intel.com>
    And keep the kvcalloc on the same line.

    Patch3, avoid use page, instead, use pfn, then use vmap_pfn map

    Patch4, split v2 patch4, single update codestyle to keep review
    easy.

    Patch5, another way to remove udmabuf_folio
    
---
  v1 -> v2:
    Patch1, 3 Rectify the improper use of the sg table.
    suggested-by Christian König <christian.koenig@amd.com>
    
    Patch2 add acked-by Christian K�nig <christian.koenig@amd.com> which
    marked in v1

    Patch4
    Modify the data structure to restore the use of pages and
    correct the misunderstanding of loop conditions such as "pgcnt".
    make sure pass self test.

    remove v1's patch4

v5
  https://lore.kernel.org/all/20240903083818.3071759-1-link@vivo.com/
v4
  https://lore.kernel.org/all/20240822084342.1574914-1-link@vivo.com/
v3
  https://lore.kernel.org/all/20240813090518.3252469-1-link@vivo.com/
v2
  https://lore.kernel.org/all/20240805032550.3912454-1-link@vivo.com/
v1
  https://lore.kernel.org/all/20240801104512.4056860-1-link@vivo.com/

Huan Yang (7):
  udmabuf: pre-fault when first page fault
  udmabuf: change folios array from kmalloc to kvmalloc
  udmabuf: fix vmap_udmabuf error page set
  udmabuf: udmabuf_create pin folio codestyle cleanup
  udmabuf: introduce udmabuf init and deinit helper
  udmabuf: remove udmabuf_folio
  udmabuf: reuse folio array when pin folios

 drivers/dma-buf/Kconfig   |   1 +
 drivers/dma-buf/udmabuf.c | 272 +++++++++++++++++++++++---------------
 2 files changed, 169 insertions(+), 104 deletions(-)


base-commit: ad40aff1edffeccc412cde93894196dca7bc739e
-- 
2.45.2

