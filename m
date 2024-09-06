Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B0296EE53
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E0410E9BE;
	Fri,  6 Sep 2024 08:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="mKKfzZmL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK2PR02CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11010042.outbound.protection.outlook.com [52.101.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375C310E9BE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:39:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCJrheWd8Isd8iU1kOhduSBnyvt0v/ElHUA4ziVCrVrqWmldXhb7fBca4tVoSvSvS7zjzCqp2/laZImSeUekpW/bo6ZGZ3AqAiVU7RwgdQnWN7Rc8ZWkMDa7fLMSBnReucoc9w+RDMBsyYEKe+2BdW+wkvq0wyx1D7FfEAm2ZC8vWUWz1+q9d/75CndnaybvbSRcWycMME6WA9YX84Uy6gtum6WPBZqmCsLrCR9NoTkcAtizJ8S0+P5aChqo5/XNe5ki+gbAVSvLnG9vRlxY4sXI693qIwGTN54H6TWYxtXNyqWlGZk3RL4sJgfaUYKbzvbVB8YLorrWoRCaO3JP+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6Hu5MnXOrqtFa8K8m+8OLrjvjxsWDsv9L87TpXdzpI=;
 b=ev9HBt04iibz85KIeir5LTy+1qWMTm0s2wC87eRH84y9hHkA5+M7j8Bloz4BZGT5LqncmAE3jM5p1tlEAUufIxB2wf67XuTdLKj/I+0FGWuEt0cIzyNNOTqbxa+XOJ3GRxYu3dOoDXo7EhYMooFOsjimfC2/1puZv8EG6RxKCtiv1yBZFSeOy2K3tw9PQiBgh2ONrnw1tH4AY7KLYF5jkK+cUhgFk6i7HYWFYEYIi01Iz8Q7q4pqq3HBYwsXlQxXDyHrZj9MnsiCe2WI7UCMTfV2idXYjKszJH9Ok5MzcnFUIHu2I0yjG60P5Sr1KpF5Uy7CzaLi/X5oAvUyazKvKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6Hu5MnXOrqtFa8K8m+8OLrjvjxsWDsv9L87TpXdzpI=;
 b=mKKfzZmL7mMuMjZg4oH6ccOuauTQzUAWq1SJxs0AD9YHDNQOTjSdBA4UhRos6de8ifKleGFKPt4f0mZPUlCs0lYwgDfosIelbwc1P+gMmeTos9Qq9ki7oAS7K/3NUUZeR5TWzWl0k6Qq8WV0BdDdZUGKWWugQ/wFS0cZPUaCOIkAfrrMtE3YG7ET+sHihueSfLVT699XePMOVPPTQd1kglW/KaN+Y6SbW49UPwCophgUlI4hF0esFfUEZNxqch2PGgct7xvGaWXOxPn/qrCEVUzqLvwqne/xpjqLGedGuzf7DVfRVSkPmta4BTz15xtUchjaLZDDILkwtHHCAT6SSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYSPR06MB6501.apcprd06.prod.outlook.com (2603:1096:400:47d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 08:38:56 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 08:38:56 +0000
Message-ID: <5970129f-5787-424f-ad7c-ee8568a1734b@vivo.com>
Date: Fri, 6 Sep 2024 16:38:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] udmabuf: introduce udmabuf init and deinit helper
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240903083818.3071759-1-link@vivo.com>
 <20240903083818.3071759-6-link@vivo.com>
 <IA0PR11MB7185D06C33DEB9E1BC05EF95F89E2@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB7185D06C33DEB9E1BC05EF95F89E2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9)
 To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYSPR06MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: f945569b-a34c-400d-aeb2-08dcce4f5886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0xsV3JJSFF0MTBJUWl5V0cwQXdDaUUvQUFERXNVQ2Q0aWRIUlJENTBaZlBV?=
 =?utf-8?B?MWlEbkRrVzB6bkhDM3hKLzFXYVlxWHdOTFZuUjhVYlRURzhyWThacEZRV2pW?=
 =?utf-8?B?MzhJU3FLRk5qcHhrY2x0N01UdFZ2L3VqTG5UUi9Rd013TjNZS2J0V3dmQUd3?=
 =?utf-8?B?YlVKMEd4MG1rYmVzUVVXUlhBNmFVL245OVJlM0xYelQvSmFMYUtkbHd2bzFn?=
 =?utf-8?B?R3d5Q2JJVmdXYnhwRytrWmRSRm91dGI3cXJ2eHlWK0RFTitYQTBIZlg2anli?=
 =?utf-8?B?TWhwNTRsZVFhWVl4elZadmRUdWRaNlFFWk9UZ2QwYzEzYmpRRmRDazFrZDh0?=
 =?utf-8?B?c0tXSWl2UUpWZUxGTHZzM1lKTjJCL3Q0blZCb216aG5XRlNJdjF5T2VNUDJ4?=
 =?utf-8?B?ZDZDWmJkbFdiK2hjUVlCTGx1SjljaU1tcnAwb1FsVFA3QkVwYUxKajdxRGRM?=
 =?utf-8?B?V2g1SERYdWxRZVludVpkUjRZZUtFbHdDNDk4eVZJQTNxK0xReDdaclB0RHY3?=
 =?utf-8?B?UFNqUGhrRi9aRkdiRG83dHVWc0F5L1ViajFuR2V0dXU3cG93cDIrT1E4eDJo?=
 =?utf-8?B?WVVxdzJsTlNqeWR0LzRRTTBoalprcmhNa0c1STcrQjJSK0dFOHJOZ1QzV1RG?=
 =?utf-8?B?Vm0zaWZEYkVRSGRyU0NYOGNWRTRON0xHaGZlTlo1aFFOcmxiRy9NbXBYaVFG?=
 =?utf-8?B?V3BuVXN3ZWx6ZHVjMGJFNlc5Mmg2VjdqZFhCemY4UlJFOUVSajgyZjNrOCs3?=
 =?utf-8?B?djhuNzFHYjQrU0ZrcThzQWovWHorT2RsdFR3TUJrclhXSk0rVTAyRkZvTlQ4?=
 =?utf-8?B?dVBJRDIzWCtYUkUzMmNQUVI0RWxaSUh6VE5TdC9DQnhBbEFuTm90S1EwTnhn?=
 =?utf-8?B?bGk5bWxyeEt0cFk1K3ZLTStEdk0vWW5HM1J6TXc2cGFnNTBzNHE5Z0xRZldx?=
 =?utf-8?B?aVdDRE1PeFBMdklGWHpPbndhK3hHQ0RkZk9WVCtuYkFzM0hKTXdqa0J3Y0Fx?=
 =?utf-8?B?UmVXYTNIWmhpc2pWTFhrSCtIOUtZZVhiRTJCblVLekxTZWxwbWo5MlRkb20z?=
 =?utf-8?B?N0lpWkwvendnQjlkN3hHajdLK2RtQ2FoNDRNTjA0S01Wc1NOaTNZM0xGVXBr?=
 =?utf-8?B?TGNxTTdzTENQMWxtNFg4Rm9qRklpcGVYQkJ1bCtGNmI5eTFXOXlCV1Q1b0Fs?=
 =?utf-8?B?ek5jRVpLVkdTYUtCRS92bTNlMkcwYlFNb2Y5ZER1VkNTTDY2a1R0L1M4ak8y?=
 =?utf-8?B?U0paSGI2Z0Q3dzdKelZYMGV4UFo1aGFWdTI0RjEwYk9MUGRiSVd4bWlYdjVv?=
 =?utf-8?B?MXo1V013T0FaUDg3TTZCeGNSUUM3bjMrVVBxY1JmQ05ybDdXVTFsYllEWlFI?=
 =?utf-8?B?S214RXZxczI0SWZrRlRtY1FYL1dhK0tXZGNGSUxOMGh4UWpDY3BpVWdwaER1?=
 =?utf-8?B?dnIxa0k0RWV3ZFNXbUFXZ2RDR2U2UEw1WHlpa05tbzFmWFBwZW9GZDQ2akZW?=
 =?utf-8?B?NlFDOTNyYXo0M3hWbE16b3pQWTREcnN5RUw1ZmFrRjh6SUtCV3NDdXYxZHFL?=
 =?utf-8?B?WGl5VTd6a2dWSGV0ZUtGWU9PdjcwZTM4MG9aeW9TM09zNHYyM0xpZHgxQkRM?=
 =?utf-8?B?Qk1jVEtQUG5HTmZDL1lBVWh5V3NLNVZ5WEVrbG1KOFd5MVRKSk1sRDlTZnY3?=
 =?utf-8?B?V3VoL09IbFlqbEtHUEFpSFpsek1PSGRGV01mTVY3UHYxd0F4VG9XalQ1anVS?=
 =?utf-8?B?ZkhxL0hCSWNZVlhuYXpzT2gvakk5K1hSWmJLcVVvbHdQWTdFTkFkN2gxN2VR?=
 =?utf-8?B?Ni95V0tzemkySTNaOVZ0YXZobHhERTQ2eGlTbU1weFB5QTMwTCtRTng1cFBT?=
 =?utf-8?B?QUFpRGxlU21MSGgwY3pHOUI0N0RLNFJwZlozZ3RxR0g4dkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2czTkl1amU3VDB3WFdyUGo4UXJwYm5rZDc0ckh0NURoQXlNdFB4U0hSV2lK?=
 =?utf-8?B?OWh5UHRRNEVuTldWQzNUK0d3OVkxRDJOeWozdW1hWmtvNXAwcUgyYW9lUVhG?=
 =?utf-8?B?YmsvaVdXTGc2ejBTNGhaNW5KdXcwZnlYQ25YZWpBRmFxa1NrSngyWmVhOEVt?=
 =?utf-8?B?aE04WlgwV1JiTEx0Z3J3ekh6NGFZZ1pjS3I0TDVZYzV4UTFvemZEclRNdUZw?=
 =?utf-8?B?dmRma2wzSGpud05tUTNGL0lZZS9BNEgzdVR0WGJMb2hNVDhiaTVSOUF6R0ti?=
 =?utf-8?B?NGY1b3dEcVkzU3lQYzRveTNEK2cyRytQVStWN2hFK1hLVndza25PVE5ZQzFB?=
 =?utf-8?B?RDlEbjlrZkJ1R2E5Z1BsaDJMYnRtRWkzRkN6RDZrYndYaDNrUDJ0VWNqN0M5?=
 =?utf-8?B?V0JyTUxZN2pKL0U3RnBvaEpQb0MyVUlSTmU1UkFYbFpNR2ViSmpGOUZ6YUk5?=
 =?utf-8?B?eUpEanVFbjc0MGowVFFmSzUzcVdqejM1TVJGTDNOS2hwWHZPZVBadnlRWW1i?=
 =?utf-8?B?MWtSMnpnc0dWVndVTWJLcmo5SFhtQi9VaXJRRHdXVU5lcUhVSzBKNW1zRVJo?=
 =?utf-8?B?eEVZUmJiYWhQbHVuZGx2WVREU2loaVcwZ1JLN2R6Z1NOaStSQjJiNHQzVDhZ?=
 =?utf-8?B?MkV1RGk3dDBtT0xheEs4SlBXZEFTRkFLQ1MrbkpQWGtYbi9HV05BclFNTFlL?=
 =?utf-8?B?OXBOQ2FDN2czazhxZFEwY0FkUHlheFZZNWlVKy9sZHVoWjdUejRjK2w2ektw?=
 =?utf-8?B?cFhWSjkvanI3U3ZNaE9CRERvTVNOdjJqMjFQeG9EM3IyS3BFYUlsOVZsWTlZ?=
 =?utf-8?B?ME5hVndrYTVENTI3Z1pMdG1RL0JCSnpPUUtjMng0UHV1NVRuem1xSGhxcGJH?=
 =?utf-8?B?QVArQk54MUprRUxYV0FSOFBMRXZsV3lPbk1ENHBXdlZmZHBkT3dpK1g2eURx?=
 =?utf-8?B?VDdCNE1JQ2dHWkhzOGIzYzdPdyt5SThpZktpdElxR2trbUFwdGlSWXZIVkJk?=
 =?utf-8?B?dDFMQmJaNE9DM1BPemFoM2Y0cXU4QTRGOWlqa0N3d2VQblJKZGRaM1FjWnZo?=
 =?utf-8?B?UjJnclNJT0RRTmZYRlJCMWRqREozbjRYRHFscDN1ZDM3WTAzSHoraFROQnFW?=
 =?utf-8?B?U2xwS1NYdzhaU3pDbmtEQ1pMSTA4bjVQUW9OZUIwa3plZDkzRFF6M1hkZ2lE?=
 =?utf-8?B?SHhnTHNRN1ZQMVM3S2ZBamdpM3llQUtmcmlSYnFrRGxMRnRCNVZSdkQ3QUVv?=
 =?utf-8?B?blh0K0YxaGpDbzcrbGZDdnJjSUVYL3dKb2Q1R281SzRBU2xab3ZZdEV5L0pL?=
 =?utf-8?B?WitobGZzb2gyamMvOEcyRGx2dzVKK1ZVNGVLWjd4WC9FR3dWdjlWWVduTEox?=
 =?utf-8?B?RkEzbEVLZjZjSnRaNmJoSlU5c2dqRVJzMUpFTFRqS3FsYWdmMWVIbWdacFhU?=
 =?utf-8?B?UDU3Wnk0RkcvWFdvNE5UTTlHU1lWeCtmTWlNcWJGblE2TWJ5MFJSZE84TDlz?=
 =?utf-8?B?ZDczTHhSb1BBaEtsQmdYU3gvNFNMcTFkWmVvZVlvMi9sUGttRHV3RDNmYVFR?=
 =?utf-8?B?bUtBM2g0Wm1tNVMzNDJodDR1V0hFbGhMK2FzMlY2VzY2VHdDc2tWUWNYUHk2?=
 =?utf-8?B?TDg0TUVDSjBtMGRXd3RrMGQ3dEdHNE55RWxUc3FEa3M0MDg5S2JoUTZZazNI?=
 =?utf-8?B?dEhjV1pRbm1ETFJ2YnpnaTUzanFEZ3pvdzZFcTRYbEhTQlZWS1dNRmNZdTh2?=
 =?utf-8?B?WXZzTVJ3S2s2VGhXeVUwT3RVeW50WjF4bVV0YXlPQzBxVjdLMWZidSs4Ymxa?=
 =?utf-8?B?NHdoVzE4LzMrZG9oSFVwKzhUcVl5dmY2b2pMOXh5SDJtVnY0cXBjd0Y4Yk12?=
 =?utf-8?B?aGh5aVhvZW11bXcvbEYvSmZLMHMvSkVpTUJ6NGsvRllrTm9BYjU0YXFoYWEv?=
 =?utf-8?B?WXBEZWp6QmZzaTQwN0hreEx1TGUrbGhNUmNRdWxPUVJpeitIR3dxUGM3NjBs?=
 =?utf-8?B?eGt0RE4xT3pRNUNXL1Q4ejBDaS82ckhjNWt3ZXlVVXh3R0JhdTB0eW1FZ0d3?=
 =?utf-8?B?QzM3UHUzaE5JdUFBTllxRFFKc20rNTFxeitPQnJBUnhRTTZNd0pKVU05R0Vn?=
 =?utf-8?Q?qtraTNPju0GrWmijQr9ZMOh6E?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f945569b-a34c-400d-aeb2-08dcce4f5886
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 08:38:56.4343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4S/Uoc211/FWaGLLkG4Ami5FRCLFoALI6pVn2bVsMGEKsq5MIN6rgc5lBsI7/Xpggaqy+ljH8vRBEttCZI1Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6501
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


