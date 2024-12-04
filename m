Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64BE9E47CF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 23:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C06510E365;
	Wed,  4 Dec 2024 22:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WyK1C9Jg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5734210E365
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 22:26:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgqfttgQ1f8pJv2D+z80ciaex87rfSt+0OQiMYdrYiB+EpWQSXMzRCaOOfj/V5ChD503sqSdPQV35uMHd7agHny2NhFO2X6O+EoR4G3TGEOo3aFxI1Mp/icT3nVD7q/L17a2VrY/wTdlHgsW0P210lZJw3zQsKs7ICwpSNNh71ip/OREVPQFujHwot9+cB/Jk7UO7LdDapNDx3IsV5EG2ujEs9uzaTvcGrYVwDc5ZcTd0slLzYnLzhcTNogVr7If2Px+hV807UR2h41SD18LeJbjbEFshm+LQ/gJ8+MZEytjDU/8iW+Y4tSu3Ubi+T3F4MkemNPN1VdvgcrFunwR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APLv1eB/earhf1D2Kk1j9JDlBUYCac7AieRFi8udKmY=;
 b=ELmwcUDfLf+wbk683pVmUUEgmNoBd9td4RB6BGaaypDD/FEWtoAiYV0F8cGuYbZsu9Qbw/k/XJj1sRkErb9nn/6L2ipRyF2zXf6RoSZgBroZOx5ddJg2kPMsxdzKtkcUPrWI7GYWvExk7hk2ZhahVAVxKid8qgNjnrDvjwiN/nsqj6Pm1GVk0l2XCrlHmrBLAbZHQy38tCbwxCPqRsAgUwvXhi1iGYqsHQM1kKQWHefMu4vFZjAVx0fGSDxDeQ9qPKeYT0ImC9nLjLyKRLf2tQ2HpjOjo4V80E5WRWkoolMucLB2EUzNKIU9nbqNKZgSc4E5RySvwFNmO60vbR3ptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APLv1eB/earhf1D2Kk1j9JDlBUYCac7AieRFi8udKmY=;
 b=WyK1C9Jgcsbn8pwX3sDN0FREKZt5YljaYfz0KXYXtJkaNCa0FKUYlic6N7g+nX3RiKjtoU7nr1A+AV7Zrl7tevBCH6LRh6tsxdMLbITVfrhzlC/3CjJ0NaEB0IihNrS6vABRVjaw5BjbsBhzzXwe9btxuZPhxQsitMcZLZL4nSU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH0PR12MB8175.namprd12.prod.outlook.com (2603:10b6:510:291::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 22:26:45 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 22:26:45 +0000
Message-ID: <e551fe89-6e39-4393-9e50-cae4a819e947@amd.com>
Date: Wed, 4 Dec 2024 16:26:42 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/7] accel/amdxdna: Add device status for aie2 devices
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com
References: <20241204213729.3113941-1-lizhi.hou@amd.com>
 <20241204213729.3113941-2-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241204213729.3113941-2-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH0PR12MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d7f813-bced-473b-30ad-08dd14b2bc3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjVrd1NzejVDNXBGMUcxWmtobHZVLzY4Vm1na2V2cVFuWVdRdGJ4NzZHanRP?=
 =?utf-8?B?RDNGYXNZeVVPSk1JSERXWWtXeHA1UWsweEZ6M3RFcm1ldWdWaENVN2NHaXFn?=
 =?utf-8?B?aFVFSnZqSnpNbk4zK0hXZGM4dCszeDVkQlhaQWtjMlZhcEgybkRsRnQra3Iz?=
 =?utf-8?B?YmJTOUJPZDBhZW5lN0RISHRlbTlhWldyMnVrMVlQN0VnLzI1UHhpaW5lV25h?=
 =?utf-8?B?dGZMTmVoMVcwWENxTzlFUTRyTXZvNmlncUZGc0gyejB4Mjd2cU1KVTdxSmI0?=
 =?utf-8?B?bCtwZ09kU0k5clloTkJ5U0xkeTRxMit3aFpNcDdQYzRzN3R2VDNLazZGa3ht?=
 =?utf-8?B?VUxIY2dyWnV1ZitnM1YvUExXSFZvQWtCNnVMRGMzRmdUR0pIMlA0RXE4REtI?=
 =?utf-8?B?T1FZVmpMd2EwbVJDM2daZnMrMUkzQTkxdkt4TnNVM0Fob2phWVFjZGd6a1Vq?=
 =?utf-8?B?STM4dG5PM0dFYjBmTHY2Q2RzS2YydVl2RTNibTZ5UTZmdldXdkRhYUdRVmJK?=
 =?utf-8?B?M05QZkRJMXNnRmp3MWxjakEwZE1OZ29jd2xXbmRQS1grUHlQVW9NVnRXdVF2?=
 =?utf-8?B?V05jSi8wUWlRYW9ZbUh1NEFQZkMwWmlxS1BLeEZpeGtUSVR5R09IRmlERHkr?=
 =?utf-8?B?RjBGMGVMNHZRb3NSakNVR0ZpZGFoTUZOcEplZHhXbUZUb2oyRnpYcXlRM3Vh?=
 =?utf-8?B?YkpHMGFWQXpZTDhPM3V2U1BOMWJteGp5TjEybTNiY2hZUnFxbzB0NFlsbmJo?=
 =?utf-8?B?MmlTSkdWYm9XSnlpS29WT2RnZFhxUUtMNDk4YVlwanVlbFYwWmpRVk9ZcFRR?=
 =?utf-8?B?VVVhaWdGSmwxZXVMemlTNnBscnkvWDBmNUFsNEdWTncxVFB5MUNNMDFwTGt6?=
 =?utf-8?B?cnc3RTZKVFhKUmNFKzg2TEl5Z0p1d3hTK2w0S3lFWDl1NTdYSmhwTnplV0Rq?=
 =?utf-8?B?L3Y5eFVDZ0Z2ZEQvZ1BYK1g1dVRqK1lCN2lPd00xT1k3YWcxMDlkbFc5eVlo?=
 =?utf-8?B?cU8wMXIvNkR0Q25aL0tCSitUdjl3cWJ1RTcvQk5lYmVoanVPbkRqSzM0d0Mr?=
 =?utf-8?B?M2IzYmJMeGErMUNzK2JZWXNwZW9CSVgwd2RlNzNhZWsyU1oyYmFLZzZlTmlr?=
 =?utf-8?B?YnpEdWlTYXhjZDZmSHdWZjQ3MDBydDhiaDJiR2prSGZMRUhUK1BpQUFDZEpo?=
 =?utf-8?B?QjZGdENva2VJRXo1NFZQU0xZU3lFeTlQanIzY2JxS1dPNnZqdyt2UGh4ZDNX?=
 =?utf-8?B?VzhQa0tUMTF6a2RWdHhPeEZQeEdqbTdMVFdKNjYweFBKL0t0anlkK1llOG5P?=
 =?utf-8?B?ZzEybHZvMlJtRVNOZXFCeDVYczFZWjhGYXBwQnVNSCtxZ3ZVNW0wd3dqazJq?=
 =?utf-8?B?TGorcXR4L0tvNUNrZnBnWnVlckZtQ1FvZ2NWWUZDdzhEUm84N2IvSloxeFBH?=
 =?utf-8?B?L1c4MDFuVmdYdmFpYVQvMDJ3QjQxWVJVdmd6MkdaajBCZ25rSXpkeUhFa2hm?=
 =?utf-8?B?ZjluanF2S2RydWdXRjdKNDVOS1VZSjNVNk41MVMyc3RuWDEzTFZJeVRLblBW?=
 =?utf-8?B?NzkvalVyWEZzUFhnL2tzWWFSM05Od2tiWHVaSStsV04rczErZ2hZVWJ2N21a?=
 =?utf-8?B?VkYwSGRLTWRGSWZNVUgyT3RHNGx5OCs4ZGo1VSthMytJU28yMTdHczA0Z1Fy?=
 =?utf-8?B?bXdhWkZtL1pEbExJZ2VyTEM0RWMyT3k5cmFUeXBsVy9MSzI0Z2ZJamF5emxK?=
 =?utf-8?B?RjhLbjJlYjVKMWRVM0g3K3puM09IK1o5b29lZW9hWlRZd0NyN2FxQnIrRm5R?=
 =?utf-8?B?aDRhejhCUldzVk04SGJ3dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHE0dzlsUGNLN1dlcUlpNTlpbDNnTGRoaUlUQ3dCdXJtYzRCcnc3UmFUTnFD?=
 =?utf-8?B?WVdDZGk0TXlCcDdYMjhjaDYwMTlVaTJOZEEzZ1MzaW9NNkNEdnA1SzBRQ1Rv?=
 =?utf-8?B?REpWdDI0ZWM3OGRKVi90UGN5dUpYSUdxS2x4MkdHOFN5KzI1WmxWSU9XdnNK?=
 =?utf-8?B?amZIa1hlVkd4alRmM3BTM2tGV0lHZGd0T2E5WHorL092WldnMTRkeGJPWks5?=
 =?utf-8?B?RU1BRG1mV1dncS8wQ1dWVHZ0ejZ4ZEI5bHd5Ym5HdmxHZ09yRE9nWnVjbWsr?=
 =?utf-8?B?OG5jQlV6NHhVRkowRWx0Nm1yR3FMRXFmQnB2TTA4bzA1UzRDaEYyck1hTEp4?=
 =?utf-8?B?L3J2U3praEhxaUZpSWlUVXRFOXQva1E5MVdpdDc4OVozb0dEbTh6bG9pb25C?=
 =?utf-8?B?eTdycDlSV01Rd2ppSG9UdEdTYXA3ejJEVkdTajdPSmtQdzgwZTIzajByK3lD?=
 =?utf-8?B?Nnp2WnRrYytGVlF0ZUQrUVMvVjJmZldPclI5T2cwYkczdDJCZnllOWxBVzhs?=
 =?utf-8?B?SXREek42ZS9ScUx6dVlic2JCMXNlVDFacjRzUSt1QU5maHF5YXpidktLSTVH?=
 =?utf-8?B?QndnZWJLOHFyYm9TNlNjRFJlUWNrZVpwWndmMEpHaW4vMCtQNytROTlWQ2Yx?=
 =?utf-8?B?ZmFFeTl2aUJ0Wk5nMXpGbmNXTDhFWS9NTDM0S3dkK1UrOG90elNEN1djZXJq?=
 =?utf-8?B?bFlLbGt2eEE2QXZRbVJYSDJ6M2RMVTNSWXhSZlY5R09jdytMUHRQSVFsNGpT?=
 =?utf-8?B?VXRKZXN6UTgvcFJEVTZ2RHVoVnczUUFSbDBkUjl1b1ZwRlZjcmI2bWx3VER1?=
 =?utf-8?B?Ym5PWll2Q3dyN1N0WjBRYTEvdWJCN0l6ZzZDeHJDY2tOY3FhUTRiNXI4bUxx?=
 =?utf-8?B?Q2w1RzhDYmRjcUs1N2NNdUFRYW5KMFVDVWZsaFhtRW5QaHc1cDcwbFdKQlAv?=
 =?utf-8?B?aVpLVGpDMGpnTXhiNXZOWlJzS1Y3T2NSSmZDd05CeTNIM1FUbTZ4VytzK3hs?=
 =?utf-8?B?M3ZGMXgvUnkyWWV6bkRoMGQxdmxRcmFIZGxuWWVrSklhSXNrV1JBNkhTRnlG?=
 =?utf-8?B?N1hETWpWektiTzNNVmlOdTV6aDlEZjdtcVZ6aVhuSUQxZmc4TkN4a2VRV1B4?=
 =?utf-8?B?bERGcVY5cjltRzZtVFZXNjArcHE1UWU5VU1jLzJNWit0Rzg0d3JQTmVqQjdq?=
 =?utf-8?B?YVhHblJhS1ZZVFNwQ2RLby9lN1RsMzc1SjJTY3BFWVREdkNxZFhOTFE2L2lW?=
 =?utf-8?B?Rmw2b2puWFU4Y25jMHg2NzlzT2dabmJ6Y1YyQzhSSElQTThEbFA2TEpXRXNV?=
 =?utf-8?B?c0V0SE43UHYzRlBBaHl2K3U5d3BxcUtpOXpPTEZKQW1oTTlYMGcxS1hoVTJ0?=
 =?utf-8?B?V1NxQzVvZlpod2dEUHhEc0JQcCtjRUtjKzRLc25PWnJuajRLL0cyYW9Kalo5?=
 =?utf-8?B?WlBDWGVBVlFQa0RZVzhDL1Q1V3BBNXpkakxVUko3ZlkwMnZreVdLTG9xU01z?=
 =?utf-8?B?Z3VLbDhoeTF6N2I4aXZ4S25Jd1Y5SHVXcFNQWlpXTGx0Tm5GZ2NCSWQ2KzVP?=
 =?utf-8?B?QnRxUFhydWlQTURid1cvWmtlK3d1S2NQVmFmTnltSWd6Q21DSmpLZkV4d09V?=
 =?utf-8?B?WXZHWWZFTnlGN3Z5clQ5R2lubFdnU3BQYXVMaE13UWp5ZHhKajc5SnJSeFdK?=
 =?utf-8?B?T3NhSFB3dFJrSDJOMFVWRTczNEFNYUVSUnVMOVppVVJOUWU2dnlNK0k5aWVv?=
 =?utf-8?B?dVI5VzNHRFFEWXUwSXZIeHRld3pYQ1gyNUZwRy9GQjhmeDlRVWdJb1FQNi9P?=
 =?utf-8?B?MW1LcTdIQWdaMVhBWCsvcWFTdnRoZ0N5Q09KTGlEb1lBczI4M3pYMkFBbE5H?=
 =?utf-8?B?bFQ3NjJ1UXNuRmdNdlhIVDFrTWpmUjBWbkt1S0Ewb3R6V3Y1ZlVEdVhvOUdX?=
 =?utf-8?B?L2t3L1cwYitJSWdyWUFyaHZTS1dTWjlNTmFQMXBxcDc5QnhuU1Q2akZZQjBH?=
 =?utf-8?B?ZHpVOE1kKzRxZkh6MFFYU0FjeXV1blFYMithdjVudk9lTVpFMnRseTR6VG1r?=
 =?utf-8?B?VmtDd1hhRWd1b0pvU0c0d2p6Rk9GQTRnRzF4NXorRXU0aGgwSDlLd1Y4eTVT?=
 =?utf-8?Q?ENaRPeT8TgtgNd95DPnde7yrc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d7f813-bced-473b-30ad-08dd14b2bc3e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 22:26:45.2849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+B9T7AbgPQDIgNZya2C/pNYti7bCR6G7lp5lnFvhtaA1GSYwlNMx4HRT5mfkMvTkl2Ft89qUipVf53XpvuDEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8175
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

