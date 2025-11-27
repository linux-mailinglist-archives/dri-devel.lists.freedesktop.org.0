Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE26C8DA1E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 10:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8473C10E7F9;
	Thu, 27 Nov 2025 09:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="30l6ST9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012065.outbound.protection.outlook.com [52.101.43.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD32B10E7F9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 09:49:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXrxWUvrQqlkDgxmqSCNWDbZe+x3vvDFD20VFVgke2N10OC51nTgc08WN5K8Y/NfRcklfo6pyCUfJMBKFR1up/TAQBpeB2XOcYwyDnC3HmVsIUzg2a5A2JqL88jPUpSYjLDP0NwBhx8bLxRCwmThXf8ajpLxy+oFO23j4Mf6/lwaTDrFqzzMqDCb/N/TFhBuwONV1rLJ9ywWI1JFusz1iyRQQw/KoLZ7nojoXFUPWPcB4AtqaCR5PdIEE+6TcbT68QrJblYCJJ7wgq4hnsT7vhnzTMRijcOu3SlvCo1+XC9HcGNL1ETtP2BnGjcwjH8rM6TuOCKbb27FS/3OON1bJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxxxL3WYA2aYr3M7MR6aPVRJaBnov+GfL1nKUVb27Zc=;
 b=ijJY9lA8AZuYbMHRcJHNRGqk6rl+E/ay0SyeN/I8BoNilXZD/Sz594/Q8aI//vw7SCnK9Oz/IajHqyFzbDPvgRTClZDzfITzHyPLGLnh05x67XF5aX9lHoXkoi0HkVwEe6Lui04yQFYDsJh0j/NN6OpG6b7sQJjTvZx9gaozZw2ARV6qY+zM9+1N9GVYMpIRlMlDg2eFPk7o5r9w1jyAIzFkK04JCDgOG10IuxIshxDLvefwzCak1GjN71jKQoC8deoIxw8EwbIT70VbmUH+EDojU/3+4igaV4FCs7pVs1VFJ17prqYrPRi/jHSSJkRpvY1fn0ysmiEaB77VAQ2wMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxxxL3WYA2aYr3M7MR6aPVRJaBnov+GfL1nKUVb27Zc=;
 b=30l6ST9pL0B95PWRb3FRdfD82D+ZmYMShsXfcTLikrsNsPpjK/xj0Etov4Mm/+03ZFJ/Au/4U5/YWt3KaMd40uWwuusHuNaP9xU0BocbnWYSCGPSOT1lc8OQeypa5nprHQBd39jQVx6wf2qWfQ13BcUY3yWgvbwnevamBiGRgl8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5781.namprd12.prod.outlook.com (2603:10b6:510:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 09:49:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 09:49:14 +0000
Message-ID: <c82698b0-f153-4e97-849a-d32e71dad1ab@amd.com>
Date: Thu, 27 Nov 2025 10:49:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dma-buf: add some tracepoints to debug.
To: Xiang Gao <gxxa03070307@gmail.com>, sumit.semwal@linaro.org,
 rostedt@goodmis.org, mhiramat@kernel.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 dhowells@redhat.com, kuba@kernel.org, brauner@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org,
 gaoxiang17 <gaoxiang17@xiaomi.com>
References: <20251127004352.376307-1-gxxa03070307@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251127004352.376307-1-gxxa03070307@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5781:EE_
X-MS-Office365-Filtering-Correlation-Id: 45bfdafd-f97f-4c3f-564b-08de2d9a3943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UE9rMXZkTW15ejZ1OXc1dW1lZ29wOHhCbldKQ3VoR080ek5vR0wycWhpbTZG?=
 =?utf-8?B?QjBxZ1k5LzJJMjFvNStXcTBFOEN3MExoR3hpQlhPRXAwM0N0dWZHbmFhWEYr?=
 =?utf-8?B?NTNORGM4ek93U3k0WmNzNnl2em80TENXYmtoWnRqWFAwWS9uQWZlWTg4ak54?=
 =?utf-8?B?MlplNGNsK1p3SGFwUWppdDlHQ09oM3NIazJieEMvNTBTWU5COE1JT0lHUnIr?=
 =?utf-8?B?L2NnZEN5SStrWnJkOEZieTJlMEozV0xsSzgvK09xcFhnd1RBdGo1NC9QMURH?=
 =?utf-8?B?dTJyaUlWbG5zRmlUZzgzRGRacFpQeVNaM1pZQk5pQlUrd0JQN2IrbWtsT05z?=
 =?utf-8?B?dXlKdWx0UXNIdEcvN0gwZ0JxQTdRU1FvNEMxbS9SWkxmcFJ4c1VjQUxSVU1Y?=
 =?utf-8?B?QURZZ3JUdWlnR0J2SllJMHk0Y0hxNlNlRGl3RG9MckhpMXZpSTh1V2E1TUc5?=
 =?utf-8?B?UkFibXAvYW5xZUFxN2lDSGhocTEzTG8vS0cxdnBldmx5d2VJYkJ5RkM0d1dx?=
 =?utf-8?B?ZjVrbnZkNzk4cVl5Z2xTL2FMbGhhSXZ4anN4WDgrVzhjbE1CMjU5SXNmd1JJ?=
 =?utf-8?B?N1VneDYzcVB1ZXFsZy94U0o5MUNiYnFVZjZ0b3hkeEkzOTlQZU8xVVQwVWd2?=
 =?utf-8?B?SDFDV041MGlsOXJoellod0Z0T1ZFOHBBMjlPZm9CRnpsdldxQi9yUDF3eUZU?=
 =?utf-8?B?bGVaMmp3QTlYTmpNV3AyWVVJRGZ6M1BqZHRURm9LYTRwOWUrTUJ1N1czbWdr?=
 =?utf-8?B?WVprYjA5cVNBYXFlL2ZqVlpqMnlhWXNDMEE5M3UwRDFHNHZqV0M2WEE3ZStQ?=
 =?utf-8?B?Q0FYVFFQTzZlZkphUzVNZVU5Z2ExUmI1cWdnTmorcDI2ZnBMbmFvcEhHbitr?=
 =?utf-8?B?RWhoWXVucExIeEg2Y3oyVnlEWEhySjdVY21ZbFBsNE13b1llaEM5eitlL0tN?=
 =?utf-8?B?elB4d0tMZTcrTlVWdnFMd2xYbmVUYzc0VVZWR0JhUTQwdU5zamZnRy8xaXBD?=
 =?utf-8?B?L2k1YXdIVUs1Z3pjU3NrM2loamFaZ2ZWblRXamNTMXZrcFJ2RGxtZzF6NGh6?=
 =?utf-8?B?RE4vMXYwRS8zbFBkczUxaExmSnBodXFydVFyNGQxbUpiaEFUU1Q2dEthN2Nu?=
 =?utf-8?B?QjlGQXRxb29DVWlXSWk0NHJHQS9CcWpJYnVsSGMrd0xSVCtpb2dBVEk3cHdw?=
 =?utf-8?B?V2NtVUduV3ZXZjh3RGhoS0tMRm1KaXV0K0hJUjM0TUlyRWU4N3VmcENiakN4?=
 =?utf-8?B?Nk81VzZoUjlzdGZYdzQ4bFlVb0JXTU54K3Z6NVRhZWpwMUswOThyVjRVM0V2?=
 =?utf-8?B?WERxaDRGVEFkVkl6Q1hQS0lkZFU2UlNkVXpXemJOb3h3L21nUXNZZEtPMXhP?=
 =?utf-8?B?S0p1RmwzYm1wYkRtUkdkcW1iYTZkUDFXUXVTbUNSQU1pZXdDa2F2QkkzVXM4?=
 =?utf-8?B?K2VuUm13OS9NMWZUZ1hBS0JDYWhrVUt1YXhtc3J3T2JjdjdudmV4T1h5N0o3?=
 =?utf-8?B?U0g1NUN2U0Q5dVl6dW52SWk5c1ZKdXVZZ0JuZlp0SDhoQnpWVFRSWEZPdW04?=
 =?utf-8?B?SU5xNkorcXlkUHd0ZFNDVVZJTjVURG5ISUZqZEhTT1Q0b3BzcVdtVDFHcThl?=
 =?utf-8?B?VXY0RFpPQmpLYXNSMmd3UDhuYnVrWVpGSmM1YTA3WFFDTm1VQkFsTUx0aGZl?=
 =?utf-8?B?eHQzOGZlZ2xxZWRiZWFSUWFCRXNMMkJROG5NV3ZPb1pOc3llVjI0OEd2SDFj?=
 =?utf-8?B?ZW42ZVRWeDgzamY1bmF6S210VVltTnR2ZUpibnVPRkNCa2Y4WlpTenNONWNW?=
 =?utf-8?B?Q2hteWYrMFlEUUxUK3huVDlBOVdyV0JsdkZVRTV3c1psNnFpNXlvWWQ5Nkky?=
 =?utf-8?B?cXlQMndoVEFtVzExanVpQnVpejR4OFJvWTQ0aEtvdTZQc3pCN2Y3TldQeTA4?=
 =?utf-8?Q?qfNbkv/1lugVs3DaQvdCm1WRfRLkKwSA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1dRcGl6U3UwSVlmdzVwbkJVRFpVVHlWRDZzRjJyOGYySm9nSElPUTQ5U3cv?=
 =?utf-8?B?T1gvamV6LytsTndDME1oRTc1TWl5cnZxVXZVdXlWb2RyWTllekhiSk5rRTRs?=
 =?utf-8?B?NDZHNWVxSGxpM1hhRTA4RkJuWlZrbFNHZkU3WlUzVUtUUmJEMXh6cW50KzlP?=
 =?utf-8?B?UEsycXpFakNkVVRvdGVFVkc3a0J2enVLUlpycC8wVWNBQ20xZ1E2SVk3N1pq?=
 =?utf-8?B?THgxSlJQcTEyaWo0aG81TTZsNkR2c2Y3YURZT2hZNFh4UlMyaDhCa2Q3SWIx?=
 =?utf-8?B?V3lydnBCRmhaUHBHc1BNLzBxOTkvQ1JQL2Y1QjRGcnQ0NDZwSkNwV2JlMVV5?=
 =?utf-8?B?ekpGNUk3eFpQTUJEdHhjaWUyRXFZQXUzYkZTQ0FOS0xvZ04vb3Z1WW9wQjdU?=
 =?utf-8?B?ZE9PUXRHMXk0M0xKeDdwN2kvM2xqNG1CVG40ZkVGbGZ4TWR2VHhUZ1VZRVVV?=
 =?utf-8?B?RnZLUXlZbCtzVUFXWWMxRWpCREpFd0RUS3Q1Wk45Wm8vTy9PWDNKdlhrbk1K?=
 =?utf-8?B?VlhlSlZLbnhiNjhqak43dWxSMVo3VVVaYlRQakNwY1VIazR0TDFLRlg0YUxS?=
 =?utf-8?B?ZDBGY0RMcitrUGpWTG9Zek9qUmlSS2k1U1B6K1oyZ25CR2RsS0orSjF6UzFD?=
 =?utf-8?B?bnhtN21QRTZPMmRCY01WOUxjWUZZZVR1MjRteUdHbXh5VWJuOFdhczZESS96?=
 =?utf-8?B?N3lpTjh1UGx3enNuZlQ0UDNPWHJiOGN2cHFBTldNZ21mTytoelN0NHVYTVQ4?=
 =?utf-8?B?SmxkQXh6UXZoNmhPVUZQbXdCcTQxRUVXdEpWb0JxZEJINjB5b1lEMmdTNzJK?=
 =?utf-8?B?Y2VDZEJHeUFaNmlFNDZ2QURxRXo1dDZpZHBjUUMzMkRJa0s1Zi9CNEg1NUYv?=
 =?utf-8?B?bzRGMUpyVE9Xb2RtbEVEMm02N0FpeStqUlZFdjYxd3VuL09uc05LSCtRTW53?=
 =?utf-8?B?cnFJRXpxR3luRjN4MDZ6c3VKWk9nOExrNU5pSWJlbFdmandsMUhTbmphOCsz?=
 =?utf-8?B?RDUxWnZURTkvc0NBVU0va3VzYS9hTFNnb2hsMUZFV1hGQ0kvbG1MRlV1VTky?=
 =?utf-8?B?WGc0RGFXMEFtUnl0azc3ZVFtcXR2blNxWWp1WmF6SG5qQk9zS3ZGWG85QnNq?=
 =?utf-8?B?T1ErdGRWc1Z2K2YvWkhrRjBzaC9QOGN1WG9mY0dKSUgrUVp2dEZRTzNiankw?=
 =?utf-8?B?REVIakVjRTMzS2lNN2h0dGo5c3Jtc1pFMTZuLzdFTFQ2eGE0dmtCd2tpOXRG?=
 =?utf-8?B?Uk9rN2ZrNDJrMTJqNzVZN05QRzVmQWxiZmw0N3NuU1ZGZElXNVdkeWFyeWc1?=
 =?utf-8?B?dC9UTW5hS2F1a2xXQitBaVFnalF5cVRQNU9YNjBSK0szamZZa3V1NisveFNq?=
 =?utf-8?B?ZEVoUm5oTGJxWHJPQzRoL3lKRWdtMzJsOVY4V1hadjJLK3VQREhFcWVqV1dz?=
 =?utf-8?B?Mk9QWnVKYjMvVjhlMUkwYUtER3o1QndBdE4vNms2aThUU2NaRTlSOVNzdUpx?=
 =?utf-8?B?SU9XbjNIVFdpaUJWYmhkZ2FudGgwY0Z3ZEE5S2F3WHB4ejdlaEwvQTN3czRZ?=
 =?utf-8?B?NDloWTl3Qk14b3U2eWtoaFVOZmk5RW8veXJlclE3Zk5HRG5xZWhNUU1DRUxJ?=
 =?utf-8?B?SVRDUGNvMWk3ZjV3YXhXT05pVDRqdW9mSytPaGVqd1pickZYdVA5MkNwbFRk?=
 =?utf-8?B?dm5NQTluNkx5UWdDdHVKRW90QjBtNDBGb09YTDIvQzBjVWdiaERicXhzdjVY?=
 =?utf-8?B?a0JMVGRHV3NQT3VNMEVWcVJjNmhkT2o2eVl0T1BsQ0F5YWNhNEh6dGsrRjVG?=
 =?utf-8?B?RGM5V1VwQzQyNzB2RDQ1TUhTd2dVbE5iZUhDbFRpcm0yTCtFN3FuZnErWE9V?=
 =?utf-8?B?eTBLSFg5YWVWd0VBWHVvclBUSHJFVy9DZU9ZeVhnZ013U1ZzQ0ROdjZKMTFR?=
 =?utf-8?B?Yk1nckFiRDZLUERTWFBoYzRYSVMwMTJrYWIvUXRuZ3ZMNGszZzVwVmNnUFRH?=
 =?utf-8?B?Y0ZueEp5N1RFU0UwMUNrZGJ2bmdubERPR3BUNlBLTExjSytVaWdUcThxUEdX?=
 =?utf-8?B?bXZVVEg2Z2lxV01RUFlEeVZicGRMNCthNUk5bUFFWDh3ZHh5NDNxVzlCV2Fr?=
 =?utf-8?Q?/9fsaKJoSFLl8aHIZPq/vtXGd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45bfdafd-f97f-4c3f-564b-08de2d9a3943
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 09:49:14.4256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfQYz85EV428aTBoeS9bTrrU0jZEGcpS8mwTSzxIIEzUlApKp+7O+SzOFj8fYuR4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5781
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



On 11/27/25 01:43, Xiang Gao wrote:
> From: gaoxiang17 <gaoxiang17@xiaomi.com>
> 
> I want to track the status of dmabuf in real time in the production environment.
> But now we can only check it by traversing the fd in the process or dmabuf_list.
> 
> For example:
>    binder:2962_2-2962    [005] ...1.   208.453940: dma_buf_export: exp_name=qcom,system name=(null) size=28672 ino=2580 f_refcnt=2
>    binder:2962_2-2962    [005] ...1.   208.453943: dma_buf_fd: exp_name=qcom,system name=(null) size=28672 ino=2580 fd=9 f_refcnt=2
>    binder:2962_2-2962    [005] ...1.   208.453977: dma_buf_mmap_internal: exp_name=qcom,system name=qcom,system size=28672 ino=2580 f_refcnt=4
>      kworker/5:2-194     [005] ...1.   208.460580: dma_buf_put: exp_name=qcom,system name=ab pid [8176] size=28672 ino=2580 f_refcnt=3
>     RenderThread-11305   [007] ...1.   208.599094: dma_buf_get: exp_name=qcom,system name=ab pid [8176] size=217088 ino=2579 fd=1114 f_refcnt=7
>     RenderThread-11305   [007] ...1.   208.599098: dma_buf_attach: dev_name=kgsl-3d0 exp_name=qcom,system name=ab pid [8176] size=217088 ino=2579 f_refcnt=7
>            <...>-14      [001] ...1.   208.726359: dma_buf_detach: dev_name=kgsl-3d0 exp_name=qcom,system name=ab pid [3317] size=217088 ino=2581 f_refcnt=3
> 
> Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
> ---
>  drivers/dma-buf/dma-buf.c      |  57 ++++++++++-
>  include/trace/events/dma_buf.h | 166 +++++++++++++++++++++++++++++++++
>  2 files changed, 222 insertions(+), 1 deletion(-)
>  create mode 100644 include/trace/events/dma_buf.h
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 2bcf9ceca997..7cef816ddcac 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -35,6 +35,18 @@
>  
>  #include "dma-buf-sysfs-stats.h"
>  
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/dma_buf.h>
> +
> +EXPORT_TRACEPOINT_SYMBOL(dma_buf_export);
> +EXPORT_TRACEPOINT_SYMBOL(dma_buf_mmap_internal);
> +EXPORT_TRACEPOINT_SYMBOL(dma_buf_mmap);
> +EXPORT_TRACEPOINT_SYMBOL(dma_buf_put);
> +EXPORT_TRACEPOINT_SYMBOL(dma_buf_attach);
> +EXPORT_TRACEPOINT_SYMBOL(dma_buf_detach);
> +EXPORT_TRACEPOINT_SYMBOL(dma_buf_fd);
> +EXPORT_TRACEPOINT_SYMBOL(dma_buf_get);

Exporting the tracepoints is unecessary as far as I can see

> +
>  static inline int is_dma_buf_file(struct file *);
>  
>  static DEFINE_MUTEX(dmabuf_list_mutex);
> @@ -220,6 +232,11 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>  	    dmabuf->size >> PAGE_SHIFT)
>  		return -EINVAL;
>  
> +	if (trace_dma_buf_mmap_internal_enabled()) {
> +		guard(spinlock)(&dmabuf->name_lock);
> +		trace_dma_buf_mmap_internal(dmabuf);
> +	}
> +
>  	return dmabuf->ops->mmap(dmabuf, vma);
>  }
>  
> @@ -745,6 +762,11 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  
>  	__dma_buf_list_add(dmabuf);
>  
> +	if (trace_dma_buf_export_enabled()) {
> +		guard(spinlock)(&dmabuf->name_lock);
> +		trace_dma_buf_export(dmabuf);
> +	}
> +
>  	return dmabuf;
>  
>  err_dmabuf:
> @@ -779,6 +801,11 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
>  
>  	fd_install(fd, dmabuf->file);
>  
> +	if (trace_dma_buf_fd_enabled()) {
> +		guard(spinlock)(&dmabuf->name_lock);
> +		trace_dma_buf_fd(dmabuf, fd);
> +	}
> +
>  	return fd;
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
> @@ -794,6 +821,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
>  struct dma_buf *dma_buf_get(int fd)
>  {
>  	struct file *file;
> +	struct dma_buf *dmabuf;
>  
>  	file = fget(fd);
>  
> @@ -805,7 +833,14 @@ struct dma_buf *dma_buf_get(int fd)
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	return file->private_data;
> +	dmabuf = file->private_data;
> +
> +	if (trace_dma_buf_get_enabled()) {
> +		guard(spinlock)(&dmabuf->name_lock);
> +		trace_dma_buf_get(dmabuf, fd);
> +	}
> +
> +	return dmabuf;
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_get, "DMA_BUF");
>  
> @@ -825,6 +860,11 @@ void dma_buf_put(struct dma_buf *dmabuf)
>  		return;
>  
>  	fput(dmabuf->file);
> +
> +	if (trace_dma_buf_put_enabled()) {
> +		guard(spinlock)(&dmabuf->name_lock);
> +		trace_dma_buf_put(dmabuf);
> +	}
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
>  
> @@ -998,6 +1038,11 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, "DMA_BUF");
>  struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>  					  struct device *dev)
>  {
> +	if (trace_dma_buf_attach_enabled()) {
> +		guard(spinlock)(&dmabuf->name_lock);
> +		trace_dma_buf_attach(dmabuf, dev);
> +	}
> +
>  	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_attach, "DMA_BUF");
> @@ -1023,6 +1068,11 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>  	if (dmabuf->ops->detach)
>  		dmabuf->ops->detach(dmabuf, attach);
>  
> +	if (trace_dma_buf_detach_enabled()) {
> +		guard(spinlock)(&dmabuf->name_lock);
> +		trace_dma_buf_detach(dmabuf, attach->dev);
> +	}
> +
>  	kfree(attach);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_detach, "DMA_BUF");
> @@ -1488,6 +1538,11 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>  	vma_set_file(vma, dmabuf->file);
>  	vma->vm_pgoff = pgoff;
>  
> +	if (trace_dma_buf_mmap_enabled()) {
> +		guard(spinlock)(&dmabuf->name_lock);
> +		trace_dma_buf_mmap(dmabuf);
> +	}
> +
>  	return dmabuf->ops->mmap(dmabuf, vma);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, "DMA_BUF");
> diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
> new file mode 100644
> index 000000000000..fe9da89bacd0
> --- /dev/null
> +++ b/include/trace/events/dma_buf.h
> @@ -0,0 +1,166 @@
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
> +		__string(name, dmabuf->name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +		__field(long, f_refcnt)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		__assign_str(name);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +		__entry->f_refcnt = file_count(dmabuf->file);
> +	),
> +
> +	TP_printk("exp_name=%s name=%s size=%zu ino=%lu f_refcnt=%ld",
> +		  __get_str(exp_name),
> +		  __get_str(name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->f_refcnt)

I can't come up with a reason why we should have the file refcount in the trace logs.

Same for most other places.

> +);
> +
> +DECLARE_EVENT_CLASS(dma_buf_attach_dev,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, struct device *dev),
> +
> +	TP_ARGS(dmabuf, dev),
> +
> +	TP_STRUCT__entry(
> +		__string(dname, dev_name(dev))
> +		__string(exp_name, dmabuf->exp_name)
> +		__string(name, dmabuf->name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +		__field(long, f_refcnt)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(dname);
> +		__assign_str(exp_name);
> +		__assign_str(name);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +		__entry->f_refcnt = file_count(dmabuf->file);
> +	),
> +
> +	TP_printk("dev_name=%s exp_name=%s name=%s size=%zu ino=%lu f_refcnt=%ld",
> +		  __get_str(dname),
> +		  __get_str(exp_name),
> +		  __get_str(name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->f_refcnt)

Print the dev_name last, it's the external device which attaches to the DMA-buf.

Additional to that it would be nice to know if the attachment is dynamic or not.

Regards,
Christian.

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
> +		__string(name, dmabuf->name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +		__field(int, fd)
> +		__field(long, f_refcnt)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		__assign_str(name);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +		__entry->fd = fd;
> +		__entry->f_refcnt = file_count(dmabuf->file);
> +	),
> +
> +	TP_printk("exp_name=%s name=%s size=%zu ino=%lu fd=%d f_refcnt=%ld",
> +		  __get_str(exp_name),
> +		  __get_str(name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->fd,
> +		  __entry->f_refcnt)
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
> +DEFINE_EVENT(dma_buf_attach_dev, dma_buf_attach,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, struct device *dev),
> +
> +	TP_ARGS(dmabuf, dev)
> +);
> +
> +DEFINE_EVENT(dma_buf_attach_dev, dma_buf_detach,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, struct device *dev),
> +
> +	TP_ARGS(dmabuf, dev)
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

