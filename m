Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C765CCB5B3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 11:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEB110EDAC;
	Thu, 18 Dec 2025 10:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hSvXgmcG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013000.outbound.protection.outlook.com
 [40.107.201.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430F610EDAC
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 10:25:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/THLjtRdwlqJ8gvKyvavwt5nc5cqty/FzIotrwS+MZoea1ff+N3RbbWiGvIMnZH+k9UWpuPS3jZkDBGWpp5Hto/lOadeny8+YvJZAUh346L97gzaCsfu/9HdEsUcoOMpzRHVhJ45RbggnSgCnfNzl4oW/Bsozk/LjBZY6GJhdvkVYffl78O37drryC1sKiKgNYjESnemWpwcslRztXWqkHfkCLhzJx4dLMQea5KtMl9JEJdvoFC6qjMhtrvn18sfbzlw/wNWASjHOxgNiT7OW4XD5Xf/13TZ2Fq9rqNE2jRmNiqDmrYg19WOAViLU1Xy2HzlrRpfJwjzsCxXlgjUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRc/hdKRhiN6D2NNQ9i5AjaiF6d+r8aFLs7TmJP9N58=;
 b=y4qqEynQrEc1qUn7wBWh1H/lMnJbGYoGf1uE6hirKbU1tD7Vepl9WVyF3pNXdnv8IqAn6sJHvIkh/3rjSmgRb5l61P2+wF6C/AtRiMCen5Zdr7+/hivt/zOJBhMPwmOzLUk9eCtnBS5MnxU3vlO6IeuD1MjNtUaMrVhDQp7BcrrIg6tNFRN+JYAAM3zZBZzSP6GKDNqTmT5QjLuutY9pMOBAP+8rGB2k2ZbJIo2nApfn+7d2JmobkMkk7Cz9cBOEtNm2EwEaYLriWcV4rLNTZ4fDcarJRx1WGNNgHdLVSZuQ6rzbzyFdB3GuUKLN3Tahy8LssVzRIIK+HBnKTlAdwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRc/hdKRhiN6D2NNQ9i5AjaiF6d+r8aFLs7TmJP9N58=;
 b=hSvXgmcGeVqEEGEp42DpcAIXIzzMLT8kITdb8iZovYTkO9DhYHXzPsAxDkqLHl3bp4DpMRdVepgIXxCx/aKtbZ+8n66rORSDHBFRXYNdDohFt/G0LBPlvNsJ76QqWlPEWK4cck7JBy6yGZ78M+POx/rtX+Zb+hfzu15DmUS1diU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ5PPF75EAF8F39.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::999) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 10:25:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 10:25:52 +0000
Message-ID: <eb2e048b-ac39-4379-98b8-6dae2145be7e@amd.com>
Date: Thu, 18 Dec 2025 11:25:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] dma-buf: add some tracepoints to debug.
To: Xiang Gao <gxxa03070307@gmail.com>, sumit.semwal@linaro.org,
 rostedt@goodmis.org, mhiramat@kernel.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 dhowells@redhat.com, kuba@kernel.org, brauner@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org,
 gaoxiang17 <gaoxiang17@xiaomi.com>
