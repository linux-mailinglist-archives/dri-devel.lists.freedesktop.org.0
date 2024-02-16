Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 165E1857F99
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 15:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A584910E44C;
	Fri, 16 Feb 2024 14:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nmSvmVU6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A212110E44C;
 Fri, 16 Feb 2024 14:42:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=In8pS5QN+HVhgUGI7o/dGabvJDPE211PRSVyjxbu0fP+re8YMmXpQ3NUqAQWaDE0o4K9mWwWxGS+VNBcZEcre2rcbV3Lyj/zrzjvFIrmGWAN+kglaqv8f8ec08RmmyHxa67fWDYHROulgZXZA4A0woe+mIWwMuJrgbfjjAS+n0hNVIZBfCHavnUuJkZcpNIOrjnRj0ee/16/6D0f/UUYQMdIo0tXFBB2Dt3MHGvd9Q/KWiSxG3Crf/ZK8sN3taEmckB8MdyPkNVe2SIbDgiAQQsq2h1p7Us0/sDScQVGa4MC2GK/puMuKeBmRAeTuipMeSK4iM454dR4Dq5Sr6yclQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLGad7Tug4ZJ33zHWIK6q3JmhwrIcHkIm57MfnbRjyE=;
 b=frTmVKl/3a1rb+IhTN36yJi0zSA2Dfs/1U/hcXMiVqCum9NSl826g6Djx+ggqwqzfxhi9XUS+y4Q4CkUJOxFtCeSZsxOB4j+UOEsAbQjbPBzZacOe1rKcIbMuVKjZ32no4owMJQlnEVMNMFbPfJexFhYZs54T8njv0+Eb2XKUwIsMAKOiOnvtpWaWDy8NsRBaK8R3XuzZ//o7DOJwKFnszkDIfCcmHtGHUiOGo5pXc8/jxC84csl/K0nmum3jNkIFzLa12/Fz2SAuLF9deZ9MIg4Jckar0B6V1yLPNIf8IsXAQ0PSRTW1CyqFxdhj1rE507BnxHVfbpWX/8+RQdeOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLGad7Tug4ZJ33zHWIK6q3JmhwrIcHkIm57MfnbRjyE=;
 b=nmSvmVU60f+es94kGthb7OAffqk8nPNfx9Ca/YUXXwQ6fgdBXX9z3KxP2EAW3Z8Yn5id8fiJyC+BVDsLUYckvNMUbTIb+5xX/bS+Um8NtqB6CSxMNURDL1kwoVSkS+nARJ+ZyaNPWo5eV4JXq1eYY6n8GnyutokHQ8XfzOiu4hg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.14; Fri, 16 Feb
 2024 14:42:35 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 14:42:34 +0000
Message-ID: <6b9e6f24-8fa5-43c5-88a2-068dfcb9996e@amd.com>
Date: Fri, 16 Feb 2024 08:42:30 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Only allow one entity to control ABM
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Hamza Mahfooz <Hamza.Mahfooz@amd.com>,
 Harry Wentland <Harry.Wentland@amd.com>, Sun peng Li <Sunpeng.Li@amd.com>
