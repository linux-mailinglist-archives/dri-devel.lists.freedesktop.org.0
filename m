Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271E9AFCD8F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 16:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8619510E661;
	Tue,  8 Jul 2025 14:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T1d7Ukld";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDD810E660;
 Tue,  8 Jul 2025 14:28:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxjHaygs8TWKEn5higuBDdnUAycHO6berTrV9ZIgC9DDPTfRNERuED8F/Rp5zZFStYfZ4rExdydls0ZvmTCu9z+PR0JZaKfeqXH+iT7Fw7d8Zn9IrI/DkJUoPUd6lqZUYSw9rj+nQI68tpyM4EynqpqaD82Z/xOq9WDDl1ki/PxAcsJnXgtaBR17KmeK1LdSnQU8yS9jTe2M1yNSONIH/kxMhV98RmC9hCZlO6+0NWZ+iCSqDinBS+K58bMzT9UiOtrL3/HBzuhmJb/TOUOh7VYtppU5WpKVliIZMiNi9ox/nKxKAfqqYdJtxtHiagNcWOq+61i/qAZgKWav0ZqUjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13Kss5/ZlqS2hOsyED47OwOTHIyLQlqHAxO1NNr/yVY=;
 b=Rg3J232y04DTAP1N2bJ0DqExZCf+rLcOXD5BUofP5tBOdqUspj+6AM/gb0Vd4JvBnkxQuEZPOsb8fVS3W7LdQH4TTwn6x9YVoO1AwLcMu1j1cMfmuNFfQGnUIT0NZZ9NwJ6hxJCHQPXSnh4HtgdYtjdnQ776LmaeCVl7Ybz00f1+rxjb7eXmbJ/zXLaZZTd4bYMLldgnoFK7uBRC35pNEdSLZYasuqU82pK4oCyaZbm256nuqET7XYqzs6cOTi12tSPt6YBbDTuHLmXyVrdLS4/XxfOoUxEbdJ1AuVBAhKyaEBIcYt6aZD55p+2M0XeBR+brZgbDnO1lXycRkM2/8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13Kss5/ZlqS2hOsyED47OwOTHIyLQlqHAxO1NNr/yVY=;
 b=T1d7UkldRylgbQ3KXS1XpeKBT/Rxrjd+sSBE6jVQUQReJoAIX7JeBqwACONXes3hXsIGHyq9JeY+y8X2u8HE2PZYBgd9cWPegnl+t8gggUgOOgGTl8bCDw8q08R+JtqpFzJNGeZ+ebT6/+OGcQmvbfBCJ95rSwLzEe60DGi1/Pc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB9737.namprd12.prod.outlook.com (2603:10b6:208:465::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Tue, 8 Jul
 2025 14:28:32 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 14:28:32 +0000
Message-ID: <bd30f96b-44d2-4127-a019-f02bc2689aa2@amd.com>
Date: Tue, 8 Jul 2025 10:28:21 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] PM: hibernate: shrink shmem pages after
 dev_pm_ops.prepare()
To: Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, rafael@kernel.org, len.brown@intel.com,
 pavel@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: lijo.lazar@amd.com, victor.zhao@amd.com, haijun.chang@amd.com,
 Qing.Ma@amd.com, Owen.Zhang2@amd.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250708074248.1674924-1-guoqing.zhang@amd.com>
 <20250708074248.1674924-4-guoqing.zhang@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250708074248.1674924-4-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0409.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB9737:EE_
