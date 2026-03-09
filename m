Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCTEMWj7rmnZKgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:55:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FBD23D278
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4AB10E56C;
	Mon,  9 Mar 2026 16:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0twqCehZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010068.outbound.protection.outlook.com [52.101.201.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B66B10E569;
 Mon,  9 Mar 2026 16:54:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hb3E1ZVR+SFs+bqX1JrJHfWHmzoJi2OhNA/vbP2kTsba1XDTEcg605jeNQMshhEm86bepthyYykRm29FkC4myxNxaNzfTcHtuG79/r3NwLDQp5PIDJw2atXvu9ydLNkqrZmihiXYw9rjB++j01L8dY5GJcoxnBwRQvPpM8KZzTI9cCC+5wvGWMWeepZKeMH6b4EYU8KthtwAHhuT21AEkv30Q1Oft+DVgnCVJk6KvyJkksfZ8RaqZTcrpDWFE40ilm9ev7EpfIsgQQzAS46LexSDv1QnbPeby2f4t4QBUEeCw8ikH9mUbg6Z7gAzZlFmlJVNfGB4MXw2NM2TrI/1Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0qL+ni7vndwq3Hfuo2Vx5hZLx1bcz6z7fvxQSjwNuY=;
 b=vqWOzfHTMbM/Gb1XYTQArvNbrj0c1dT/lq0BYCCIMd6pAkoyh5vBBmjliDXF1zQcGA26W/yKY0u6YbxHx+01KgXkTMMWfZe9ihcwUmP+KpaGJ73/hbDoNIjwdY2QFCQYIF2xPP+KS7L4IFnopoeEKzbjg7OD9wSVknhsR/zqUIdI/Lj8MnJV8sNkAeyLH4BZ28ZxHzu2ZRPOfcDJUTsKKUy40vp9wGMHbkiZrPnkH6NhBGvbh1KgKYQ3CWefBnfioMN/OJDGLHLs1QuBatoCwQRaKujfpqFap4tJaSFFGoiiSfea5mM0JZPz0jUZypbe8spuQZdPXHarkXRc8iHDeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0qL+ni7vndwq3Hfuo2Vx5hZLx1bcz6z7fvxQSjwNuY=;
 b=0twqCehZN4IegPMQUWG4iBKRAZE47Q1wugm2hVMuY+d4r6ogiAAOLmlT3jyHrwMeMEaOBDlM56yJpKpD4XVbpWQtHBJ4qMUZsoT+Z87BjBXTbadheCd3LyNrhe9jXyHKusPuJ+evKqhNHyzVksw54DOPZJO4zlx/KC74llU1LZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8129.namprd12.prod.outlook.com (2603:10b6:806:323::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Mon, 9 Mar
 2026 16:54:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 16:54:55 +0000
Message-ID: <01de9910-3fe6-4683-b005-f41103a9bf89@amd.com>
Date: Mon, 9 Mar 2026 17:54:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: fix PASID task_info lookup race
To: Fan Wu <fanwu01@zju.edu.cn>, Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260309160403.599472-1-fanwu01@zju.edu.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260309160403.599472-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0894.namprd03.prod.outlook.com
 (2603:10b6:408:13c::29) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f62797c-70c4-42b3-aaba-08de7dfc96d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: oZmHXWfgHzvHISqjBlH80qwNz5m0m8zeomGfsZB5EDZEko+YTDBTmnC7DwmUMlkew6OMuUMQxyDnbn2VhGjOJki08xKVwgOJK6z829Kielgl77ADTaqRcn+nX9UhE/V54uxmYdStaMpkVOcyyng43wFu14h77nPHsRiXSGrmQo7cASifYx5y3OJqUz5gu60xhNDvoaz/epPXi0TsRTOh7ZvHg55b+SxGnc6EUTAi++oRDjDkCcAs7Qd+5y7gKCbhAf+06r+y1H8iUDp+jPQ5dAVtuZeQaiF+3ZtmLkU4G6VO8Ia5d+io1Gmwrdt9JiKS7eXudWlhQBikrFLWOdKjn6a15yLDeUkMjMKAaNWOkIWgQPGe3HYYZwirxTs+rYPfK5ZeZuAnWdvFuDUTSkHkGQqGkFa5kfUE//NROqVooJ9a6w2tvw3RSWpg4YLAAj5lwQq7FnOMy9iuCR9iadi0Epje4Rf8YJokpWufAo/T+rt/0rEDyJuyLFFkZTZDQrdj+FBNleUuhEI6WVZSFJ/9MGIGykgR7BgnVxongp7TF2CqamHv7JP0/nwTty1U3lcNmjvyyyFp5A+H9SuPhNJsyH7GYaEf2Bw6xKQbCYQUsJolz+Xj1DtBUulS71GzUcBk0Tw02Emf3qwETzgTczKImoZ3Bncb8c67GtFtE2+qJM7VgQv2+YSa771n2figlSBNK+l3acbhOJMFPwAs6RlCui9h4lc+WcLolCZytN039iM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUx5cXpaSDJpUEo5dDNaZ09rblJmWG5mek10U3BFTXh2YlYzQVVZc0V3ZlRB?=
 =?utf-8?B?dzlIOVFXSmJqbnlUUjdKNlVRQUc0TndFM21lR3BOb2VpcG9TMk9JeXFvNTRK?=
 =?utf-8?B?a0FXTW1EWVZwaURuZk9jNFkySk1rTGlia1RyeHBrcWFkMXBCdVY4VTlYakJy?=
 =?utf-8?B?M1RvRUhPZy9mZ3FROUlielkwdzdtU3ZXS0J5b2tzTVNIMTlVZndBd2pZTGYy?=
 =?utf-8?B?M2pxZU55NEk2SzE4MVlmdXFERjNQdzFsS0hNN2xoVVlxdjJLRXhJdTJBaVkz?=
 =?utf-8?B?cGIwWldGNzVVSlN0RHpUOTg2dmtYWXFGakVIS1poTTd4dThEeU4xdWFMRXlT?=
 =?utf-8?B?OGVCMEh0aUE0WXZTb2ZWVmxLRkd5TXhPVkIwRzVqN3hFeFNjUEJHTDYxRVNN?=
 =?utf-8?B?UHpYZy96WkU0emd4UURqZ05scGpxNThzWHlRbUJVSGYvUklQSXRwdUdUSHNF?=
 =?utf-8?B?WHIvbTdnR2QxZXNLaGI2VzEwakJxdzlQSDBaeUdzZ0FOQU02UkF3amk0S1R2?=
 =?utf-8?B?V2VEMEo1SVdOYWFGSTQ4TkszZlNiQkRyci9NR0kxQXk5V2xDcHJ4dFlVTU4y?=
 =?utf-8?B?bzE5anQwdytSdEdIUEpKZFdBV295Um5tMG9DOFNVU1pnZyt3UGVmSjBJY2Fl?=
 =?utf-8?B?ZHB6RnR1a01mVDdCS2pNNGxYWGR3WjNPYmM2RmhQQWRqQjZDdmovUWZnd2pP?=
 =?utf-8?B?K3NjZS8zcEZnNjROTnZtR0hSODN5R1VUSFhhQU9lOFVkdnU3UkNGeU9mT21h?=
 =?utf-8?B?WDZ0MmZNbnFHdzBRcVdBckl1Q25wS1gxZHNTcnEzQW1hWUJLV2xBTklLTmc0?=
 =?utf-8?B?WlZwdjhRMUVCV0dLKy80eVhwOEZqbmxVa09LNFRJNmxTNnpQNDhrVDg3L0FT?=
 =?utf-8?B?U2FERzJ1SWp5QUlkRmRMZmdkL3BKVzB3dTUzeTZHTzJudTVwMENrNi9GYVVu?=
 =?utf-8?B?Z0lsSDRJWGhIV1BnOXQ0aWFlMEYxSnhXUXpXdDNNTFZuNkN2aEVmVCtadDlV?=
 =?utf-8?B?VXFrbk1DbTRNelZlNE9URGNpRnVxUlVkMzg4bE9QWDl5QmFORUFUdnNWMHpQ?=
 =?utf-8?B?S04wQUd4WktNZHR5QnVhVlFlVEp0TmIwRnBjbHliTGFDV3BKMVBnMnBoazNq?=
 =?utf-8?B?a2p4Z3YwYUtTMENqMFprbWhRN2tOK1RLNXdRbjBmNitjQU5KSmhELzFvM1g5?=
 =?utf-8?B?U05CY2Jpa1pHV011MThQZmlKSE1JbVFST093TExLanZUeC9xSktsUWF6RFNk?=
 =?utf-8?B?ckovTkp5SWs5VHJCdEh3bEIyOHg5cVp1bHRGcGpaR1lzNmgxWlo3enFGdng5?=
 =?utf-8?B?cUVLRXNORWY3Q3Nyd2U2amloUm52MHZ1NzVHOXY0TVladCt3TGZrZkxBNTVW?=
 =?utf-8?B?aW81ajY2NW9nWnJ0TGQ3K3FERTRsVXlWRjNHTkRUZzhSSHJwRVVpRDR3dGpu?=
 =?utf-8?B?KzUvYjJpMHVVTEtlS0J2TkdzaWVRNGh6UlZIbFJvMms5dWFQNkFiSTJDMmhO?=
 =?utf-8?B?L2tkeG9oRG0rdm5qbHVjRDBMYTRWRzB3TXQ5ZjRNc3VVczNyZWt2TEpjdklO?=
 =?utf-8?B?dGpKbWxKNXFWalVJdW1rQ1JRYXhUamRVSktoRThYK2xJS0I2WnQrYnlmU3Iz?=
 =?utf-8?B?bEZxbUM5Ry9kaUVZOTNUZTNvbTNaWHNQWXV1YS9ZSEwwZ3JQMXpWYUl0aTho?=
 =?utf-8?B?NHJlVW5kMmZPWGVpYlEveUtFd3F3MnVyVEpLdlhCblpMYitUa29JK2NwUnRq?=
 =?utf-8?B?OWtIRGlWU0t4bHFQbUl4ZDVuV1gxT05UN2dvY0l1aWRTSk5IMjBTWU9tMjV5?=
 =?utf-8?B?bGYxSlAvMDU0bVRrdTUzY2RLNnU3UG9uUGdQVWs3V1VIUTkwRVJmTjUrWTdW?=
 =?utf-8?B?aG5WOE1vMDhORkcxdmVvMVJzdFgyK0dpUm5pRU5UWGlCRktyT2JyWllYbjRl?=
 =?utf-8?B?WWpocmtudk8zZjB4U2hoZkpnai8yNThmb3dDOVVCVEJDOEhqbDl6ZTlZNUxE?=
 =?utf-8?B?bGR3dC9rM0xoUGh6aWd4emI1NUd6Y3NEZ3B2UTljc0FnbWNsU0ZZWFVNOURK?=
 =?utf-8?B?UEJSQXZSbStjRy9qRDRpVVBXSWhsOVVDYXViWEs4NTRjRlp4eUJEUWJ1Yi9J?=
 =?utf-8?B?ZlFUUk5rLyt5alhacnZjOURmblVEMTlZWldqenFTTC9mcC9INWh0TzBpa0Vx?=
 =?utf-8?B?U3cweitnZ3RaeCtSR0RhbG9pbWRIUmdremlvYjJwTG9oalFGdWNXTE44TjRR?=
 =?utf-8?B?TmpxdDh4RDkzblJtbnFoTEFhR2dWbTdpMXhYVWNwRVBMem53NVkvTTdHc0Vy?=
 =?utf-8?Q?AKKv99DonQTCBWk6ws?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f62797c-70c4-42b3-aaba-08de7dfc96d4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 16:54:55.0803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3+ezQNJkw32FN3CiABgFc1oQATONN6799pCR8VYgmYFCL78PzYuQ2n25X6naMWY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8129
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
X-Rspamd-Queue-Id: 73FBD23D278
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	NEURAL_HAM(-0.00)[-0.960];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Action: no action

On 3/9/26 17:04, Fan Wu wrote:
> The amdgpu_vm_get_task_info_pasid() function previously called
> amdgpu_vm_get_vm_from_pasid() which returns a raw VM pointer after
> releasing the pasids xarray lock. The caller then dereferences
> vm->task_info without any lifetime protection.
> 
> Race condition:
> 
>     CPU 0 (lookup)                      CPU 1 (release)
>     ------------------                  ------------------
>     amdgpu_vm_get_task_info_pasid()
>       xa_lock()
>       vm = xa_load(pasids)
>       xa_unlock()
>                                         amdgpu_vm_fini()
>                                           xa_erase_irq(pasids)
>                                           // teardown continues
>                                         kfree(fpriv)
>                                         // VM freed (embedded in fpriv)
>       vm->task_info  // potential UAF
> 
> This can leave the VM pointer dangling because struct amdgpu_vm is
> embedded in struct amdgpu_fpriv which is freed via kfree(fpriv) in
> amdgpu_file_release_kms() after amdgpu_vm_fini() returns.
> 
> Fix this by acquiring the task_info reference while holding the
> xarray lock. This avoids the window where the VM could be freed
> between the lookup and the dereference.
> 
> Cache vm->task_info in a local variable before attempting to take a
> reference, which keeps the lookup straightforward inside the locked
> section. Use kref_get_unless_zero() to safely handle the case where
> task_info's refcount is already being decremented to zero by another
> thread in the teardown path.
> 
> Note: An RCU-based approach was considered but is not currently
> feasible because: (1) the pasids xarray is initialized without
> XA_FLAGS_RCU, and (2) struct amdgpu_fpriv is freed with kfree()
> rather than kfree_rcu(). A future refactoring could enable RCU
> if needed for performance.
> 
> Also remove the unsafe helper function amdgpu_vm_get_vm_from_pasid()
> to prevent future misuse.
> 
> Fixes: b8f67b9ddf4f ("drm/amdgpu: change vm->task_info handling")
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 40 ++++++++++++++++----------
>  1 file changed, 25 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index f2beb980e3c3..7e8621c9b661 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2468,19 +2468,6 @@ static void amdgpu_vm_destroy_task_info(struct kref *kref)
>         kfree(ti);
>  }
> 
> -static inline struct amdgpu_vm *
> -amdgpu_vm_get_vm_from_pasid(struct amdgpu_device *adev, u32 pasid)
> -{
> -       struct amdgpu_vm *vm;
> -       unsigned long flags;
> -
> -       xa_lock_irqsave(&adev->vm_manager.pasids, flags);
> -       vm = xa_load(&adev->vm_manager.pasids, pasid);
> -       xa_unlock_irqrestore(&adev->vm_manager.pasids, flags);
> -
> -       return vm;
> -}
> -
>  /**
>   * amdgpu_vm_put_task_info - reference down the vm task_info ptr
>   *
> @@ -2527,8 +2514,31 @@ amdgpu_vm_get_task_info_vm(struct amdgpu_vm *vm)
>  struct amdgpu_task_info *
>  amdgpu_vm_get_task_info_pasid(struct amdgpu_device *adev, u32 pasid)
>  {
> -       return amdgpu_vm_get_task_info_vm(
> -                       amdgpu_vm_get_vm_from_pasid(adev, pasid));
> +       struct amdgpu_vm *vm;
> +       unsigned long flags;
> +       struct amdgpu_task_info *ti = NULL;
> +
> +       /*
> +        * Acquire the task_info reference while holding the pasids xarray
> +        * lock to prevent a race with amdgpu_vm_fini() which removes the
> +        * PASID mapping before freeing the VM (embedded in struct amdgpu_fpriv).
> +        * Without this, the VM could be freed between xa_load() return and
> +        * the task_info dereference.

That the VM is freed is irrelevant, the point is that we need to grab the reference to the task info before we drop that one.

> +        */
> +       xa_lock_irqsave(&adev->vm_manager.pasids, flags);
> +       vm = xa_load(&adev->vm_manager.pasids, pasid);
> +       if (vm) {
> +               /*
> +                * Cache vm->task_info in a local variable before
> +                * attempting to take a reference.
> +                */

Please drop that comment, taking the task info into a local variable is actually superflous.

> +               ti = vm->task_info;
> +               if (ti && !kref_get_unless_zero(&ti->refcount))

That is unecessary as wel, the task info is dropped after the VM is removed from pasid mapping.

So just using kref_get() is sufficient.

Regards,
Christian.

> +                       ti = NULL;
> +       }
> +       xa_unlock_irqrestore(&adev->vm_manager.pasids, flags);
> +
> +       return ti;
>  }
> 
>  static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
> --
> 2.34.1
> 