在 2024/9/6 16:20, Kasireddy, Vivek 写道:
> Hi Huan,
>
>> Subject: [PATCH v5 5/7] udmabuf: introduce udmabuf init and deinit helper
>>
>> After udmabuf is allocated, its resources need to be initialized,
>> including various array structures. The current array structure has
>> already been greatly expanded.
>>
>> Also, before udmabuf needs to be kfree, the occupied resources need to
>> be released.
>>
>> This part is repetitive and maybe overlooked.
>>
>> This patch give a helper function when init and deinit, by this,
>> deduce duplicate code.
> *reduce
>
> If possible, please try to improve the wording and grammatical correctness
> in the commit messages of other patches as well.

I'll fix it in next-version

>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> ---
>>   drivers/dma-buf/udmabuf.c | 52 +++++++++++++++++++++++----------------
>>   1 file changed, 31 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index ca2b21c5c57f..254d9ec3d9f3 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -226,6 +226,28 @@ static int add_to_unpin_list(struct list_head
>> *unpin_list,
>>   	return 0;
>>   }
>>
>> +static __always_inline int init_udmabuf(struct udmabuf *ubuf, pgoff_t
>> pgcnt)
>> +{
>> +	INIT_LIST_HEAD(&ubuf->unpin_list);
>> +
>> +	ubuf->folios = kvmalloc_array(pgcnt, sizeof(*ubuf->folios),
>> GFP_KERNEL);
>> +	if (!ubuf->folios)
>> +		return -ENOMEM;
>> +
>> +	ubuf->offsets = kvcalloc(pgcnt, sizeof(*ubuf->offsets), GFP_KERNEL);
>> +	if (!ubuf->offsets)
>> +		return -ENOMEM;
>> +
>> +	return 0;
>> +}
>> +
>> +static __always_inline void deinit_udmabuf(struct udmabuf *ubuf)
>> +{
>> +	unpin_all_folios(&ubuf->unpin_list);
>> +	kvfree(ubuf->offsets);
>> +	kvfree(ubuf->folios);
>> +}
>> +
>>   static void release_udmabuf(struct dma_buf *buf)
>>   {
>>   	struct udmabuf *ubuf = buf->priv;
>> @@ -234,9 +256,7 @@ static void release_udmabuf(struct dma_buf *buf)
>>   	if (ubuf->sg)
>>   		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
>>
>> -	unpin_all_folios(&ubuf->unpin_list);
>> -	kvfree(ubuf->offsets);
>> -	kvfree(ubuf->folios);
>> +	deinit_udmabuf(ubuf);
>>   	kfree(ubuf);
>>   }
>>
>> @@ -396,33 +416,24 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   	if (!ubuf)
>>   		return -ENOMEM;
>>
>> -	INIT_LIST_HEAD(&ubuf->unpin_list);
>>   	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>>   	for (i = 0; i < head->count; i++) {
>>   		if (!PAGE_ALIGNED(list[i].offset))
>> -			goto err;
>> +			goto err_noinit;
>>   		if (!PAGE_ALIGNED(list[i].size))
>> -			goto err;
>> +			goto err_noinit;
>>
>>   		pgcnt += list[i].size >> PAGE_SHIFT;
>>   		if (pgcnt > pglimit)
>> -			goto err;
>> +			goto err_noinit;
>>   	}
>>
>>   	if (!pgcnt)
>> -		goto err;
>> +		goto err_noinit;
>>
>> -	ubuf->folios = kvmalloc_array(pgcnt, sizeof(*ubuf->folios),
>> GFP_KERNEL);
>> -	if (!ubuf->folios) {
>> -		ret = -ENOMEM;
>> +	ret = init_udmabuf(ubuf, pgcnt);
>> +	if (ret)
>>   		goto err;
>> -	}
>> -
>> -	ubuf->offsets = kvcalloc(pgcnt, sizeof(*ubuf->offsets), GFP_KERNEL);
>> -	if (!ubuf->offsets) {
>> -		ret = -ENOMEM;
>> -		goto err;
>> -	}
>>
>>   	for (i = 0; i < head->count; i++) {
>>   		struct file *memfd = fget(list[i].memfd);
>> @@ -446,9 +457,8 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   	return ret;
>>
>>   err:
>> -	unpin_all_folios(&ubuf->unpin_list);
>> -	kvfree(ubuf->offsets);
>> -	kvfree(ubuf->folios);
>> +	deinit_udmabuf(ubuf);
>> +err_noinit:
> I don't really see the need for this new label, but I guess it makes things a
> bit clear.

If not this, each list err will need kfree, I think use this more clear.

Thank you. :)

>
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>
>>   	kfree(ubuf);
>>   	return ret;
>>   }
>> --
>> 2.45.2