X-MS-Office365-Filtering-Correlation-Id: fcff4c9b-e897-44f0-9798-08ddbe2bb6d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NW9BTzBqc3VmZ2hiTW9ZZXVyK1NadjJtL3FUMGFHTE1uRDlYRkxXQ29VR0VL?=
 =?utf-8?B?TVF5UmZ0SUMwUXV3bS9ZQ1htbklRdWRMQVlBSXRRUEk2clZONzRvRnhUeEZ5?=
 =?utf-8?B?ZWJkZDBWV2JaNEYzWG5UcGRlR0RSelNwRUZ6OWpNdzZ2YmpPT1RBMzN0eTQx?=
 =?utf-8?B?R0hhajNJdkRzd0ZZaUgwZ04yQUJWNVNuczVoaTRxMm5pa20wNFM3WWZ0Y3dZ?=
 =?utf-8?B?dzFId2pIcVFBUDU3cXBMSjlWZHNsRFhLSzhDOUdHT2p2WnFaeXBCWWNoeStJ?=
 =?utf-8?B?V2J4Zi9WeCtwNVc2b0srbUx4NFp5aDZqYldzWEJITmhQS2tZaUp3Y1NkYzhV?=
 =?utf-8?B?a0hRWFdBbmRkYTVSRWIvWW5LOUVra25OQ3JsT0Q3c0dnY2E2VmthTTVsZ0xH?=
 =?utf-8?B?RnBXMUU4aEVDREthbkE2OVBpUTRtYWJlNUtjWWdncDg5a0liYjFHUEYxZmlp?=
 =?utf-8?B?b2MzbjdldVlNVVU2RmI1Qk82ZTZMQkFaMENYbVNGMVFWeVR1emU5RFJybXJ1?=
 =?utf-8?B?Q2ZFRVlKKzNtYTdEUnhpaTVOUGpUeGhJQmFWTHJtMGdiME5tcVBSMUpEbXZ0?=
 =?utf-8?B?WlBNMmRoVHJGSmdvcDFaM3Q0dHZiam55SHFNS0hhcUo1bTZZeG1FSjlPTnV6?=
 =?utf-8?B?cG5MRm4rd0pwa1hua3IrVGRROVpKaW45b0VIdHI2WjVzRjArTkhjUTNkMHRS?=
 =?utf-8?B?Rlp2OUlneXhOUTZMa3Zpdm56dXk4VFVuaTNwTXBuQWw0cVg3bzFrWitJY2Fu?=
 =?utf-8?B?ejY5SVUxdlBCN0xWdWFxdXJUY0QvcFpvMjIzaUtKU2JheUtqazk2M2JQNkZY?=
 =?utf-8?B?MGZ4dS9Nang1a0h2N3VhVFNnelc3RUwrTFRzcytVYlZYekR5QlFuZzVhLysx?=
 =?utf-8?B?aHJXdkNZbVRzZVN4OThpemNuMUZzTmRKVHRQODlFNE12alJZdS9QMUNHVVd4?=
 =?utf-8?B?MjFkWmN4a1JJRU92bWZ0dC9Ic2FoNlNhZE9pZWxIbXRqbk00U1pERHNRWndw?=
 =?utf-8?B?ZnpvRjMrbFhEQ3FvM012MWNxVjJLQnd2clpLTlBvVkd3YzVWU3FjVXZreEJB?=
 =?utf-8?B?SkM5a0EyRlJ2akgxSW5mTVZRY0dRYWhjVFVtdm51YWZxb2dMOHlnakIrOU9L?=
 =?utf-8?B?KzdheGhTdk1VL2pmZHdpeHF4S09XbzFDTkNuOUk2WFRaeUZVQVhjaXhCdmda?=
 =?utf-8?B?ZkxPRm5MTkxOUnl3MWxwMUxOaURhaU5qOFF0NVFZcFBFUWs5SXFaemM1ZW4y?=
 =?utf-8?B?dE9tVmhkWDBVY0pIMldBY1YwNmJoZHVPb3pXR3lHcjdoL0NuQW1ScExzRTZW?=
 =?utf-8?B?QkpPME1ma0dtbTA2d00zdmZKSmExNXBXTzg0M1FPOVlCTnYvKzZoakduNEdv?=
 =?utf-8?B?U2dJY2Z3MkJmdURyeUVjSnNKRzVST0dPZDRCVndTWkg3aFh1ZGh1RGdUT2JZ?=
 =?utf-8?B?SW9jU2NWc25vdFpJWlBHQXBSZkZBNzExV0dQdkZ0K1lFMFc4NmUxb2VGYklQ?=
 =?utf-8?B?YW41Zitaa0NScGxtRGZ3ZUpBeHI3dlFlaUgxRDJjZUoxaHlYbytzU1lxY2I1?=
 =?utf-8?B?SWdzNkN1Q1BYYWZjWHhmQUFHU25mZk5BR2Q2RzBNeStXUldaTzJyTUJWZ016?=
 =?utf-8?B?VnVuanVtTU9IdFBNN1dTcitSc0YzU3o5STBhVTFoeTAwU3ZBSU5ma1JkREN0?=
 =?utf-8?B?YU1STHNUNUg2OVdWSnlRdFEyKzlGSmY5NzdFaVgveGlyYjF2cGo0djNhN3Jw?=
 =?utf-8?B?elBjejk5alh6SnpIUHlyU2RLVVcxQXRGMHJUY3cyYUpuZWNleG4yYWpCWWNq?=
 =?utf-8?B?UXczMGRINitPb1IwZzEyMmNsZFo2aGtvazhMK255aFZtZzlhL0VoUUtRU25Q?=
 =?utf-8?B?NS9yUlhvMUwxVTV4eEtxMFpFUnlCY213VEk2WXlFQW12eUtpaDEzalpQUzFr?=
 =?utf-8?B?NTIxN000ay8wa1VmOEdBeDgrUDBkdWg4NW1xdzAxemt2UWdlR2tFMEhtczF1?=
 =?utf-8?B?cENVUHM2Ny9nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2dvQVQ4eGZ6WS9MVml4RitSN2ljZ0NqRnh0UDdRdkIwNUt3ZEJEejV6d20y?=
 =?utf-8?B?Zkloa1cxb2wvbXFNZW9pK1lpT1VLNGluWWlmZmpldzZ6bmFZSldNR01SeENz?=
 =?utf-8?B?cUI5VkFxTGJFdmRUbFEvVUdLaUJFRlhPZTE0ZTZHZzF4QlI5SG1sVEdqWFho?=
 =?utf-8?B?R2pyVCtJUTVvbXh3NWViTnprbzlMZTVCSVRxbDFjMWkxSnpRUGtwdThFeW9u?=
 =?utf-8?B?SXJGd3AzemNrNGxiTEp5MnkvVWZLS2dRc05xblY5VFdGQXk1M0QvcXFLWXdF?=
 =?utf-8?B?UkxoZWpUazU4eG1zV3pzQXdhUGVzaXczTS9jTkVqdWNYTjhXOU9WdDgxUDh2?=
 =?utf-8?B?ZTF2SjVyUk5aZlBGTjhQd2s2b0dPU0F1Yk5CV21sdHhCOVdsbkk2M1duNGNk?=
 =?utf-8?B?cG43blpKUWdNVUREaXB4cG85TU1nTU5kTitra1NXSXcvcnQ3bG9RT2l6RjFi?=
 =?utf-8?B?cEZ6aEpuWXZQd1IxKzdIT0lUUmsxY1Z1TmRjVHBvb2JFcXo3N0NBTmY4VVZu?=
 =?utf-8?B?NitNVW8wL0FLd2dtOHRHRnlTZWVTQW1ZRVJENGVwLzVFaE1kYURxbGNYWmgy?=
 =?utf-8?B?bE5WQ2xxbDRiWC9RNWhYN2ZKMjNRNVpYdlJnWmFOdHphOStBVDZGVmhWM0xP?=
 =?utf-8?B?MGlXTkNjWnozRXFKWFZjZ1ZML2R2ZXp2R0g0UlJEZ2tTd3NMZVlBdTBoeDEw?=
 =?utf-8?B?UDJKWXVCc250Y1pZelJZMXpXdlI5dlZHZDhIVGljQXZybG5PdU9icjh0bm5t?=
 =?utf-8?B?STVLYm5vb3dGMFJlOFhGWFVVVm5FZkhMakJPN1pnZUMzVURsOWZiRFU3QXV2?=
 =?utf-8?B?enJnSnJCclh5WHZiOCt0Yjd1WlB6Q3BwMGNrYnpzTVFsdmhzOGY3T1NTcmp6?=
 =?utf-8?B?bTFjeVJwaXc2SHVSY2kxT0xDSkhucVVPWDBnbDhaNG9RZUhMd3BJQUlmUzEy?=
 =?utf-8?B?OXpNSFpTTEx3U2lrZyt5Qld0dkh1QlkxWjRtaXBGa2d6K2lFVkNxWnFaU1A5?=
 =?utf-8?B?dGo1RC93aGRmWUhIWWRHL0pSb0ZBdjFkdjVvbmEvR2kwdmNYc2lUbmtJOUNQ?=
 =?utf-8?B?T2NDcmNway9rRzJIYmZIT1N0RTdWZ0tXbHVVemtrM25BamFCQ0pBK3VtcnFu?=
 =?utf-8?B?bWpERmZhTVByUXQ4aFl5S1V6aWNwMFRxSkd6RjJNcXpBZVpDWG9XaWRGSm1p?=
 =?utf-8?B?MWZzNmdCUENUcEYvYTY4NE84cjc5V295NWdRVXpYcHlxeXYvRzRLL1h6V1JG?=
 =?utf-8?B?SFVhV0pCa0FtVy8zL0pDME9IQnQyYUxBQ0tRdDcybHpCd2VLa3BoMWlScWt1?=
 =?utf-8?B?K0RsL284Y1JDM0U4eDZ2UkJLMGpHbkhZQkhKd1J3UWF0QUlRejNaTnE4NHZV?=
 =?utf-8?B?TlU5TWxXRGNMOU00RXlTc01rNXkyakxJQU1WUGFmeTgrRy9OZVRVdy9VdThh?=
 =?utf-8?B?U0pkWUtpYkVtUSt3cUM2UmtMZHJQTFhscloyQkN0V1FIcCs0ZVUvT0JWY0RC?=
 =?utf-8?B?Vi9Fei9ISVNyVDNVU0tMQ3VuTUpsbEFGb2w0TmJTTXYrU1ZrbFMyY0tVVTUw?=
 =?utf-8?B?VG9yMU13VXFEUU9ySGRWK2xFWXgxdXVReDZkWmprL2RiQlBLOWhzdHdoWUdy?=
 =?utf-8?B?RVJjZFBoeWdmNTRudnBjT3lEa21OMGlNRUp1K002ZVhUR1VubnUwQmVZQzN5?=
 =?utf-8?B?eEFBUzBLTE5QOTQvSGVwdHZndUtYd2VReE15cHhtN1V4dXZiaGpBWFpvRFdE?=
 =?utf-8?B?RmtMd1BxUVBWQmkzQ0JRclJJQ2tDaVh1L1pGY3hFWkQyN3JxTk5VdHJid2xk?=
 =?utf-8?B?cjVjeER4UDBGM2NCQkJBUU9WZGtaZSsrUWc5SjBpbmpNN1VRTkZ2QzRaelM4?=
 =?utf-8?B?dno4N1NFOEwzTDExRmE2T1RpODNpMnYrY0RPcDRWUlAwdWtqOElvM0QyMmZ1?=
 =?utf-8?B?bGNBeXRjZHlQYjFENEd3d3NJV2JLSjBuMUFIV3hZQ2tic04rM0dVZEgzVVFz?=
 =?utf-8?B?UXg5SXhTejYwTEk2TUtuQmwxR1lpdWplU1lEZ2l1b0M0dStabmxaU3RjZUox?=
 =?utf-8?B?eHMvcXo3bEczU1lqNkIzTW43VTlIdzNrK3kzSk5uY2JSTlFTQ01iME5mazVk?=
 =?utf-8?Q?O444VK1F5TKIDxRgujP+VbZ+p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcff4c9b-e897-44f0-9798-08ddbe2bb6d6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 14:28:31.9353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CMbrE/JqpU5bDyn4xbehCLBbekvzN7Ww55kt4iPpiiqraSFFIZsU7T1CegpLPQ5PKSiqEFdyANk//wmr+8hxiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9737
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