References: <20240216140709.73708-1-mario.limonciello@amd.com>
 <8970de85-3117-4e28-82b4-3b35c5beb7cf@gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <8970de85-3117-4e28-82b4-3b35c5beb7cf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:806:130::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB5152:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a015dc-6ca5-429c-052a-08dc2efd836a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HMvZMTcw1ExfVK/OKseVP1M+SiHI8azWIaUekuV67ssG+OOq7WqAmXaeDbRbbEsTJ+RECuFkHE2kbsYmQWBc6Tk0LLPOhnV5lziebIBefiDa0/71Umcm6iDEjIR/tPZIBiwCtYtK/j9KkxwrWIPp13ud7xLt6R39ODG5cecMDHfGNLOZOKyWc0pLpXla9VXgg1hFxgawHHfpX/9xaxtpQmtEnp0TEWSE0EQQUv7FBX2C/9omTI6Oyol1N1mbm39N9MPSKdACLBxZ8As+9hxK9+nWuorgKxezuidO3xLvQG8geRQClcGCVIKMR+La5S9Z1MNZbexeE8A/dg4oDvlSyeSrTuGSt1KwWyARBkeWJxnFqVGHdrpsuaw4U24LL4StBbmrOJe6fWXjlHpGT/7zzzTs7sYSQoQ68C1nFEDq7WqsAJnTXoLypg02FxyNVWo//uLIPfhpFhgFImRHP0+ySVsDgef8PRsyW4kCkONviLWPE9MgxFOuQr3yD9LGlcplnJrtGQ8fNRkCyvnN3ytAsH82aiYBYdIBzNerH4aOQVn2aChr2bYSEfYAcOsSQlZL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(230922051799003)(230273577357003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(66946007)(44832011)(66556008)(31686004)(8936002)(8676002)(2906002)(66476007)(4326008)(36756003)(86362001)(31696002)(38100700002)(83380400001)(66574015)(26005)(2616005)(6512007)(6506007)(53546011)(6486002)(316002)(54906003)(41300700001)(478600001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUdEbzAzWVBnOWRNTW9mU2U3dllQL3BRK0JrMGJjRWxya1VHK2RlSGJSYmlQ?=
 =?utf-8?B?UFFjdk1TZzZhM2RYU1pwbUdhZFlsZmphNEtvN01XQWJVeFdmVHpPb2ZFK3Js?=
 =?utf-8?B?QklwSUNKd3ZCenV0bjN1bXVHQ05DaGtSVFY1YVEzTmFCd0liSzBZVFJiUHZt?=
 =?utf-8?B?eFVtYzhNQTJyVTZiQ0tHNldkRXRNUDZ0NHpvMGJCRytkWEtRUUxObEVSMXJV?=
 =?utf-8?B?SVh1dzErTHVMdkp2S1RtUVBXOTcvZS9KZnN5ME9TUFdaTXBaTTVyY3lEZnMv?=
 =?utf-8?B?emZCaWl2ejg4TldIK1Fnd0VRS21KUFhDRGg0MktPcXRiRGdCSXZXemZFUHBI?=
 =?utf-8?B?aUFRRzJsZXVjdUh5QSt0VGxRdFpxMFdwZWV2V1hpT2tsK3VZUGkxM3RNd0xU?=
 =?utf-8?B?SzFuTFk4QUtWQWtublVycmx1RVpOY0c3QW9xRGRtN3FHOFU3U3lNVzVUeE8x?=
 =?utf-8?B?bG9kM0Z3UE5UWll3OWlmWWZrKzRuNUx6bXZKemEzczRJeGZ1UXFCUE9QNlV6?=
 =?utf-8?B?Q2FzbkdaZFdaNWZHYWk1blhqOURJbjhPY3dla3BpTTZPczFlRWlHSzN1akdW?=
 =?utf-8?B?ZDFhamVJamRoZHlSUG0xNFQ1eXEweGNNMFFQM21FcXJzQWZES0UzUE9zU3V6?=
 =?utf-8?B?YmZmSSsvZC9JM05zQnRVWUpKS1l0Z0ZVMENHd0JQVktvdTFBMGN0dVloUHYy?=
 =?utf-8?B?d3k0SG1yN3pNakhJbnVkVjNxWjhTZFhwVVNNQm5oQ3lmRzdWbVAzQXM3ZFV5?=
 =?utf-8?B?VDdObmdMcjQxWnM0S1B4M0lRYTJQczZnWlVGbTNuMi8xdWhzdlk1NjhJZWhC?=
 =?utf-8?B?eC9yVERuOFUrdjc5ZUN2WWpWVkpLQXJhMDUvYkxONmZxVzZXM0UxamZGV2RN?=
 =?utf-8?B?ZTYyOVBEMHdVYVdaVW5nRGZWWVNNM0s4cnhWZjBOSVNXdWtpU3JSUW8ydnlj?=
 =?utf-8?B?MGVKVWI2QXlteTBaeTg4TVpURjh4Ym9NN1VBMkxIR1BnbU01clFvcHpoMi9w?=
 =?utf-8?B?eC9MR3BxVVBEOTJWcnZLNUlKZ2xYdG8rdEdBdm5Jc2dZL1NwV3NQNlVrTm05?=
 =?utf-8?B?eG51NWZ2VzZ5VThDenkzN2dMK2RUWUZwMW1jVDdwTFFaVXFTRUhYbm43SEVk?=
 =?utf-8?B?U2JSeVNWZkRSdzg3OUNqbHZWRjJXS0FmRTJLbko2NEptbFhxbmNJRC82ODVi?=
 =?utf-8?B?dzlrS0FlaDFYL0RVM2hxYy9Ma3hsMjVYNno3UjM2R2lRL3U3dFpsSzk1eTJV?=
 =?utf-8?B?NXNMY0s1N3crR016QURiWUZ4TVJCb2JQRDV6OSswdFJWQTVHc1p6Y1FhWHhV?=
 =?utf-8?B?YjJRNTkvcXA3UEdXeXhkbEpxZ1BYemUveGU0bU8zWkpHZjZIMUZkWi9CMjU3?=
 =?utf-8?B?MklMWFdSR1AzQndIeFBWNG9NZnQyTWxlOVZnam91N2tpVFpwSGdpbU1jUjdK?=
 =?utf-8?B?YVQxb0h6REE1WEYvNnA0azRvbFY0RkF4ZGFUR3kxYWdmSG40MUNQeG1wcldY?=
 =?utf-8?B?Z0hXOHNVdHUvdnducjhVVFNqVGlHMzJvMlljOVBLK3VLcXFtb1A2ZEpTWVo1?=
 =?utf-8?B?VzlSRWdsT1RvazNFUWR1a3htTDBKS1FoWU5tRUZSRmVDMU1Yd2NDNnN6cnVC?=
 =?utf-8?B?Z3M2NDJGeHd5UWRkeEwzWVIzOUFxYlplS1VSSjZOM3M5YjdtN2loUitncVRM?=
 =?utf-8?B?dFJHcGdha2tSNHBiUHIvTXpqNE1GcXZjUEZEb0prejJjaTBMTUgvZGc2L3dX?=
 =?utf-8?B?WTd2WW1GUTIyZWUyWCtFSHVUYnNXUVBTZjJIMWtBSklaamtSUWNqMXZYQkxQ?=
 =?utf-8?B?UDc2Z2pjR3JrUC9wczdUcEl2V3NOQXE2RUdrMUwxRmluV2FGS3hoeXhwTmg0?=
 =?utf-8?B?ZGVBOGNCNTRUa2xDNlhBM2xuajlFaHRDRHJITHIyQWNVaWI4OXVoT3gyRFh3?=
 =?utf-8?B?VWlaVEh2Zlp0OUR3NTd1MCtyM3ZlY3dEUXJJK2NvNjhSL0JMNFNkaldOUmlK?=
 =?utf-8?B?LzlaRGhwelNnSkFlQzExblNmWHc5WUdDWDd5YXdmaTcwSDJNVVV1YVNUOXMr?=
 =?utf-8?B?R1RuVEFDeVRkU2pkR1BvTzVFaFNXUXhuOFA4eHZ0dUc1LzJrWEZjNzgrUEtJ?=
 =?utf-8?Q?Kbpc3i2WBQiHRr9fMZr1EeOg1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a015dc-6ca5-429c-052a-08dc2efd836a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 14:42:34.7792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzwyM8lc2llr0y3i8VAa++CAJHl2pAee4svj1tLYLhfuWeDnfHcdCL77FBoIQpB2Dn6mhmAGsni01Alwcec6gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5152
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

