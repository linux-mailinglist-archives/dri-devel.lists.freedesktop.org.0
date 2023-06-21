Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55178738D78
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 19:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFE510E341;
	Wed, 21 Jun 2023 17:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1597A10E340;
 Wed, 21 Jun 2023 17:43:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kP+o7w9s79fnNTD0LIJpRWmz43hjD3bNDts3Xm1LIwZlMiAABKkcYGSmAM6qZKs7ImD9OWLGZHn0Sf/uYTFlRCm3Iwk6j1aUsTs+nWeCZI9lPMfEOxlWtDQmizxnHM/k/w+cCqyy7qVu56FdNylyhN2HSeCvmRlVQAyU/dQt/b9f8KHawEk1b+EXhBTD11YOWEfP0CD/w55BX7fEvigZkCaGCNh6XGfMuw+z8EixAjQq7Y76zP4x7cWMkwWaXrwfJljpEVMsgdY9K1zKdRt2qNBVoGG/xo/avFv16U3lzxDPv8PlXpmcBuiWX+6PZHJ//E+3YRlF2sPCVoHeXW6ZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dc2ebv2Vb/X+1w8aKHaRw+5fJDZHEiOJTm98vzwSETs=;
 b=lR98C/x6GENS9d+ixSv9NzmFlwQT58ROwjTo3W+i46Fcgp5K0HJ99YuKLuevTHp4Ef+KBSHtrNl90mZMuMETEZ6B1V2Bl9nDdI5zgmagkgLVJCuB6vgaYApnFvgu1c+/BaKarw8H5amJmK7ouoZ+2UndAH2yEbQf8TZFwaBKpdSelSF4fmyzITW8zBRUSC9WVIWP2yo8CfMcr0t5Kfh2sNbmtAescBdZY5IFm/DerdVUDM9rzKJfCJdEQc0MPPdFLfSqIjUYjm3V2OwEMGiKyLUfmDDx3W1irRDAPFV2b0d0Y6OODQ1qAeWllaIg9QUrAi8DOKd7rZFYuDSVPFNcJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dc2ebv2Vb/X+1w8aKHaRw+5fJDZHEiOJTm98vzwSETs=;
 b=lMskbPOsnp9XYXpPZWNJzbmfi09kcCpt+J7p1cy3cL0KBqd9ITf4PMp/IWp9CoXVNAtDBv0toadOl8WflNxX+PmaDJmkbyYSVRVZcUFasMX0S8Jz9HXSo79wccwVppbxqgs21Mykgx6V3mK3XXxuZe52ip6c7VD5vAUUAC4WDbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 17:43:53 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.020; Wed, 21 Jun 2023
 17:43:53 +0000