On 7/8/2025 3:42 AM, Samuel Zhang wrote:
> When hibernate with data center dGPUs, huge number of VRAM data will be
> moved to shmem during dev_pm_ops.prepare(). These shmem pages take a lot
> of system memory so that there's no enough free memory for creating the
> hibernation image. This will cause hibernation fail and abort.
> 
> After dev_pm_ops.prepare(), call shrink_all_memory() to force move shmem
> pages to swap disk and reclaim the pages, so that there's enough system
> memory for hibernation image and less pages needed to copy to the image.
> 
> This patch can only flush and free about half shmem pages. It will be
> better to flush and free more pages, even all of shmem pages, so that
> there're less pages to be copied to the hibernation image and the overall
> hibernation time can be reduced.
> 
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>

AFAICT this didn't tangibly change and was just reordered in the series, 
I think you should carry Rafael's A-b tag forward.

> ---
>   kernel/power/hibernate.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
> index 10a01af63a80..7ae9d9a7aa1d 100644
> --- a/kernel/power/hibernate.c
> +++ b/kernel/power/hibernate.c
> @@ -370,6 +370,23 @@ static int create_image(int platform_mode)
>   	return error;
>   }
>   
> +static void shrink_shmem_memory(void)
> +{
> +	struct sysinfo info;
> +	unsigned long nr_shmem_pages, nr_freed_pages;
> +
> +	si_meminfo(&info);
> +	nr_shmem_pages = info.sharedram; /* current page count used for shmem */
> +	/*
> +	 * The intent is to reclaim all shmem pages. Though shrink_all_memory() can
> +	 * only reclaim about half of them, it's enough for creating the hibernation
> +	 * image.
> +	 */
> +	nr_freed_pages = shrink_all_memory(nr_shmem_pages);
> +	pr_debug("requested to reclaim %lu shmem pages, actually freed %lu pages\n",
> +			nr_shmem_pages, nr_freed_pages);
> +}
> +
>   /**
>    * hibernation_snapshot - Quiesce devices and create a hibernation image.
>    * @platform_mode: If set, use platform driver to prepare for the transition.
> @@ -411,6 +428,15 @@ int hibernation_snapshot(int platform_mode)
>   		goto Thaw;
>   	}
>   
> +	/*
> +	 * Device drivers may move lots of data to shmem in dpm_prepare(). The shmem
> +	 * pages will use lots of system memory, causing hibernation image creation
> +	 * fail due to insufficient free memory.
> +	 * This call is to force flush the shmem pages to swap disk and reclaim
> +	 * the system memory so that image creation can succeed.
> +	 */
> +	shrink_shmem_memory();
> +
>   	suspend_console();
>   	pm_restrict_gfp_mask();
>   

