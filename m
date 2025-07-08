Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA2EAFC381
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 09:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B725610E59D;
	Tue,  8 Jul 2025 07:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U3bOptRK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7075C10E598;
 Tue,  8 Jul 2025 07:01:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t64Q0zQyZe37umQZbtkDg6DEDIZoCvYq7dFR/7iqC2nw+55a58+cPFhoDVByu6JXJVCHSC7KHWEcG7i32UYh/yJEiAiaK2wScHgi8jCfJbctmHtpCbGP5U2/FiWbx/yt2mpoRwpOKpa+9bcILBj4UczyqEluCsRa6KFTNBjE3fyeJrw9PJVRi3AICouLzL3iKbMuA6fYDLNKG/CK5znPVXuxZvbtIN8eZMgUN6owy91hHu73Wxl9WSEb6AZyv8/bcReaaNQveVF09vZ9EMwXrIIGE1hc451C40971wFCyf/fzg3cwvtZcPfTRFl1tZPIba9AcZRofydS2Gb6XFbI/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYTNWmDCQSii5KoG7dJ2PuqM7CVqJFY3ot19Fgltnaw=;
 b=Qg610txPmnpdVGrBFuZQJELbCkVvGLWjTOc8TaaDOSpNnZrSENc6U3GVxnQbpoFWKIH0W5licvmsqO6XyFSx7kGc7kJDB6m2Tb7IJ/EdehB++hZrfLJG5h5u9nKNyniPb9f26Vn8mZUFYV3rKPKUmfXgyZG+7eQEt0+73GMEIyM5cH44Sb2AFL5pG283zs1PMlo50VCHlqsnCTAqqiAEXb1+15SFBaa1Mli3G5yy7q4Uae7LUsidVXAx//Pcb5BV4V9dzpAvXc2ll9YitJvu7M8/0Hv4cvS6BP42jQDSHxecc5FH72LTbzYkHlr1u0ayPYdaacjaAPf+qsyKapI1tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYTNWmDCQSii5KoG7dJ2PuqM7CVqJFY3ot19Fgltnaw=;
 b=U3bOptRKToYp5MENc+BqLNmOxjTUKYCxWUF7i25y61PWr/ByG6GqISDmiTBmWOexftKc3ArF9vZkim2eBQOmm7x1cC7HeI91l1ceKe6q4ShVAPemZkdYLnb2QqjlFaO2XiwqILjN//NBnHIJuFvSn0dl4/voelLgLE1qcvxn2x4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DM4PR12MB6424.namprd12.prod.outlook.com (2603:10b6:8:be::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 07:01:10 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 07:01:10 +0000