References: <20251218062853.819744-1-gxxa03070307@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251218062853.819744-1-gxxa03070307@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0616.namprd03.prod.outlook.com
 (2603:10b6:408:106::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ5PPF75EAF8F39:EE_
X-MS-Office365-Filtering-Correlation-Id: ac3a14a9-ac5b-47c7-62d7-08de3e1fd225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enVLc21xM2dkZkhrelNZS2ZjY1FOSjd1bFh3cDlQSzFGL08wbEd3ZUkwdE9s?=
 =?utf-8?B?ZlFUQXg1c05ubmsreHlmaVJmeFNiejY3elF5MCs2RXFMT0xBTXppeTQ3Yzhu?=
 =?utf-8?B?bDhpZ05MdU1BYlk1QVVEUmtId04rMUlOdnc0M09IR0pDZ0FiU05OOS85K2Jv?=
 =?utf-8?B?aE0vQm42ZDRhYXROQnV0OHFYQTR2VGk4SjZRNE1tYUltQ3RSWktSQ3Z3RG9E?=
 =?utf-8?B?VnRSMmROSDZOVmFNL0NPNTd0cWFZN2JzbVZ6dnlmcmVrNmFQVGRFc3hCRkZC?=
 =?utf-8?B?alY5aENZTXlIak1hMmVBMGFKRFQ1akVvM205d2J5dkdNSU9IZktHRDlxQlVq?=
 =?utf-8?B?VUV2WXhsSjVtMXRhS244TEZPKythdm9ZMklqSit4UjZ3dXY5QThtc3NtY0lq?=
 =?utf-8?B?M081MnhvNmlQeDg0cDRGWTVmcmxwVW1uc2RIOHM2VCs1MUErQzJZMEVTN3Ar?=
 =?utf-8?B?bDJoU1JIUUo5Vyt3b0lka0ppQkFTTW95UHJEK3FRUVZubGZFelB1Qll3cU1C?=
 =?utf-8?B?TWtDUXpoekJXam52TGcyMFpGZWxzZU0vSHZlc3dGdVJ4NXpnc2JxR0lRVWF3?=
 =?utf-8?B?TFdWNHBndW1NeXhCYzNxUmpYMFJNZnFmYWpEZWxCNG1BMGVVZ29TRGNsOEJH?=
 =?utf-8?B?S0lEMDRXRWcxY2VIenJZdHA0RTY5T1JkdU9zaFd4TEQyZDJVZDYvaURHL05G?=
 =?utf-8?B?bUlZeHhwb1YrcUdyRkVRQ1g2M2h3UFB0ZmxiWnZHVW55cm9PaWxwRkRSVnV2?=
 =?utf-8?B?TFpYTEpBVXRJaUNkOUpjamFJdklzYXp3Wkd4b2JFM293bCtkVTd5N21rQ1Fn?=
 =?utf-8?B?WFlGTHltZjdKdGJDcDk4NGZRcGFVZ1Z6enM3Rld3SklxR2MrZ01JWlFxM3dH?=
 =?utf-8?B?TURIWCtuZ3RMVDYxMmNtVys1R3VPY2ZsWlFCbEREMDNMNXdURmNaYU1ZTm5J?=
 =?utf-8?B?M0hzdGMvdDV5UkE5aVBBUEdTOFUreTg2dFk4L2tXWnNYdnF4SGtpN0d0Vm5C?=
 =?utf-8?B?b0JJUU5sM1cxMUwxYnhNRi9pVG52RG9wYmd2SlozN09TZDNlTE1sS2cwcjFD?=
 =?utf-8?B?ZkNERWcxdFBOZXJIb0paZG1neTE2bml2SUNJcUJvWXFiR0NYWHdNMVZyTllv?=
 =?utf-8?B?ZmRRVTJPOFBEeS9SWS9NSTlNeXJ0NnAxNnYvWldoeDBZZ1V3NVF1KzF3dU1K?=
 =?utf-8?B?TG9mNkxHRUIxK3RLSWpKcExDK0FzMnRHWmFJUHZMVTRuNC9mellMRkR3bnhu?=
 =?utf-8?B?emFZZm1iNmJUZXJoQ3AveTQ1dEJPNjV1RllvU1hObnBoZllqYVFCWEl0b1Nz?=
 =?utf-8?B?RGRjMk0zdjNpbmUvY0l0ZHVid3dpK0toWkxkREtKL1RhSDBubVhBdnNPc0x6?=
 =?utf-8?B?QTR2V2N1Ump0ajcwZzFWeUUwSDg4ZmlKMVBuWXU5QVk4NmxiL0w4bnJ5RHh6?=
 =?utf-8?B?V3M3cGV4TzNLdTgwWk1NaFQvUEhGUVJlU2xSdjRTSFhnQVcrdTBuZmNHU3Mx?=
 =?utf-8?B?c2VsN05KdzZJMFJDWEc5TENwVUJ3a1c3SWR5aDYyMHBCWWMxRFZvWHh5ZG40?=
 =?utf-8?B?YzhCZkJmNjhFQmpWRXJqMTRDR0pkRS9ROEFvRUhjcUlBV0VWMXdYQ1dVYVlh?=
 =?utf-8?B?YWpHN2RiN0tUUmFlNHB1Yk5aKzh3TFdpbzdsKzVjUGRsbGVVbVFDbDhERGE0?=
 =?utf-8?B?bzZSUGdodzBpUWszZ2E0NnlGRDhnMHRxMm5SN1FZbmROMjZKb0JDOWhlZG13?=
 =?utf-8?B?ZlpGNGdVQUZGQ2lZWUVzT0YwcWhtelliTXI2aVdvUU4vS1piUmZ5aTBrajNp?=
 =?utf-8?B?MW11SHVQeE5OK2tQVnk5ZEdXSzY3TmhkRVI3cG5qK0hORGRzRGVKcTk3cDNN?=
 =?utf-8?B?OS9ZbnF4U2thZFV1NWtMSVZsd2NPK3I3RVVRTCtPZlZTWnFQNXU1L1VnM09J?=
 =?utf-8?Q?wDaUddkeJyHxXBNdr7ViMSQgwyZwgt4X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXViYXZkVW1WdlAvYXcyb0w1M2xNSkxMdmRBUWpXQ2JuN0RwQnlrZk9aaTNo?=
 =?utf-8?B?Y1dBazdXVDBPdWlISlFNWllnek40N01WcEZhNERQd1I1bkRYVVJnWjUwNGxt?=
 =?utf-8?B?UllHMGhBNDdIbGRDNFdRQlE2bDJxZXpKc1hiaXMza09Jcmx0OHNTR2Q3K2Yz?=
 =?utf-8?B?cWprWm5UNklEK2lhSFhxMWEzMXBFSUN0S0VuSHJsRnVkNUtUVk9mNWJjQ1or?=
 =?utf-8?B?dFpGc3RlVUNBcTJzZDhKc1l6T29ndSsrNTZwZTRqeTBURFJ5eWc2aU9ETDF2?=
 =?utf-8?B?ZkxLUE9VR3lZTGYvb1Fkb25SM3NkMWRQQ1FDRTBobGdjcHFCOS9FanA5cWVi?=
 =?utf-8?B?bjdJbkJ4OXJnckJBdTErdDFzRlJMbkJhMHBDSWNUTmdIVWF2ckdPU01oZFVY?=
 =?utf-8?B?dXhwR05udE9MK2RNNExKVUhqZldJS0ZTUE95VDBiUmwyWXZaMzlxMzE1Nmw1?=
 =?utf-8?B?Yi9JZFNGWUtzV252dTdVcTRNTnBtWktIMzRiZWRjcDM2YzBzOXJ0ODNobmRy?=
 =?utf-8?B?a29ybWxKQ3ZSdmxxVjN5RERUdGhCcXJsY0VTUTlzK24rMmtGOU8zTll5RHEr?=
 =?utf-8?B?Q3BsZHhYdkhUTTlxRUVVMFk0c25HaDMreVlPRzB6Z3Vnd1pLWGM3cHhxVlFx?=
 =?utf-8?B?Wi82Qyt0b0dCdXJBUFpDUTRFZ1RVRjlyQS9Ick95U2RBdmlHcEZ6UnJyQjdn?=
 =?utf-8?B?TndpQTZLL1djUUkxSGJzaGgxaHRRK2M5b2EvdUhOQXRJS2krcVgyNzJCYXo4?=
 =?utf-8?B?VlZYWFl4M3QrNVprNGpsRHJTejFpU3p6cjZjRVZQa3REL1RiUlBSdzBMUk1i?=
 =?utf-8?B?SGtIS1RlclFDOWE2SUlXQ3UwUzRxb216VEVEdjJ3Q0s2cC81M0dRRnZvQW1G?=
 =?utf-8?B?R1Z6cUtkS3hoTEo2RXVodFNXa09zL3pIMFJ4U2x6RUx0YzB6Ykh5UzdlQ1ZO?=
 =?utf-8?B?WjhKYXkrbUgzYVlKMjVaZWdUajhzUFJBMG95dTZDRUhYSGpyNng0dTByU0pZ?=
 =?utf-8?B?ODI5YmFoSllTQ05UOW9BZEt0YW0rVVV3MUdhVFlEbW5pVnVHVFJFamovYkk4?=
 =?utf-8?B?MnI1T1F4OC8wS0hnbkNNQjJHMDZ2YTZpM0Y3ZXlZaUpsOGo1WmVHVWp6cmxM?=
 =?utf-8?B?dTVJbHl1N3lDQ050ek5ETTZteW5LeVFUa0hqeVB3SlVNSzNHOW52Ky93V0k0?=
 =?utf-8?B?cWpCb1BJNkw2ME81NmFSVEdlbFBYb00ybm10QzdES3g3b1pLN3BjYkpZMG93?=
 =?utf-8?B?K29UL1ZIUmxzb1JKQ3g1MjVIUmdtK3Vra1pJeVdQTFVRbllQdUxTOXkxWlFa?=
 =?utf-8?B?UnVoWkZtOVoxMWFrVTdiNHdCNFJFZDhCRnV5bTFkZGNaVXZhVG95ZmVkZ0tF?=
 =?utf-8?B?Z1VZb3ovNVJMV0p3cXVSTUJ5T2ZwVHNDaHJFK1RqdTJtbFJzbmt1QXR1dDl6?=
 =?utf-8?B?QlBKQ2tpbTVzVEhuTDFvTTNLWXJMaWFNQXE2LzdmL3JkVjB3WjBETDllQk51?=
 =?utf-8?B?Z0lrMXVZYlpUdDFHSWdBVkNrUEFDZTRjSlVHNU9oNGljVWMrOHJ4RkJaNHRu?=
 =?utf-8?B?V3FTVVNPdWVIR09XK0lCVXdnQ1lXUng2LzNLWTFhdklNUWlvVWZrTERuVGJH?=
 =?utf-8?B?eHZqTExZa0hqL0ZSalljMkd1d0xRbFR5UzlaY2VEcUxRYmxvZWZKWTFPNkJP?=
 =?utf-8?B?dW1RdW9mWG56dWZidGZ4SVYyOFdHRkI0MUN3Zm5nQ1JxOWpyZTFkUEhJeHd6?=
 =?utf-8?B?cGtRbjRTN2xhK2RmM2JJcVlQK2ltS0JJbC9pNHo1S0EyeTdDZVhQK01zWXBt?=
 =?utf-8?B?clBKLzhWSi9PY3o4V01Ob1JQTENsaDI3Wjl4dFVYaEEzTEpZYnpqbmxBeW9I?=
 =?utf-8?B?WkxOaFNOVnNLSFdVQ0lpS0JOQm0rYVpVWTZBZG5ZYVdGTDRmZCtMY29oQXl0?=
 =?utf-8?B?U2ZHTXVMNmloWUpNYU52Rkw1MnlKYWdXS2VydGx6dzh3K2U1ZkV5SE5qb2Uz?=
 =?utf-8?B?QVJtcGVhNm1FY0FncmVxek1SdHBXZ3BkSE4vdFJYeDZlR1hNODUxOUxRclE0?=
 =?utf-8?B?c0h2QkdqOWlJWkExSWRnVyswNXBtcHFjb0xKTUFPZGs0VXI3RE11VEVIMDJ1?=
 =?utf-8?Q?FRTRtTKfwCFC2RParxkonSwVp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3a14a9-ac5b-47c7-62d7-08de3e1fd225
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 10:25:52.5400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NmPCr+z3fTdijdWMqlNEXnOjsw6xfcsbc/eyVZVc5MgbiwT0vv0dT5p06qJA38y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF75EAF8F39
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

On 12/18/25 07:28, Xiang Gao wrote:
> From: gaoxiang17 <gaoxiang17@xiaomi.com>
> 
> Since we can only inspect dmabuf by iterating over process FDs or the
> dmabuf_list, we need to add our own tracepoints to track its status in
> real time in production.
> 
> For example:
>    binder:3016_1-3102    [006] ...1.   255.126521: dma_buf_export: exp_name=qcom,system size=12685312 ino=2738
>    binder:3016_1-3102    [006] ...1.   255.126528: dma_buf_fd: exp_name=qcom,system size=12685312 ino=2738 fd=8
>    binder:3016_1-3102    [006] ...1.   255.126642: dma_buf_mmap_internal: exp_name=qcom,system size=28672 ino=2739
>      kworker/6:1-86      [006] ...1.   255.127194: dma_buf_put: exp_name=qcom,system size=12685312 ino=2738
>     RenderThread-9293    [006] ...1.   316.618179: dma_buf_get: exp_name=qcom,system size=12771328 ino=2762 fd=176
>     RenderThread-9293    [006] ...1.   316.618195: dma_buf_dynamic_attach: exp_name=qcom,system size=12771328 ino=2762 attachment:ffffff880a18dd00 is_dynamic=0 dev_name=kgsl-3d0
>     RenderThread-9293    [006] ...1.   318.878220: dma_buf_detach: exp_name=qcom,system size=12771328 ino=2762 attachment:ffffff880a18dd00 is_dynamic=0 dev_name=kgsl-3d0
> 
> Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>

This patch was still not properly rebased on drm-misc-next and there was some whitespace issues with the macro.

I've reviewed the patch, fixed the merge conflict and whitespace issues and pushed the result to drm-misc-next.

Thanks,
Christian.

> ---
>  drivers/dma-buf/dma-buf.c      |  51 ++++++++++-
>  include/trace/events/dma_buf.h | 157 +++++++++++++++++++++++++++++++++
>  2 files changed, 206 insertions(+), 2 deletions(-)
>  create mode 100644 include/trace/events/dma_buf.h
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index edaa9e4ee4ae..59a5261cb26b 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -35,6 +35,28 @@
>  
>  #include "dma-buf-sysfs-stats.h"
>  
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/dma_buf.h>
> +
> +/*
> + * dmabuf->name must be accessed with holding dmabuf->name_lock.
> + * we need to take the lock around the tracepoint call itself where
> + * it is called in the code.
> + *
> + * Note: FUNC##_enabled() is a static branch that will only
> + *       be set when the trace event is enabled.
> + */
> +#define DMA_BUF_TRACE(FUNC, ...)					\
> +	do {											\
> +		if (FUNC##_enabled()) {						\
> +			guard(spinlock)(&dmabuf->name_lock);	\
> +			FUNC(__VA_ARGS__);						\
> +		} else if (IS_ENABLED(CONFIG_LOCKDEP)) {	\
> +			/* Expose this lock when lockdep is enabled */	\
> +			guard(spinlock)(&dmabuf->name_lock);	\
> +		}											\
> +	} while (0)
> +
>  static inline int is_dma_buf_file(struct file *);
>  
>  static DEFINE_MUTEX(dmabuf_list_mutex);
> @@ -220,6 +242,8 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>  	    dmabuf->size >> PAGE_SHIFT)
>  		return -EINVAL;
>  
> +	DMA_BUF_TRACE(trace_dma_buf_mmap_internal, dmabuf);
> +
>  	return dmabuf->ops->mmap(dmabuf, vma);
>  }
>  
> @@ -745,6 +769,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  
>  	__dma_buf_list_add(dmabuf);
>  
> +	DMA_BUF_TRACE(trace_dma_buf_export, dmabuf);
> +
>  	return dmabuf;
>  
>  err_dmabuf:
> @@ -768,10 +794,16 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_export, "DMA_BUF");
>   */
>  int dma_buf_fd(struct dma_buf *dmabuf, int flags)
>  {
> +	int fd;
> +
>  	if (!dmabuf || !dmabuf->file)
>  		return -EINVAL;
>  
> -	return FD_ADD(flags, dmabuf->file);
> +	fd = FD_ADD(flags, dmabuf->file);
> +	if (fd >= 0)
> +		DMA_BUF_TRACE(trace_dma_buf_fd, dmabuf, fd);
> +
> +	return fd;
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
>  
> @@ -786,6 +818,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
>  struct dma_buf *dma_buf_get(int fd)
>  {
>  	struct file *file;
> +	struct dma_buf *dmabuf;
>  
>  	file = fget(fd);
>  
> @@ -797,7 +830,11 @@ struct dma_buf *dma_buf_get(int fd)
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	return file->private_data;
> +	dmabuf = file->private_data;
> +
> +	DMA_BUF_TRACE(trace_dma_buf_get, dmabuf, fd);
> +
> +	return dmabuf;
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_get, "DMA_BUF");
>  
> @@ -817,6 +854,8 @@ void dma_buf_put(struct dma_buf *dmabuf)
>  		return;
>  
>  	fput(dmabuf->file);
> +
> +	DMA_BUF_TRACE(trace_dma_buf_put, dmabuf);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
>  
> @@ -971,6 +1010,9 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>  	list_add(&attach->node, &dmabuf->attachments);
>  	dma_resv_unlock(dmabuf->resv);
>  
> +	DMA_BUF_TRACE(trace_dma_buf_dynamic_attach, dmabuf, attach,
> +		dma_buf_attachment_is_dynamic(attach), dev);
> +
>  	return attach;
>  
>  err_attach:
> @@ -1015,6 +1057,9 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>  	if (dmabuf->ops->detach)
>  		dmabuf->ops->detach(dmabuf, attach);
>  
> +	DMA_BUF_TRACE(trace_dma_buf_detach, dmabuf, attach,
> +		dma_buf_attachment_is_dynamic(attach), attach->dev);
> +
>  	kfree(attach);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_detach, "DMA_BUF");
> @@ -1480,6 +1525,8 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>  	vma_set_file(vma, dmabuf->file);
>  	vma->vm_pgoff = pgoff;
>  
> +	DMA_BUF_TRACE(trace_dma_buf_mmap, dmabuf);
> +
>  	return dmabuf->ops->mmap(dmabuf, vma);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, "DMA_BUF");
> diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
> new file mode 100644
> index 000000000000..35f8140095f4
> --- /dev/null
> +++ b/include/trace/events/dma_buf.h
> @@ -0,0 +1,157 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM dma_buf
> +
> +#if !defined(_TRACE_DMA_BUF_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_DMA_BUF_H
> +
> +#include <linux/dma-buf.h>
> +#include <linux/tracepoint.h>
> +
> +DECLARE_EVENT_CLASS(dma_buf,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf),
> +
> +	TP_STRUCT__entry(
> +		__string(exp_name, dmabuf->exp_name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +	),
> +
> +	TP_printk("exp_name=%s size=%zu ino=%lu",
> +		  __get_str(exp_name),
> +		  __entry->size,
> +		  __entry->ino)
> +);
> +
> +DECLARE_EVENT_CLASS(dma_buf_attach_dev,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attach,
> +		bool is_dynamic, struct device *dev),
> +
> +	TP_ARGS(dmabuf, attach, is_dynamic, dev),
> +
> +	TP_STRUCT__entry(
> +		__string(dev_name, dev_name(dev))
> +		__string(exp_name, dmabuf->exp_name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +		__field(struct dma_buf_attachment *, attach)
> +		__field(bool, is_dynamic)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(dev_name);
> +		__assign_str(exp_name);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +		__entry->is_dynamic = is_dynamic;
> +		__entry->attach = attach;
> +	),
> +
> +	TP_printk("exp_name=%s size=%zu ino=%lu attachment:%p is_dynamic=%d dev_name=%s",
> +		  __get_str(exp_name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->attach,
> +		  __entry->is_dynamic,
> +		  __get_str(dev_name))
> +);
> +
> +DECLARE_EVENT_CLASS(dma_buf_fd,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, int fd),
> +
> +	TP_ARGS(dmabuf, fd),
> +
> +	TP_STRUCT__entry(
> +		__string(exp_name, dmabuf->exp_name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +		__field(int, fd)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +		__entry->fd = fd;
> +	),
> +
> +	TP_printk("exp_name=%s size=%zu ino=%lu fd=%d",
> +		  __get_str(exp_name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->fd)
> +);
> +
> +DEFINE_EVENT(dma_buf, dma_buf_export,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf)
> +);
> +
> +DEFINE_EVENT(dma_buf, dma_buf_mmap_internal,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf)
> +);
> +
> +DEFINE_EVENT(dma_buf, dma_buf_mmap,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf)
> +);
> +
> +DEFINE_EVENT(dma_buf, dma_buf_put,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf)
> +);
> +
> +DEFINE_EVENT(dma_buf_attach_dev, dma_buf_dynamic_attach,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attach,
> +		bool is_dynamic, struct device *dev),
> +
> +	TP_ARGS(dmabuf, attach, is_dynamic, dev)
> +);
> +
> +DEFINE_EVENT(dma_buf_attach_dev, dma_buf_detach,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attach,
> +		bool is_dynamic, struct device *dev),
> +
> +	TP_ARGS(dmabuf, attach, is_dynamic, dev)
> +);
> +
> +DEFINE_EVENT(dma_buf_fd, dma_buf_fd,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, int fd),
> +
> +	TP_ARGS(dmabuf, fd)
> +);
> +
> +DEFINE_EVENT(dma_buf_fd, dma_buf_get,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, int fd),
> +
> +	TP_ARGS(dmabuf, fd)
> +);
> +
> +#endif /* _TRACE_DMA_BUF_H */
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>