On 2/16/2024 08:38, Christian König wrote:
> Am 16.02.24 um 15:07 schrieb Mario Limonciello:
>> By exporting ABM to sysfs it's possible that DRM master and software
>> controlling the sysfs file fight over the value programmed for ABM.
>>
>> Adjust the module parameter behavior to control who control ABM:
>> -2: DRM
>> -1: sysfs (IE via software like power-profiles-daemon)
> 
> Well that sounds extremely awkward. Why should a power-profiles-deamon 
> has control over the panel power saving features?
> 
> I mean we are talking about things like reducing backlight level when 
> the is inactivity, don't we?

We're talking about activating the ABM algorithm when the system is in 
power saving mode; not from inactivity.  This allows the user to squeeze 
out some extra power "just" in that situation.

But given the comments on the other patch, I tend to agree with Harry's 
proposal instead that we just drop the DRM property entirely as there 
are no consumers of it.

> 
> Regards,
> Christian.
> 
>> 0-4: User via command line
>>
>> Also introduce a Kconfig option that allows distributions to choose
>> the default policy that is appropriate for them.
>>
>> Fixes: f97e4303da16 ("drm/amd/display: add panel_power_savings sysfs 
>> entry to eDP connectors")
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>> Cc: Hamza Mahfooz <Hamza.Mahfooz@amd.com>
>> Cc: Harry Wentland <Harry.Wentland@amd.com>
>> Cc: Sun peng (Leo) Li <Sunpeng.Li@amd.com>
>>   drivers/gpu/drm/amd/amdgpu/Kconfig            | 72 +++++++++++++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 23 +++---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +-
>>   3 files changed, 90 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig 
>> b/drivers/gpu/drm/amd/amdgpu/Kconfig
>> index 22d88f8ef527..2ab57ccf6f21 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
>> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
>> @@ -80,6 +80,78 @@ config DRM_AMDGPU_WERROR
>>         Add -Werror to the build flags for amdgpu.ko.
>>         Only enable this if you are warning code for amdgpu.ko.
>> +choice
>> +    prompt "Amdgpu panel power Savings"
>> +    default AMDGPU_SYSFS_ABM
>> +    help
>> +        Control the default behavior for adaptive panel power savings.
>> +
>> +        Panel power savings features will sacrifice color accuracy
>> +        in exchange for power savings.
>> +
>> +        This can be configured for:
>> +        - dynamic control by the DRM master
>> +        - dynamic control by sysfs nodes
>> +        - statically by the user at kernel compile time
>> +
>> +        This value can also be overridden by the amdgpu.abmlevel
>> +        module parameter.
>> +
>> +config AMDGPU_DRM_ABM
>> +    bool "DRM Master control"
>> +    help
>> +        Export a property called 'abm_level' that can be
>> +        manipulated by the DRM master for supported hardware.
>> +
>> +config AMDGPU_SYSFS_ABM
>> +    bool "sysfs control"
>> +    help
>> +        Export a sysfs file 'panel_power_savings' that can be
>> +        manipulated by userspace for supported hardware.
>> +
>> +config AMDGPU_HARDCODE_ABM0
>> +    bool "No Panel power savings"
>> +    help
>> +        Disable panel power savings.
>> +        It can only overridden by the kernel command line.
>> +
>> +config AMDGPU_HARDCODE_ABM1
>> +    bool "25% Panel power savings"
>> +    help
>> +        Set the ABM panel power savings algorithm to 25%.
>> +        It can only overridden by the kernel command line.
>> +
>> +config AMDGPU_HARDCODE_ABM2
>> +    bool "50% Panel power savings"
>> +    help
>> +        Set the ABM panel power savings algorithm to 50%.
>> +        It can only overridden by the kernel command line.
>> +
>> +config AMDGPU_HARDCODE_ABM3
>> +    bool "75% Panel power savings"
>> +    help
>> +        Set the ABM panel power savings algorithm to 75%.
>> +        It can only overridden by the kernel command line.
>> +
>> +config AMDGPU_HARDCODE_ABM4
>> +    bool "100% Panel power savings"
>> +    help
>> +        Set the ABM panel power savings algorithm to 100%.
>> +        It can only overridden by the kernel command line.
>> +endchoice
>> +
>> +config AMDGPU_ABM_POLICY
>> +    int
>> +    default -2 if AMDGPU_DRM_ABM
>> +    default -1 if AMDGPU_SYSFS_ABM
>> +    default 0 if AMDGPU_HARDCODE_ABM0
>> +    default 1 if AMDGPU_HARDCODE_ABM1
>> +    default 2 if AMDGPU_HARDCODE_ABM2
>> +    default 3 if AMDGPU_HARDCODE_ABM3
>> +    default 4 if AMDGPU_HARDCODE_ABM4
>> +    default -1
>> +
>> +
>>   source "drivers/gpu/drm/amd/acp/Kconfig"
>>   source "drivers/gpu/drm/amd/display/Kconfig"
>>   source "drivers/gpu/drm/amd/amdkfd/Kconfig"
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index af7fae7907d7..00d6c8b58716 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -844,17 +844,24 @@ module_param_named(visualconfirm, 
>> amdgpu_dc_visual_confirm, uint, 0444);
>>    * DOC: abmlevel (uint)
>>    * Override the default ABM (Adaptive Backlight Management) level 
>> used for DC
>>    * enabled hardware. Requires DMCU to be supported and loaded.
>> - * Valid levels are 0-4. A value of 0 indicates that ABM should be 
>> disabled by
>> - * default. Values 1-4 control the maximum allowable brightness 
>> reduction via
>> - * the ABM algorithm, with 1 being the least reduction and 4 being 
>> the most
>> - * reduction.
>> + * Valid levels are -2 through 4.
>>    *
>> - * Defaults to -1, or disabled. Userspace can only override this 
>> level after
>> - * boot if it's set to auto.
>> + *  -2: indicates that ABM should be controlled by DRM property 
>> 'abm_level.
>> + *  -1: indicates that ABM should be controlled by the sysfs file
>> + *      'panel_power_savings'.
>> + *   0: indicates that ABM should be disabled.
>> + * 1-4: control the maximum allowable brightness reduction via
>> + *      the ABM algorithm, with 1 being the least reduction and 4 
>> being the most
>> + *      reduction.
>> + *
>> + * Both the DRM property 'abm_level' and the sysfs file 
>> 'panel_power_savings'
>> + * will only be available on supported hardware configurations.
>> + *
>> + * The default value is configured by kernel configuration option 
>> AMDGPU_ABM_POLICY
>>    */
>> -int amdgpu_dm_abm_level = -1;
>> +int amdgpu_dm_abm_level = CONFIG_AMDGPU_ABM_POLICY;
>>   MODULE_PARM_DESC(abmlevel,
>> -         "ABM level (0 = off, 1-4 = backlight reduction level, -1 
>> auto (default))");
>> +         "ABM level (0 = off, 1-4 = backlight reduction level, -1 = 
>> sysfs control, -2 = drm control");
>>   module_param_named(abmlevel, amdgpu_dm_abm_level, int, 0444);
>>   int amdgpu_backlight = -1;
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index b9ac3d2f8029..147fe744f82e 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -6515,7 +6515,7 @@ static void 
>> amdgpu_dm_connector_unregister(struct drm_connector *connector)
>>       struct amdgpu_dm_connector *amdgpu_dm_connector = 
>> to_amdgpu_dm_connector(connector);
>>       if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
>> -        amdgpu_dm_abm_level < 0)
>> +        amdgpu_dm_abm_level == -1)
>>           sysfs_remove_group(&connector->kdev->kobj, &amdgpu_group);
>>       drm_dp_aux_unregister(&amdgpu_dm_connector->dm_dp_aux.aux);
>> @@ -6623,7 +6623,7 @@ amdgpu_dm_connector_late_register(struct 
>> drm_connector *connector)
>>       int r;
>>       if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
>> -        amdgpu_dm_abm_level < 0) {
>> +        amdgpu_dm_abm_level == -1) {
>>           r = sysfs_create_group(&connector->kdev->kobj,
>>                          &amdgpu_group);
>>           if (r)
>> @@ -7654,7 +7654,7 @@ void amdgpu_dm_connector_init_helper(struct 
>> amdgpu_display_manager *dm,
>>       if (connector_type == DRM_MODE_CONNECTOR_eDP &&
>>           (dc_is_dmcu_initialized(adev->dm.dc) ||
>> -         adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level < 0) {
>> +         adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level == -2) {
>>           drm_object_attach_property(&aconnector->base.base,
>>                   adev->mode_info.abm_level_property, 0);
>>       }
> 

