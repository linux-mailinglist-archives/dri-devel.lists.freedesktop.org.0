Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76028873393
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 11:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22FC910FE87;
	Wed,  6 Mar 2024 10:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WchucNV2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8F410FF2F;
 Wed,  6 Mar 2024 10:07:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFdt27Y6gA6FiNb9KzFHpRBS7lAG85ucoyPm0awXoQkMlmhYJ/S7+mn4itrK8tu9I4zUQ/tr0Dvd2oBKQhT4qJGqYjH86ExUAyNyp78Cl5lMeQ8J0/t8UR2EREuCTE49ycYtvbxIHfkX0T8uZoKgnSR/ZD1gphoai9MWZ84HxwOsCpiLb8hQKfzlPlytAGTtFmII03MT9gCXbW0FbZz8YZSct/2VOxKSttDvsVS3eKjy34SgG5WsWHVTQSmYDS68pLlzH+Pz47rMJtped8MDq0XUSdwQvZfLkw6GvdCQCrwXZBA/0uLDMoZNxvJ9V8Rx97mBnPDprtj5ZEJLE0BJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Lk2y7Znh2V8Gms7Ypw9dvJLzeUSTcpM3hZ3TKYvzc4=;
 b=f9GIDdJxCTL3VWRVj6uPX8+srpyjhbEkGfcgrNU/+ajiW1OTQ8sxxobkfiUgqyB2TmKiJazBA6n0BsRy0tzBJXkVPXQDM4u+NClboUw1CryjbToy/Bc/4eX8hR3iuhDyrkOevPG1+1blBvN2nP0NeE1rx9mwbVpAqxPfRdOw6K3yK69l63MoYlqHtnPTVls6iUSB2QYRS2gjvGZ4rSySCelzS1rZLoamqkQjI/V0njbqX+EVEurFgS0x/OF3iU24IhWRj/bvelF/JE3zHj40agoJvsKfgm355E74bW2QXH1xVqfczQ6x7O+MvAydz3292wYNVypSX1e4dq+g3+IXrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Lk2y7Znh2V8Gms7Ypw9dvJLzeUSTcpM3hZ3TKYvzc4=;
 b=WchucNV2z0qWS2CmWqFtYzqr7ps1S7wKtdRp0WNYLbZT4o23LpiM0PdCmhyn2rKqtNF90+qQBlnTTahMMLv4G2nlqE7LfEb61vKac1CdZyVSTaRGe1d9Yox6ijIwW3CcVYhoFVCME7lEFz+ALJVFO4FHlfi7mvuFF+teMKHfSa8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7703.namprd12.prod.outlook.com (2603:10b6:8:130::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 10:07:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7339.031; Wed, 6 Mar 2024
 10:07:07 +0000
Message-ID: <2f792620-fd8a-412e-9130-e276ba36d5a0@amd.com>
Date: Wed, 6 Mar 2024 11:07:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: cache in more vm fault information
Content-Language: en-US
To: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Pan@rtg-sunil-navi33.amd.com,
 Xinhui <Xinhui.Pan@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mukul Joshi <mukul.joshi@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20240306090408.3453152-1-sunil.khatri@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240306090408.3453152-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0168.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: d02b8f32-3a6d-47e7-cb41-08dc3dc52e63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AJUC0MqJOBTAIy6ARPoAP/W16Z4DVE5qvkjMjFLZ2SMK8YlmkY5VBShXjrnl6QoV+GO9AF2FttOu/TriOVUNTUXhfC8AHXU8axSGxVNcLpIdFyqC+aR+Vl+GnXoGOtWFVNTm70WOUiZuASyZDbFoBTLVfhG0oouAaWTAqM1oihkibQfw5071S0dBXPnUZmmq3+AAjNIXa2GSoS0vIJcpZEoglOMlDEUGbM7iAVEz21NS482lNaV5lTi3LUpHcMO8xvJFAkm8HBOthvyp2JI5XjHSeNhFImKt1oF8wyDywHjmT/vw3WXtnEXccBYR520aiINR8raLa5db09BWAoqNizGEwhZgGzFOlLdNIwyG96P25PD8xc35Yg9tGdJkUlfZNvPdg6nkE+fMvqt3UNzaTsNn72dGjS1iiD7/Jt4halF4swt9xxp/iCoqqohAR6U17IEXyBtVfKRUbCLgdcJclyMuZJUIYaPn7IHDTA/gFyb9wXTxYKpp1auvR0XYpE9BHRmgSWxndEoSBQsPZ3XwmqA0N9hwYAPGqYBQxMcH4RrZR9SstVgnRMPSL/xCufgVAvehMKdlT521gTTB0Juh/ECQtHom6CX8q7el6dfWSBMJDUlCA9IiMq6Lt0TFS8xu1BY26LHBE6j3nUioOG18rfLDnhjqiS2y7SKrPV/YqHQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE10SCtsVktDUk9iZ04yVjg1WFNDSkFNNVhIYnJqVEViWmdlSUVYbnVtZEJM?=
 =?utf-8?B?S2VoRUIya3lWUmZjRVRSUWNxeDVvNWExT3BrUzZ0Vk1WZTJjckZtSkhIZlVl?=
 =?utf-8?B?Wi8xUEJwbEpJM2REdlR3TFhFYktJN0NiUlU2RmlvWFR4MmVoSndodmFMNWsx?=
 =?utf-8?B?NUtjZk1wV3B0ekRRSWN5UXBrWUdvRmdJU2lUdWUramo4UHFrVTJXSFZJbm95?=
 =?utf-8?B?a0NyVlZyNXhSMVdhcU1GVlhueEJDZldFSTA3Z2U1eG93N21HWE84ZkRva0dr?=
 =?utf-8?B?R2FIZngxWjBGMjhhRHV3ZmhTYW04UWFKVGtndnhrM1I0NmJxRWFkTEk4WEFk?=
 =?utf-8?B?V0xDa1RFWXZDbmdWaVppQnB3Q0Z5WFpMTi9jOStvakZYRWl4M1VkV3pIdUx3?=
 =?utf-8?B?SjlFc0dmT2FNVGtWS0lPRERHVmtpRnp4NlBDWmducmNHZ1FWMnVmZllndWNj?=
 =?utf-8?B?bTNSM1pETG1WeU96U1pxb2sxM3NIUFYxRFVKTTFIS0JYWDQ4ZE9pREpieWp1?=
 =?utf-8?B?L2F5Y3lZcUVNYWF2czByWE5waks5bXcyMUd1N2pyMEo5QXUzRFJZRFN2ZmNP?=
 =?utf-8?B?RTBDUjBWQ1hWTzNZbXlOTTIxeE9GWnRGODA0TjVTN2xoMW1ZWCsrcHFhQWx5?=
 =?utf-8?B?WEVpRHluQ1lVVHFkWmtnb1c5ZVZsdVM0bFNXaU1FbWM2NlZqUzRvaWYzTVZS?=
 =?utf-8?B?aVhnV21LNXQweUJZT2NFQkhlZEh6TnNjdUd2SDJEajF4eEIvRGhwQmJGSEJx?=
 =?utf-8?B?UVdndFZNRTh6WDVBenhYdm4yYW5Zd1MyVzdWN0VoSnRJS1hlOW4vek1yaVNR?=
 =?utf-8?B?Q0ZodFFmR1ptMDFBR3Btc28yZkNhTW00QU8rZldFQTkvSmNBdTBNRFdUbm9w?=
 =?utf-8?B?NHNySkF3czNCNEVENzRwaGF2aURnRkFkbDJOcTVNaVFBRjF2Umc3TktyOUdp?=
 =?utf-8?B?eG14cXR1R0tGa0hnUmo1cmNjMncvK1hkcnU4SGNuVzhxMk1pNStMYXF4Q3ho?=
 =?utf-8?B?WTgwQ3dtUWFJSk0wemxRMWQvT2oyYy8wLzlhN0xXN3dkSXVVT3lJZnJHc2N3?=
 =?utf-8?B?TWhLTkFvaWxyQUJpdlBzNjF0ZlhBRDgyVXFicmY3VnB2eVI3a3V6YVVrTS93?=
 =?utf-8?B?Qk9vT3lpcmpVeVE4YmkxcnBVR3BZZzg4SndSTGQ2WlNsS3F0dko0dmxkSy9x?=
 =?utf-8?B?N1pMeFFNSkZ2NkVLRHcyV3JKR2VRYUtOL1E4bC9GNEV6SnBRc3F4MjlpbzFS?=
 =?utf-8?B?Q3JsVGdLa09KYkV2Y3VHejdhVk1kaEdTU3JqY2l0MVk2bmthaU9udkZPeDRO?=
 =?utf-8?B?aGxhaVRVVFQ1OE9nSGhpUkFnejF1ZEp5emFGdG9DNmd0U045WWpYZzN6bFRh?=
 =?utf-8?B?NytQNFRmMmxZYUErUGJtRWl2OG81UXcrQzJ0djNnWlhKdXZQbGRKaW4rcWg2?=
 =?utf-8?B?ZEFtcDVxM2grZE5CUEZud1A4K2xWQmNaQ25aQzJaNURhYmdjWlBkaVVKdkdW?=
 =?utf-8?B?N1NOZGxBeGQySXZOQW0rc1BJY3VXc2orVFlwcXB1aEdoYkFzYXN2SjMyYzIr?=
 =?utf-8?B?Y2dVVnBWU0I2UEtldTVsb1JzYjNkbG9qV1NJVWpuVzd0S3Zrd1pYSlV4Ui9E?=
 =?utf-8?B?cEVHWVdZcHNSaXhYSkt0dDZEenAxNFhhOWF2LzcwSzZRd2NNZkZOSGFyU1g4?=
 =?utf-8?B?WkNhZGd2K00xOVdRMEFWa3hVUGg3S09xTVFRWTlMTFl1dFBqQkw5QnBIWU1C?=
 =?utf-8?B?R2xYZ293aFJMeVlXZ0N0SzdKZzlFeEdxVkFHb09wa1VXMXdCY0g0ckdSK2RJ?=
 =?utf-8?B?UXZTQjBRNDlKUzVtYktOL1c2clcwU2JIb3ZEck9sTlNZRkRFVHd3OXJra29l?=
 =?utf-8?B?OURZYkpQRkxXZzNQK1VaZXhEQm9vOG1Keld3NzBBcGZCcGM5bVJMQTRiZ3N1?=
 =?utf-8?B?RHF3c3ZValovUGY3N093dTVYdjUzL3dQYXFvK3MveEp1TmdOOHNTWTBwZHEw?=
 =?utf-8?B?b0xqdUlBY0c2MXV6WHBCZHlFWDhiMG1lcDhJZWdGSSs5Y0FsSG1oZ0V4d2dj?=
 =?utf-8?B?bjMybUhrRmJHY3hTdjkvbHJYWk1zYVpTeWxmcjJBOFNHeUU5VUNDR3g5TmtF?=
 =?utf-8?Q?MLG1Gv2RJbofvo7PyNhYTDUat?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02b8f32-3a6d-47e7-cb41-08dc3dc52e63
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 10:07:07.7007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: evwF2aWTvHHCcXnZ55VBsPF8koW4fS3fc/KrrLLqsUxbiqRvw6blT7W/fXX2MhqP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7703
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

Am 06.03.24 um 10:04 schrieb Sunil Khatri:
> When an  page fault interrupt is raised there
> is a lot more information that is useful for
> developers to analyse the pagefault.

Well actually those information are not that interesting  because they 
are hw generation specific.

You should probably rather use the decoded strings here, e.g. hub, 
client, xcc_id, node_id etc...

See gmc_v9_0_process_interrupt() an example.

Regards,
Christian.

>
> Add all such information in the last cached
> pagefault from an interrupt handler.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 7 ++++++-
>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c  | 2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c  | 2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
>   7 files changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 4299ce386322..b77e8e28769d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2905,7 +2905,7 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct seq_file *m)
>    * Cache the fault info for later use by userspace in debugging.
>    */
>   void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
> -				  unsigned int pasid,
> +				  struct amdgpu_iv_entry *entry,
>   				  uint64_t addr,
>   				  uint32_t status,
>   				  unsigned int vmhub)
> @@ -2915,7 +2915,7 @@ void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
>   
>   	xa_lock_irqsave(&adev->vm_manager.pasids, flags);
>   
> -	vm = xa_load(&adev->vm_manager.pasids, pasid);
> +	vm = xa_load(&adev->vm_manager.pasids, entry->pasid);
>   	/* Don't update the fault cache if status is 0.  In the multiple
>   	 * fault case, subsequent faults will return a 0 status which is
>   	 * useless for userspace and replaces the useful fault status, so
> @@ -2924,6 +2924,11 @@ void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
>   	if (vm && status) {
>   		vm->fault_info.addr = addr;
>   		vm->fault_info.status = status;
> +		vm->fault_info.client_id = entry->client_id;
> +		vm->fault_info.src_id = entry->src_id;
> +		vm->fault_info.vmid = entry->vmid;
> +		vm->fault_info.pasid = entry->pasid;
> +		vm->fault_info.ring_id = entry->ring_id;
>   		if (AMDGPU_IS_GFXHUB(vmhub)) {
>   			vm->fault_info.vmhub = AMDGPU_VMHUB_TYPE_GFX;
>   			vm->fault_info.vmhub |=
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 047ec1930d12..c7782a89bdb5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -286,6 +286,11 @@ struct amdgpu_vm_fault_info {
>   	uint32_t	status;
>   	/* which vmhub? gfxhub, mmhub, etc. */
>   	unsigned int	vmhub;
> +	unsigned int	client_id;
> +	unsigned int	src_id;
> +	unsigned int	ring_id;
> +	unsigned int	pasid;
> +	unsigned int	vmid;
>   };
>   
>   struct amdgpu_vm {
> @@ -605,7 +610,7 @@ static inline void amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
>   }
>   
>   void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
> -				  unsigned int pasid,
> +				  struct amdgpu_iv_entry *entry,
>   				  uint64_t addr,
>   				  uint32_t status,
>   				  unsigned int vmhub);
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> index d933e19e0cf5..6b177ce8db0e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> @@ -150,7 +150,7 @@ static int gmc_v10_0_process_interrupt(struct amdgpu_device *adev,
>   		status = RREG32(hub->vm_l2_pro_fault_status);
>   		WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>   
> -		amdgpu_vm_update_fault_cache(adev, entry->pasid, addr, status,
> +		amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>   					     entry->vmid_src ? AMDGPU_MMHUB0(0) : AMDGPU_GFXHUB(0));
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> index 527dc917e049..bcf254856a3e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> @@ -121,7 +121,7 @@ static int gmc_v11_0_process_interrupt(struct amdgpu_device *adev,
>   		status = RREG32(hub->vm_l2_pro_fault_status);
>   		WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>   
> -		amdgpu_vm_update_fault_cache(adev, entry->pasid, addr, status,
> +		amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>   					     entry->vmid_src ? AMDGPU_MMHUB0(0) : AMDGPU_GFXHUB(0));
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> index 3da7b6a2b00d..e9517ebbe1fd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> @@ -1270,7 +1270,7 @@ static int gmc_v7_0_process_interrupt(struct amdgpu_device *adev,
>   	if (!addr && !status)
>   		return 0;
>   
> -	amdgpu_vm_update_fault_cache(adev, entry->pasid,
> +	amdgpu_vm_update_fault_cache(adev, entry,
>   				     ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT, status, AMDGPU_GFXHUB(0));
>   
>   	if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> index d20e5f20ee31..a271bf832312 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> @@ -1438,7 +1438,7 @@ static int gmc_v8_0_process_interrupt(struct amdgpu_device *adev,
>   	if (!addr && !status)
>   		return 0;
>   
> -	amdgpu_vm_update_fault_cache(adev, entry->pasid,
> +	amdgpu_vm_update_fault_cache(adev, entry,
>   				     ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT, status, AMDGPU_GFXHUB(0));
>   
>   	if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index 47b63a4ce68b..dc9fb1fb9540 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -666,7 +666,7 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_device *adev,
>   	rw = REG_GET_FIELD(status, VM_L2_PROTECTION_FAULT_STATUS, RW);
>   	WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>   
> -	amdgpu_vm_update_fault_cache(adev, entry->pasid, addr, status, vmhub);
> +	amdgpu_vm_update_fault_cache(adev, entry, addr, status, vmhub);
>   
>   	dev_err(adev->dev,
>   		"VM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",