On 12/4/2024 15:37, Lizhi Hou wrote:
> Add device status to track if aie2_hw_start() or aie2_hw_stop() is
> re-entered. In aie2_hw_stop(), call drmm_kfree to free mbox.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_pci.c        | 17 +++++++++++++++++
>   drivers/accel/amdxdna/aie2_pci.h        |  7 +++++++
>   drivers/accel/amdxdna/amdxdna_mailbox.c |  6 ------
>   3 files changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 349ada697e48..19c76b2b204b 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -267,12 +267,22 @@ static void aie2_hw_stop(struct amdxdna_dev *xdna)
>   	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
>   	struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
>   
> +	if (ndev->dev_status <= AIE2_DEV_INIT) {
> +		XDNA_ERR(xdna, "device is already stopped");
> +		return;
> +	}
> +
>   	aie2_mgmt_fw_fini(ndev);
>   	xdna_mailbox_stop_channel(ndev->mgmt_chann);
>   	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
> +	ndev->mgmt_chann = NULL;
> +	drmm_kfree(&xdna->ddev, ndev->mbox);
> +	ndev->mbox = NULL;
>   	aie2_psp_stop(ndev->psp_hdl);
>   	aie2_smu_fini(ndev);
>   	pci_disable_device(pdev);
> +
> +	ndev->dev_status = AIE2_DEV_INIT;
>   }
>   
>   static int aie2_hw_start(struct amdxdna_dev *xdna)
> @@ -283,6 +293,11 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>   	u32 xdna_mailbox_intr_reg;
>   	int mgmt_mb_irq, ret;
>   
> +	if (ndev->dev_status >= AIE2_DEV_START) {
> +		XDNA_INFO(xdna, "device is already started");
> +		return 0;
> +	}
> +
>   	ret = pci_enable_device(pdev);
>   	if (ret) {
>   		XDNA_ERR(xdna, "failed to enable device, ret %d", ret);
> @@ -345,6 +360,8 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>   		goto destroy_mgmt_chann;
>   	}
>   
> +	ndev->dev_status = AIE2_DEV_START;
> +
>   	return 0;
>   
>   destroy_mgmt_chann:
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index 6a2686255c9c..5d262ae5c9bb 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -149,6 +149,11 @@ struct amdxdna_hwctx_priv {
>   	struct drm_syncobj		*syncobj;
>   };
>   
> +enum aie2_dev_status {
> +	AIE2_DEV_INIT,
> +	AIE2_DEV_START,
> +};
> +
>   struct amdxdna_dev_hdl {
>   	struct amdxdna_dev		*xdna;
>   	const struct amdxdna_dev_priv	*priv;
> @@ -171,6 +176,8 @@ struct amdxdna_dev_hdl {
>   	struct mailbox			*mbox;
>   	struct mailbox_channel		*mgmt_chann;
>   	struct async_events		*async_events;
> +
> +	u32				dev_status;

Shouldn't this be "enum aie2_dev_status" not "u32"?

>   };
>   
>   #define DEFINE_BAR_OFFSET(reg_name, bar, reg_addr) \
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index 415d99abaaa3..eab79dbb8b25 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -530,9 +530,6 @@ xdna_mailbox_create_channel(struct mailbox *mb,
>   
>   int xdna_mailbox_destroy_channel(struct mailbox_channel *mb_chann)
>   {
> -	if (!mb_chann)
> -		return 0;
> -
>   	MB_DBG(mb_chann, "IRQ disabled and RX work cancelled");
>   	free_irq(mb_chann->msix_irq, mb_chann);
>   	destroy_workqueue(mb_chann->work_q);
> @@ -548,9 +545,6 @@ int xdna_mailbox_destroy_channel(struct mailbox_channel *mb_chann)
>   
>   void xdna_mailbox_stop_channel(struct mailbox_channel *mb_chann)
>   {
> -	if (!mb_chann)
> -		return;
> -
>   	/* Disable an irq and wait. This might sleep. */
>   	disable_irq(mb_chann->msix_irq);
>   