Message-ID: <a80c215a-c1d9-4c76-d4a8-9b5fd320a2b1@amd.com>
Date: Wed, 21 Jun 2023 12:43:48 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
 <3a7c8ffa-de43-4795-ae76-5cd9b00c52b5@lunn.ch>
 <216f3c5aa1299100a0009ddf4e95b019855a32be.camel@sipsolutions.net>
 <b1abec47-04df-4481-d680-43c5ff3cbb48@amd.com>
 <36902dda-9e51-41b3-b5fc-c641edf6f1fb@lunn.ch>
 <33d80292-e639-91d0-4d0f-3ed973f89e14@amd.com>
 <9159c3a5-390f-4403-854d-9b5e87b58d8c@lunn.ch>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <9159c3a5-390f-4403-854d-9b5e87b58d8c@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::26) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL1PR12MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: 688a88bf-48f9-4bad-06e8-08db727f1432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oMTSCJK3X8Y0NuhA2z9+ls6DLTaI6sxOTVB/OnYk++ebyCkaXwLlv/9Hdv/SalOWVP2rPzgkKVY6r1dFTeK40B03ufYJ6ULaWBz0uUVdJ94sASlwZnKOBxWj2wcOvU+Mbj1k0B0jvpYsm0D8C6Z+9k8l6YbdisgeBSQNupwE+ZGNhBwQ7im65+Hx+Lfp+7wPvmLb5kUZtvg/OgSffZ88QUbNjYqkkYVrpFLT6Zltue7wpryaucgtWEzGI3VljeNZh1n0Mkp722oTR2DnovT9e+HvPjXrvXbxR5alLrFQsXXSTxyQruyxlw/3iu/t3chf9PxcYGrSOHMUwYBHfdLLKpVWiG8F9/JggPqHOPn8zDiUB+Bp+rUDxDgAeMKCKPTJBHxb67LqMswEmzbBOuwgRmuNCYB0ge8ji8Bc0Rdv0q4hOlKOiGxWjydf679zNbONBXG0mkeWbHkJEKtlFdoEuFlmH2DPGq9EPiiBeoFTmm6Cnkhpq5943f6EdUWkgsDQKCEMYaanhTCR+wnfBA4Sb6rSeSUvGMBfYl6ZZJuS6r0ei6k4K8xJBCmIunEARo22pwLNqHp9/UT1Iejr3GKL6KpEtNPsPPN+DimnAIMuBLztQH/AMkyKUxyws0fKipa4LJDtb/IctbKDhBapzmU+sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199021)(54906003)(6666004)(478600001)(4326008)(26005)(186003)(53546011)(6506007)(6486002)(6512007)(2906002)(41300700001)(7416002)(8936002)(66946007)(6916009)(66556008)(66476007)(8676002)(5660300002)(316002)(2616005)(86362001)(31696002)(36756003)(83380400001)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTVHRFV5K1h1d0lBK1FiRVdrYXVtTmhWWFFsdUVIZW5PdG02bkZrQ1lES1Zn?=
 =?utf-8?B?NWFKY3BJT3V2ZDZjTENvSko4WENtVG9BVnduM3g0Sm1vUnRSRUdSTVBUMlI2?=
 =?utf-8?B?eU5xc1U0YWIwNVd3dlpZcVg1eXpKVHdKY3hjK0NLb0twOFJtTWF4NVZpTHdX?=
 =?utf-8?B?WnpqSVRJb0Y1VDJncGVTZCtJenlZY1ZDSFZhY3V2bWNwNHdianA2NHQ1NmFH?=
 =?utf-8?B?QmpTRjkvZFdrdFZCSmRUakQvZ1ZRWGpIR0pJMWZMSllqc2JUMEREMnNoamJu?=
 =?utf-8?B?cFdvOE1UUk1JWVBMekxyZXA2eEdLeGR3MisybmFYMGowQzlsMXBRbWFjbUJY?=
 =?utf-8?B?ak84NFZvY3VtRTNlL2ZRMCtvVzc4UTFvdTI1LzJMdkJHbkNjekRrYlJzc0tT?=
 =?utf-8?B?V0w1TFd2N3FlT3NrblRpWWdRYmF2NWM2b3JROC9CdmwydGZ2aldPelRaRmVw?=
 =?utf-8?B?eU5PRTJtK3RjQ1FjeldPUmJVUEJqWHYrd0t4R1R4Q1BLSkdJZFRWK20vN2Y5?=
 =?utf-8?B?OU9TTE5JRTlYSloxS3VuYjJxeUV6bWJOWmthRFZmSGcrT290ZnJiQ3AvUUlI?=
 =?utf-8?B?eXRGN1ZPYnlQMzRBVmFLZHAxcyt4K012QjY1eXMrdC9UK2U1STdyLzJQTDcy?=
 =?utf-8?B?bldsWHVYcWd3Sy9IN1VCSk1GM0I2UUhsR3BTOG85VjRxdGJYM2d6ellWWXdU?=
 =?utf-8?B?K0hoRnJ3MVpYWmZKS2N5YWZiMGZKTXFLTXRQaG1OeDhKSnNHcXNrZm9qV0lG?=
 =?utf-8?B?UkU4dC9oMWVBMWQ5OVBnejFmVitXdFBCKzMzZFEyYVZkNWh0ZXhXNGFaL3lS?=
 =?utf-8?B?RklnK2JlbVdHdEtZMk15UC9NK29rY29IcHg3V3A2S0g1ZGUxUXMzRzBIL3lu?=
 =?utf-8?B?MHV3amdpSUkrU3FHQmFDVW9vOHF6eGNxb2JzM3V6SW53Vm50bWZvcFRyYlh3?=
 =?utf-8?B?RlFPeUxPbC9TUk1WRTlJZkJjQ3l1UGcrNFBhTFBaUkNBV2h3MU92cUhCMUNK?=
 =?utf-8?B?TW5sbHR1aGRjSXJjL01LYWhvR1dpUE5LUDVWamVzY1JZMzZ5blhJTG5aU2lp?=
 =?utf-8?B?RFNaR29JMjArZytwV0lxOWJ2cW01bjVrYlY4WWVaaHY4dlJvQW5RdzF1SG45?=
 =?utf-8?B?YkxHVDRoNk04NFJSRUtac0RIcElQT1Z2TktaWlRScGp1blByQXBjNUZlb2M4?=
 =?utf-8?B?Qkt4eTk3RTE1dXlUdGoyaytydEtxcW1KNytUeENPQlhKVUN6S2pNUFc2YUFP?=
 =?utf-8?B?dG1zbHBHNTg1NnRobjVpOXl6cDR5U0xUdmN2R3htd2Eva3luUHJFMThuQ3Z2?=
 =?utf-8?B?QW1zUTNoYTFIQmtFOVlmZ3dTRUJPS0k1TUZON0FoVjNvNnVJMGtsSzd6RExS?=
 =?utf-8?B?ZjU0dC80TDNheURxU1loMGZUemR0bVlFZVg1SFR5SmtWaHR6aUpmZkE3WTdw?=
 =?utf-8?B?NVRlQ2Y5WEdjN2w2a214b0t0YVpSNk04ZU9YcnZCaUlTNTM4OW5lSG9pbGFh?=
 =?utf-8?B?V0lzekk3RTdnRnVhWmpYNWJQSmFodzh1V2oyOW1qY1Rsclh2RncxVmI4bTdW?=
 =?utf-8?B?ZTB3RjBBSG1YRjEwalFPVlNqRzdUQXl3SjZGL1d3L3l6V0pUY2RMSDE2MVBp?=
 =?utf-8?B?THpvK2VJNlovSldhcGw3YkloTWRnWjlGNkJFNFFrNmFSSW9KK1BodXRYTmlS?=
 =?utf-8?B?VE5jZTgyUkQ0K1J5ZHR4T0oyYVNkNW40aDdTcmIrYnI3RnM1cHBpMlhFcWxj?=
 =?utf-8?B?b1VOOEpGQ0VvRkcvdVJmUUNVbXpTYUowaG1rbXp2Ukkxd2ErVGovTk9GcTIv?=
 =?utf-8?B?SEt4MGZBZ0FPRk9nOUtHUjN4eVNpdXh6dW9zSXorVkUxckRrWnJpNnUxdXIz?=
 =?utf-8?B?eS8zcUF4S1g2QVFJcVNkQWhzLzBLUHhKVktUQjZNM3BLS1EwZis2am1PY2o2?=
 =?utf-8?B?TVZJUTljU0dqNGt5Smt6VU5YelIydWtxb29MMGlaanFDWlg3Nzh4dVFEMkVF?=
 =?utf-8?B?VHQzK01sQ1pRNnc5UlpMRGJUeVpJeW5FQXZOdWNxWk9raVloaEo2cGQ5djRW?=
 =?utf-8?B?Y2t0eUpmc3h2Zzk5eHB5M0NITTByVDNpR0RmOFg5VFJ5OWRxbWorcUpWRk93?=
 =?utf-8?Q?5IwETTuwGcygnovam3MpX9aPg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 688a88bf-48f9-4bad-06e8-08db727f1432
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 17:43:52.9839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yIeV8f5e05QJv3DoPHJ/eS3vJwZi2HP+TsRiF2J7p17DhnrszqIUsIoBRwH1UCYtewPdbo0he72P7wMGFjiNXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5804
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
Cc: jingyuwang_vip@163.com, bellosilicio@gmail.com, rafael@kernel.org,
 trix@redhat.com, lijo.lazar@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mdaenzer@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com, arnd@arndb.de,
 hdegoede@redhat.com, Evan Quan <evan.quan@amd.com>, netdev@vger.kernel.org,
 Xinhui.Pan@amd.com, linux-wireless@vger.kernel.org, edumazet@google.com,
 christian.koenig@amd.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 Johannes Berg <johannes@sipsolutions.net>, davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/21/2023 12:26 PM, Andrew Lunn wrote:
>> I think what you're asking for is another layer of indirection
>> like CONFIG_WBRF in addition to CONFIG_ACPI_WBRF.
>>
>> Producers would call functions like wbrf_supported_producer()
>> where the source file is not guarded behind CONFIG_ACPI_WBRF,
>> but instead by CONFIG_WBRF and locally use CONFIG_ACPI_WBRF within
>> it.  So a producer could look like this:
>>
>> bool wbrf_supported_producer(struct device *dev)
>> {
>> #ifdef CONFIG_ACPI_WBRF
>>      struct acpi_device *adev = ACPI_COMPANION(dev);
>>
>>      if (adev)
>>          return check_acpi_wbrf(adev->handle,
>>                         WBRF_REVISION,
>>                         1ULL << WBRF_RECORD);
>> #endif
>>      return -ENODEV;
>>
>> }
>> EXPORT_SYMBOL_GPL(wbrf_supported_producer);
>>
>> And then adding/removing could look something like this
>>
>> int wbrf_add_exclusion(struct device *dev,
>>                 struct wbrf_ranges_in *in)
>> {
>> #ifdef CONFIG_ACPI_WBRF
>>      struct acpi_device *adev = ACPI_COMPANION(dev);
>>
>>      if (adev)
>>          return wbrf_record(adev, WBRF_RECORD_ADD, in);
>> #endif
>>      return -ENODEV;
>> }
>> EXPORT_SYMBOL_GPL(wbrf_add_exclusion);
>>
>> int wbrf_remove_exclusion(struct device *dev,
>>                 struct wbrf_ranges_in *in)
>> {
>> #ifdef CONFIG_ACPI_WBRF
>>      struct acpi_device *adev = ACPI_COMPANION(dev);
>>
>>      if (adev)
>>          return wbrf_record(adev, WBRF_RECORD_REMOVE, in);
>> #endif
>>      return -ENODEV;
>> }
>> EXPORT_SYMBOL_GPL(wbrf_remove_exclusion);
> Yes, this looks a lot better.
>
> But what about notifications?
Once you implement this it gets a lot more complex and the driver 
consumers would need
to know more about the kernel's implementation.  For example consumers 
need a
notifier block like:

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index e3e2e6e3b485..146fe3c43343 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1066,6 +1066,8 @@ struct amdgpu_device {

         bool                            job_hang;
         bool                            dc_enabled;
+
+       struct notifier_block           wbrf_notifier;
  };

  static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)

And then would need matching notifier functions like:

static int amdgpu_wbrf_frequencies_notifier(struct notifier_block *nb,
                                     unsigned long action, void *_arg)

And we'd need to set up a chain to be used in this case in the WBRF code:

static BLOCKING_NOTIFIER_HEAD(wbrf_chain_head);

int wbrf_register_notifier(struct notifier_block *nb)
{
     return blocking_notifier_chain_register(&wbrf_chain_head, nb);
}
EXPORT_SYMBOL_GPL(wbrf_register_notifier);

int wbrf_unregister_notifier(struct notifier_block *nb)
{
     return blocking_notifier_chain_unregister(&wbrf_chain_head, nb);
}
EXPORT_SYMBOL_GPL(wbrf_unregister_notifier);

And consumer would need to call it, but only if CONFIG_WBRF_ACPI isn't set.

Add/remove functions can easily call something like:

blocking_notifier_call_chain(&wbrf_chain_head, action, data);

With all of this complexity and (effectively) dead code for ACPI vs non-ACPI
path I really have to ask why wouldn't a non-AMD implementation be able to
do this as ACPI?

I don't see why it couldn't be a DT/ACPI hybrid solution for ARM64.