Message-ID: <470a613e-d85d-4943-aa48-7590d84f7fd2@amd.com>
Date: Tue, 8 Jul 2025 09:01:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported IOCTLs
To: Geoffrey McRae <geoffrey.mcrae@amd.com>, Felix.Kuehling@amd.com
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250708042219.180109-1-geoffrey.mcrae@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250708042219.180109-1-geoffrey.mcrae@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::19) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DM4PR12MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: b647132e-88c3-4016-ba94-08ddbded3815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkRCRUo1RzJKVlFwN0xSbkVISGxqWWRhcC9rNFJHM1JDajhoRDlFc01GNUR0?=
 =?utf-8?B?ZmRBekZodGFIYVllUkY0SDN6S2NldmduRW5RMk1VajVKVTFPbzlCd3dFSUJa?=
 =?utf-8?B?eVp0YmprcEdwVUFVeXZqWnl0eUpoZnAyK0VoWVhJaEhIMTNpbEs5R093ZG5s?=
 =?utf-8?B?a1VpT2lBbkNIcm9DTml3dmxRTGV0eHhLK2twTzlmd2NMUyt6anFma2pUWnFk?=
 =?utf-8?B?QzNvdW9xSEtuZnB4NFEyQ0UzL0pDZDJ2R1hzRlFvcFVCd2dsQjRJMXdqc2FB?=
 =?utf-8?B?QU9uaXYxdlUrNEcxdVpHL2NsbERhQkpPcGdGamlhWW1OVnFwR0Y3bXRxeXRm?=
 =?utf-8?B?aGU2N3pTOFI3a3I2YWswWUtkMnBFQVpMc3EzL09qU3BmdW1VRldaS2puTTVN?=
 =?utf-8?B?YjdPUmVxQ1ZWcC9SMFBKbHJQalYrcGZ6Z3pXNTFxYjZReVF5U3pVQk1LaXVk?=
 =?utf-8?B?SnMxTldwTnNaUS9LS1d1VHkyN3k0TEV4RjVrNFl5Ym8xRkd3dW5kZTlKWnNI?=
 =?utf-8?B?UGQ4RitCaE9lM3VqL3U0eUtzNDhFMDgvRGpLVk5TbFlucHN6M3AyL2l0OHoy?=
 =?utf-8?B?Uk9laDNiWFBZamZDSEhwM01DV2d3S2xDcEloZmQreWkxNk50WXlaTlJRakpX?=
 =?utf-8?B?MWFkY1BQOThXNklmRitodU9qQU5UbEplL1dUdmpiVHhUVmZVc0VxUUE4OVcz?=
 =?utf-8?B?TjZ0MUZqeCtHVTl5NW4wM08xQUFVd0pUWVFycjh3eXRuNUtDWTFvdXFNOHI1?=
 =?utf-8?B?cExMZ3l1YWpHbi92bzF2ZlJYamxHWDJXTk9Jay9zRjJXS1RNYlp5TWh5eUFC?=
 =?utf-8?B?MlVUTURidUdhcWU3cXRxWkJ0VUlzQzQ4YUJFUHBWSzJGUWZWc1d2OGNaTXhX?=
 =?utf-8?B?Zmx3SFRzOXYvek9oU1crazUwQ0VIOHBXQzdFejdmd3NRdFdSeG9jTGpTSnp0?=
 =?utf-8?B?VFVqVW1FZnk0RTdYN3Qxd05CQjY3Nngwb1Q4NE1tT0cvb0krY0RmT0lzUGMz?=
 =?utf-8?B?TXpLTlNrM2MxSzU0ZmZrSCt4TmpnUDNNR05VelRNaUwxM0t2dmZ0SDlhb1J1?=
 =?utf-8?B?SnNlbExnOUxZaDR1VXU2NWQ3RjFIcC80SmdqLzhrRzB5YVFHVnBVWjgwbEoy?=
 =?utf-8?B?RU1SUEVXelhUVldaK1I1QmsvV08rek5HT0dlQXl6akdSQzBpaTl0RHRjejVq?=
 =?utf-8?B?Q2hKVzhpdXRkdU1JRHhkWnRmdXRZSnRLa2owdElTTDNvTG04b0I5UVBhT0J6?=
 =?utf-8?B?Mm13TnFFR0ZXaGsrcmsrZCs3MzJCZDBRL3pUMzR4dFpQYlFXQk9DUkVuWnBh?=
 =?utf-8?B?Rm9pUVE0TjZHUER3MkU3WG1LUUo1Z3FIYm9MT3FnSXhsQVV3SUdtaWxKQkNZ?=
 =?utf-8?B?dmNLTlpyL1NmL2s2MUc0ZjBZWU1kdlpJVEhmbVJPbnlVMHlYK3pHQVJjT2tp?=
 =?utf-8?B?VEJGUStZYUpHZTB2ZkFkbXVnaTJHVFZHcnlvanVvdHM1Z2Z5VE11U2s3UXpn?=
 =?utf-8?B?bnR0dnM2aGNtZE11N0JDaDQ4Z09CSE5PNThMS2J4c2RuWXJ4NHFBN01Nckd0?=
 =?utf-8?B?QTlhb1BIb1loY0duT2xwSnBXTS9NMW9XMnpVbW54TmtYLzczZUZwQTNlaG8z?=
 =?utf-8?B?MHRaSkd6dTdGOVZLVmlZV3hJblpLM3BqMjhCbVFVUlVkcm9nRWMrUUtweXQ5?=
 =?utf-8?B?dHQ5bDhXNEJjUkNhb3pJakdCa2ZYVzdTMnFnZit2S0dkRmVnM2xMN0htaTZF?=
 =?utf-8?B?TGhMeXFDbkpoM2FNTnF0ZDRUYjRLajJ0YWxJR3pmanR5UnlCVG5ucUErMWVw?=
 =?utf-8?B?bmxJb21RYWJDVHJTQ25yaFlmNFFiTjRJVDlQK0tKTnBZWXVqR3FPaWV5L0tS?=
 =?utf-8?B?YmR6K1FObElLaWE2ODFhdHpPczQ4cFp5TTExM25IZmNLc0J4dDJLb1gzMFQ0?=
 =?utf-8?Q?uQW1U1Do3zs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDFiVzhaRUo2NThBQ0RxaVkxY01LZUZ6TitVNjNBZS9OaDRYdDRMK0oxUlFP?=
 =?utf-8?B?cU1aWVhUNlFxenpSU2NwNDFCVDhhbmNaMTRQN1lJWWFQMktDMS9mVGwyNkRn?=
 =?utf-8?B?T0x6ZkYwSlEzY214cEZ3aFNjSGFFV2lTRWRhekJoek1XdmxQeFF0dUYwMzRo?=
 =?utf-8?B?dFFjbFdvMk9HV0FWdXlRdm5qMWRDcmlQOUMwRHIyamFyN1VEcElZTk1CYmxN?=
 =?utf-8?B?alhjemo0Y0thUVBFV2ZqTEVCY3hDTWZUZlp3MnNUN1RHRVpua0U3V3NtUUs3?=
 =?utf-8?B?RnNQa0I5aUsvSTFqL2pmcEx1eWxNRnV5akNjL0g3WkdBd2hmNmNha2xvU0lK?=
 =?utf-8?B?eTcySGtsbE5nSzliSnFuM0FLRVFiMXVwZm43ejVrcnBvQ1c1dWMvVVU5aUEx?=
 =?utf-8?B?S1BUTEdtNzZ2UEZrS3NiWXl4T0JpZ2RmamxsOUtzRm9INWJBNTZkNFhGWm1S?=
 =?utf-8?B?VGcvMnc2U2J4TUFKek9PTE1ZMjQxWXVXTzhrMnlaQXYzaUJPSGdGdjh4Z01s?=
 =?utf-8?B?dnlQdnROUGVvaTI2eDNqeGRMb0FUc3BtZSszR3dLaHVCTzkvVzhPejZxOUdq?=
 =?utf-8?B?M29IdGpnbjlQOHY4SGl6c2JNK3JmbGdNdGpKVjEwNWVKbUU3NEo4MUx6VTFM?=
 =?utf-8?B?d2Q0a2p0aDFtSUdDMEpyV0psdDlwdEF4bmZ3UVNNQmdrMnpuNTdTY0NZVUhx?=
 =?utf-8?B?ay81SXBGTDhpTUVRcFlIckJsVDZ4dHhUK1VsK2JBTm4wYUxzemxqQjdENXhM?=
 =?utf-8?B?dWQ3MUpJZENPN3FoSlRkY3dta3FlTEtVL3YzRGoxYiswTWlDTU9obU9jdDV4?=
 =?utf-8?B?b0EwaWF2Q1RuaWFmVkYrOThSOFIxZnYvc3pValpvWmllMFdMcGRDcGFJZ1RT?=
 =?utf-8?B?aVN1dXRNM1IxOUtETTlMNCtpYmtTVi9mQjd5WThLMG1QMU1TbkRnZmwvMGhT?=
 =?utf-8?B?MzF5dHBOVStBWGZKNzU4dklvc1NuVVl4eVpNdW8vRjVWYXlMMFY3YUFnd29I?=
 =?utf-8?B?WmlkbjNYdUg4YjVKRlF0T2lmekxnOGk3YjJKMUMvcHZESmtDUFErdk1JWjIy?=
 =?utf-8?B?eXBFcFNzcW41azUyQ0NXb3BWKzdJN2V4bGZSZXlGUEpsRnFiNXl0VjRxRUFE?=
 =?utf-8?B?dFpIS25UWVZYUlk2V0JrRjBvd1ZwcmpnQXpNRHpzaFBCTm5OeExDV1VOTnlZ?=
 =?utf-8?B?cW80aWNqSklYY3BaL0RzMzYwRUNhbXlVdHNQN21oUXhETXNsYlJrYTVSV1VG?=
 =?utf-8?B?NXBBaXJ1aGswL2RWN2l0OVVnY0VMeWZ6OHFWcFJTWW42WkFZeXllWS9HMzNS?=
 =?utf-8?B?YU51VHBPaFNOSDlieUxUQXF6bHlpZ3NnTTljTVU3WjRaQzU3eUcwMjFCQkxs?=
 =?utf-8?B?aExudlNDS3RoYytOK0hWcHV1L2orVnl1QUxsK0tTSStINWJGZzNwTFY1UDRo?=
 =?utf-8?B?RnJFTmsyYzZLd0VMUDRnQnNZVjM5d2plbkFpaVY0bFVtbG5nTjFIZXltU2Y2?=
 =?utf-8?B?ZGZCeEdyQ1BFYUxyVWpnbXBwZUdMQ0JlbFUyU3N5cVBYRjFOdG1DdkJLR0hW?=
 =?utf-8?B?MXpNbFRtdnpGU3lZSWo2aEFCeXg4bjZSc0YyN2RvMll5anBsdTM0Vy9sNDFP?=
 =?utf-8?B?cFBUSVZhTC8xUmN4NDl3OTZ0eUlSTXVlTWVtNUp3bThsTEsydVB6czMxTmlV?=
 =?utf-8?B?TkdycklLR0NsaUN3eXpGSDlqQ1VleEtiMHZ2YjJDbHE2TkdkTkdIdkRQTVQ0?=
 =?utf-8?B?NFkzcU1Qb1RSekU2OS82a2lxdldYYTNvazdSSmMrS0plajVNVkhWSm9XbDBD?=
 =?utf-8?B?TVdOT0RpLy9ONlFpdUd0eVNCZk52WE54MjdpdGdRSlVjcDNKTm5Vd252VElt?=
 =?utf-8?B?M012L2Q0a1I1ZmMzQmVCK0JTOGFmWVcrdjBuZ1IrbDJBa3EwZHJGWTl3QUoz?=
 =?utf-8?B?NGFZQWhTZmZNaFArSDJWZ2NpZURkZkRHbjh3a3FHU0lnblFHdm8xWWxZd0tr?=
 =?utf-8?B?MERHcWQ3aWRadVJBbklEQUx0YTlZQXY5UWJMSzdkTzI5YUt4b3VjTUphRnpQ?=
 =?utf-8?B?dDlESk9FL3FIeXFXNXB3S3kzQ09pbDV2MjhkRGZjNWdmbUQ0YWVqK2MvMU1V?=
 =?utf-8?Q?IUxDBs/Q8kNG/Wt0g7WmL9rgn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b647132e-88c3-4016-ba94-08ddbded3815
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 07:01:10.6640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HsUcsLscPbkbiQKuw4MiUh1jeNUscRea0S1lfZNf41Is20C5Dq+PnWqjfXB3VjUP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6424
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

