Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CXdBCzCrmmRIgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 13:50:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5533B2392C0
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 13:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC27F10E4E0;
	Mon,  9 Mar 2026 12:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GTKkEhBb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A33B10E4E0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 12:50:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2HapOnFZU1bk5bgEIm2hh9evF12GbAtVmXZZ5/KMJGl0QKhHLTLaomRtvhU1EEj8hgIoq2AyYZ5I0Vavz+l5uZ/HKWkdcW+3xIwjIy7lxJyl/wzSxvIfCKFTantnvWjwT+ysJllbqdB7QeVkwP7Q4MtEFAkaRmHnxvHgk+UWTxkEuw001BAQthj87KiRzW5G1kawl5vTbJ5UlyFRcHUrtsf2kjVMjxuanQHm3xKdM+mzKUtkY1nja0gyF1Adl8g23dMJUMyRF6aDvoyLe6b0m/V01qV+eZbbhXNfQ1kvPAagePhECIgeEZJX8kTv9TD2j9/hR1J+7zk/4Aq+ZqkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuK/I6ca/6hedeo93gFvZf7RkhsrNq5UwGmlcDpsZRk=;
 b=Z3KivMRH8dyRio2QyKtdo3OWCx3eyxO/Npi7ZPJF3bJKIs+hUvGYK+gMiaYA56U76iTL/F1Ma/+lCmQ7i6pK288tpM206v6bbpt7xYot9Hvm2bU4zKpcA/aTIbNtxxdCOplqqMOKVv7rTEE6KCb9aHdEtTVqGSHGDJKTIKD+mSdMSKHB21hSmvKfOyfIJXMCVQ1G0IRQDB9dV5rIk1G639rifzIfj46rKp57pCObhQQVK2LWf9gDK0ed24ccPNa159jWGsUOFsR4ltaUcujUKEq0tYuJ7mGhvYs8QmZMO+P9l40dki4AEF44WWmgf7T0beQ9c3cCVzLptM31ypPJxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuK/I6ca/6hedeo93gFvZf7RkhsrNq5UwGmlcDpsZRk=;
 b=GTKkEhBb1cxQZmFf6/ysjTjAIu1/IJJLu/4vGDJD4WUnPE4VxLH5NrSIbJolv5jlHDOsmKRFFB7/zq6a2uOClwCd7CJC7GhRUL3cAeTYquI4wBM/ljUxVj0W75ua8TdL0ID2u8Mt8cxgn4uLEUrrmNXM+lG7/Sux+fXdwagNkEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7217.namprd12.prod.outlook.com (2603:10b6:930:5b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 12:50:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 12:50:40 +0000
Message-ID: <5c8e2741-29ae-4f7b-98be-71e9f236ef93@amd.com>
Date: Mon, 9 Mar 2026 13:50:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Fix the "done_fence is initialized"
 detection logic
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>
References: <20260309124318.222902-1-boris.brezillon@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260309124318.222902-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0329.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: 29d3a34a-ce26-4040-617e-08de7dda7813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 4yy/i65R5J4zRgGIdkh+SVa/A2V0Y+9fTWP6kDsFEldfZlzNhNuNOQhkOCeSr1r+RcTuRsWpjZbSabedxzBJ1g58dYCrhZpQs8oewz3t09OF1VVBWfpeW0QzsSdooUEZwz2nRAasJXnYdB4iNZp7CxYEKMNChnNFcqiV3BR0J/KyVYkEYi+1RteLRElr6bBbuWO1/n0hnn+1/49vnciV1z3zWAVabtVysK5huBqvy/AIELGpNs683RI5r9cQ8OeRYI2Fbyz0biwCuZryUrWktE3O7fDVMVd60KfD7HMFzESOt9FTMs1K2CITSGMw5TKV0I81EQfaGpSkDNQ9uNEGchDE18swrzXqLD7iQo54N2sZgoJqNMZmv6+jKZFHJ7sbsbY1gnJDvTxrA/02s/yZz4xDbkcKVyZ/mydW2UAjTJOewoyHsE9IfGtYrBgkiU3dRmCLT0eFXhyuJFWxTf7fSbO7yFeb0SfCQbPPmbMa6BMA0fFg/ozKaa3xsMpK4Kq8WchDbHsQtyGTNnI6mXpCzS3coRcB91IUmEZ+eCI4HkXhloJ+7ITsl0S4mkrIRy3s1+5HzSQ1Enq+5C95LJvQDFEWVgk2WsGnlNO4Wrw/fIBmHDeAmHMPqdiefc3Vzk5KwK7wocU+NQ4/LdYPGzUyC/6vXgZFk0xW85h3vnS0UWAsfScA/9lcQd7DVEJb1Sm9E/ohemideCl6Jp7DaqgnxoqeRHi46keCOjrQUuhA5ZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzJndlZHWHp1YVFDYlhlTTBVcTB6RHZHeEYweXlBcVZjUlRGWWFKVjhsRU9V?=
 =?utf-8?B?MEpKcWZsM21zTm5pb0tORDNXRTlOV2NUMjVTcko5NTFyZEIyRDZMcjFTZGdV?=
 =?utf-8?B?SGlTM2RHNjAwSjJMQjJPVWducUxZV2p0M2c5V3FkS2NOSUMxZ2twdkgwWWpY?=
 =?utf-8?B?SG9jZVE5cWNEZ2Z4UEtEN0ZPQ0orUzlYTklUMzZkMFU3dHg3Y3VjZUxZazZn?=
 =?utf-8?B?T1Z6SDZHaEU5WXdoME9XYzlmZDByNUpRRzJ3OEFQWUpsSWRrNWRIUGdCQjgz?=
 =?utf-8?B?R1ByMTlHalh5NGY0NTlmR0ZiU2VjMkdpYll3ZWh5SVVWYmJCR2drZ29uQ01M?=
 =?utf-8?B?Nkt5eHNJSEcvUk5wQ1dtZkFEMy96aDBUSCsrR01pbTVFMGVaeGV1MUJIQUlC?=
 =?utf-8?B?OXhqcHMxajNQdkVMdDUzb3VZdnhYSExoRGNyeWtValZ4blBXNVFILzF0MWFy?=
 =?utf-8?B?bXlBRUc3bVByZDZRazh4TnZzMEtaV04yZUhoaEhBR2NYbDVGQmdLRGNxUGJX?=
 =?utf-8?B?aStENEcrYkFuTWlEWk84LzJqbnVwLzRPSVBkWWxGb2kzNWhZeU8rdHNkUHdp?=
 =?utf-8?B?NFNucWtUNXFJNU8zcU0yYmdHeVZwRWs5MFY4UmJLN3dVSGpKUUFOaHQ4VURz?=
 =?utf-8?B?bC81SW1oNXZXa0V6RzVoS0c2ODVzejZxVk5wV3pld1BwcE1oWHpNNjRKRk5v?=
 =?utf-8?B?VG85RHF4M1FpNENxNGRseGZQaWhKeDNyanBhOXJDQUpJaUIvTjE5SmNtS0dk?=
 =?utf-8?B?bFFELzBFYm1RaWUxdmV3SnhhR2tOdll0VGkxZ2xCQkVZNDlvejZXb2tpRnl2?=
 =?utf-8?B?eXhRejBIaThvVWdwZDRyV01sL2huWjJtZEV5dHZYTlNkcUNHNmVqNTdIbkZL?=
 =?utf-8?B?WVd1WG5QSVg4b29QcDN4L25XaFhjaWVpVTYxTnZ1MVduWk1zY1BVZjhiRWc4?=
 =?utf-8?B?SkZWMGgvcHh2ZS9PeW15Z3p6MUM5Wm1XcC9rZHN4WWRIaEJOOFF1ZXFKdHBC?=
 =?utf-8?B?c1RSUjZZeGxEeVlLWVYxNVkrT3hoZXc3aXhQUTRNMWlrcFp1NllwZ3JlVmFX?=
 =?utf-8?B?LzhDbmozb3U1MDJFeE1CWjh1YlNvYUxpbitqSTBtMjQ1WUI5WGRKaEUwcC9V?=
 =?utf-8?B?dTdyVDc1NWI3eWpJUXBCQzNuZWlCdGt6NytuM3BiTXhoTXBnMyswa2tCclF3?=
 =?utf-8?B?bnRTSWh6czJ3ZUJUQlYxNzgxTHRyazV0R3pLaUdTRGN1M0xmSTBmYmJjR21M?=
 =?utf-8?B?V2xQeG0vSUFNZG5hSGFEci9YT0NhNnJ3MG9GNm9rbzFZUTFmLzJ2a1B4T2l6?=
 =?utf-8?B?OENCUGRKWS9rOXZFa1RlajRSamtoNTVhM2J1cFpNTFNZQnoxaVRiYm82RGpJ?=
 =?utf-8?B?N2N0WEZEVlBPQXZJcHZNcmd3UlNYaEtZNzliZ21kQVFpS2prU1dkVExKYU1M?=
 =?utf-8?B?U25zVExxNkEyZzVERGZ4ekxYcWR0cWNkamhhTEFkZTBBU21jQ3dKOCtVQkcr?=
 =?utf-8?B?MzNtQVRxSjl3SHllRnczTkNiM3lPN1drV2FYckcwTU5wYnpKeUIwQzdMVDAv?=
 =?utf-8?B?MWIreGdFbGFFQ0dralp3amlGblJ0VWtsRXJwVWIzSElLNnEyaDJSc3dWVzUv?=
 =?utf-8?B?SzQwZVpXbHFJRy83d0d1cUl3TlFFc0p0Y0VJTkVnamd2UDdDNEZKcnlPakh0?=
 =?utf-8?B?QnYvWXBuTm5od3diWkozRjNyRkVhdUxxRXVvWE54ZW9ZMkFDd0pTQ3gyZHB3?=
 =?utf-8?B?QjdKUUEvRXB1N0xXYVQ5RmEydzNOV01HNVhPVGc3Y29GMERtdG44YTdNb2Rw?=
 =?utf-8?B?ZG9PNXRwdCtoWHJ6YnJkajdERUdPeVdJR2FVQ2VDR2pqNEZJdzNWQ2FzaXNI?=
 =?utf-8?B?MldTa3JDUlJvQXU3Tk1qQmMrOXRBLzVxcXVwVDdQRHFNbEFZRDdKQVhDbzVJ?=
 =?utf-8?B?ZmE2MkZTdXhOT3BzVlRYbDlrNWVUczBScTNlYUlVbUcyY01QalhFZFphdkJI?=
 =?utf-8?B?Nm5tKzFXUzlOOS95ZHg4bVdJR25lYzJWd2FVUWpNSm8ybUVVdHF6eUo4cndZ?=
 =?utf-8?B?NnNDME9mRHhONEY0QndPMS9UamhrRmNDM0tkOUpZT3BaUWVNa0daTmZXVS9F?=
 =?utf-8?B?TE9FcnFUM1dVSmUwMmJ5Z2dyWm1GalcwaFdjMU41WjE0K3hMeEFod3VOUzU1?=
 =?utf-8?B?NnB2YmhHa0xDVDR4MCthQmU1OXE3cEE0UXZHNHp3RGhzQjNXN09lN05WdUFs?=
 =?utf-8?B?VFB5ZU9kM1ZnYSt5bkZUalZVaDJJOUhNRjdEODRrMENnaW1JMlg5c05PVVlv?=
 =?utf-8?Q?9r8C7zpMHfzY6320OA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d3a34a-ce26-4040-617e-08de7dda7813
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 12:50:40.5917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 716+efmzYngoCi53OftA8+FK0w1AzULZCTGlSHQo7MrJngKxhRvLBSY1VG7K+O3j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7217
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
X-Rspamd-Queue-Id: 5533B2392C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:kernel@collabora.com,m:nicolas.frattaroli@collabora.com,m:tvrtko.ursulin@igalia.com,m:phasta@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:email,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Action: no action

On 3/9/26 13:43, Boris Brezillon wrote:
> After commit 541c8f2468b9 ("dma-buf: detach fence ops on signal v3"),
> dma_fence::ops == NULL can't be used to check if the fence is initialized.
> Use dma_fence_was_initialized() instead.
> 
> v2:
> - Use dma_fence_was_initialized() instead of open-coding it
> 
> Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Christian König <christian.koenig@amd.com>
> Reported-by: Steven Price <steven.price@arm.com>
> Reported-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index bd703a2904a1..c15941ebe07a 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3915,7 +3915,7 @@ static void job_release(struct kref *ref)
>  	if (job->base.s_fence)
>  		drm_sched_job_cleanup(&job->base);
>  
> -	if (job->done_fence && job->done_fence->ops)
> +	if (dma_fence_was_initialized(job->done_fence))
>  		dma_fence_put(job->done_fence);
>  	else
>  		dma_fence_free(job->done_fence);