On 08.07.25 06:22, Geoffrey McRae wrote:
> Some kfd ioctls may not be available depending on the kernel version the
> user is running, as such we need to report -ENOTTY so userland can
> determine the cause of the ioctl failure.

In general sounds like a good idea, but ENOTTY is potentially a bit misleading.

We usually use EOPNOTSUPP for that even if its not the original meaning of that error code.

Regards,
Christian.

> 
> Signed-off-by: Geoffrey McRae <geoffrey.mcrae@amd.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index a2149afa5803..36396b7318e7 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -3253,8 +3253,10 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
>  	int retcode = -EINVAL;
>  	bool ptrace_attached = false;
>  
> -	if (nr >= AMDKFD_CORE_IOCTL_COUNT)
> +	if (nr >= AMDKFD_CORE_IOCTL_COUNT) {
> +		retcode = -ENOTTY;
>  		goto err_i1;
> +	}
>  
>  	if ((nr >= AMDKFD_COMMAND_START) && (nr < AMDKFD_COMMAND_END)) {
>  		u32 amdkfd_size;
> @@ -3267,8 +3269,10 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
>  			asize = amdkfd_size;
>  
>  		cmd = ioctl->cmd;
> -	} else
> +	} else {
> +		retcode = -ENOTTY;
>  		goto err_i1;
> +	}
>  
>  	dev_dbg(kfd_device, "ioctl cmd 0x%x (#0x%x), arg 0x%lx\n", cmd, nr, arg);
>  

