Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5470E3EDE3D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 21:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797DC89D5E;
	Mon, 16 Aug 2021 19:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213DC89CCB;
 Mon, 16 Aug 2021 19:53:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkI0VLiqKw4kfbRmMIfGfasxUXNlnO4/KappkyT/7v4qjlOuUbMTw7YTPf6+rPDuX1aSL17z7mloLpQ3aCI9MBGiEeaSlHmddwDayT7RIUj8j141EXJqa08WGfkj1oAKxHe3ZnEcxV4xXCozjjjqabwSM3jX929YFTz/XGU8tLLJf6BHHuZi6wyDNysLhbgkB2z5n5arscL8YgbgmjNr6vK/afKhvDoK0SdUDf4JWtLXzVKU8GKhyYfSIgQeCWGuQIoWSi9vPvqXd0sHFK4nj8tXSZwZrI2xaQ+D8VT8OV1KN1ez6ffXmwtRuoSn9WMc4DFkInhUrErFo04ADh8fOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1alYS2W+uJhbk/3DWL2/Q0VcD0/APzdbJl/112NJOE=;
 b=IOuWKPYlWoYKq6/hXxnbaXMXE+EaLVd1B+nAxD4wzSB1zA9KX4xiSFSUWewh8t36lQ1t1EolJDhB6eVNdTd9sUzy03UjzmMS2pkKNwVY0QpqXqdGp+vGvDHTtzBRMhQ63vSfX1WQ60Pgbpy3am0FF6VMRCN5dKnTCqsrkDHgMC+lCJEtimAspJQNFeA1e7GkALZZiq+SbZIfaqJ5DATl7oxBCoFBAwUNO0xX62m6R7epNrxQxcOnaQR0uj+82Ce8dbybT65xSo6G9puXMxfse6Pth71c9g2empxTp6MYjyZ1Qj2iWfvrg/KKEoUKPmBCNZp9RL2dy86sb1yBbDxo/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1alYS2W+uJhbk/3DWL2/Q0VcD0/APzdbJl/112NJOE=;
 b=14rep7QjEjQ+Uy1WhjcO7UkA+WTWYojg6xyrWraz4x1MEvSTWesctTIcVjBdVNo9BcoaLWivEVA0QKfNcVSAYKloBZbA1EVEkXU714LCZSCbUiL42BqKoYsHfWQ582IT0lIKkgzY8+It3ya902jiNi7V1NokQZrmG0gh2xoFszw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2832.namprd12.prod.outlook.com (2603:10b6:805:eb::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Mon, 16 Aug
 2021 19:53:20 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 19:53:20 +0000
Subject: Re: [PATCH v6 05/13] drm/amdkfd: generic type as sys mem on migration
 to ram
To: Christoph Hellwig <hch@lst.de>
Cc: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, jglisse@redhat.com
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-6-alex.sierra@amd.com> <20210815153825.GB32384@lst.de>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Message-ID: <694ea624-9dc7-7a25-78a6-308ee0debaea@amd.com>
Date: Mon, 16 Aug 2021 14:53:18 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210815153825.GB32384@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SA9PR13CA0059.namprd13.prod.outlook.com
 (2603:10b6:806:22::34) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.9.47] (165.204.77.11) by
 SA9PR13CA0059.namprd13.prod.outlook.com (2603:10b6:806:22::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.14 via Frontend Transport; Mon, 16 Aug 2021 19:53:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82d950c7-6386-48e6-7ebf-08d960ef7fad
X-MS-TrafficTypeDiagnostic: SN6PR12MB2832:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2832C978C581CB322BA52C80FDFD9@SN6PR12MB2832.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H7je2EnNHyygmZl1SULOYXZwm8PBju+ulXH1zA3KYNqPKHeq0WSuD0ZfXjTuo79s0xbGI0MsZbWsHDTkltbc1OOuFG7pzN8ZDKzanN+2Gkf+gtYvQhW+Yagxgz6mVLOXfC22ivOwT/lWC0vv4uU/glTGtHJ6FuM4K3nir3qO/l2eILTH9/C9GuLqZ62K8XyXmD/OLbc0rvPxy5485eVMCajRLqhP4LURpgmCFzszgbSvg68aIvKOzLJchqogp6ymSd97GkwHf0jAolfeqDY0GLIP+0XcOWOFUSuxC/GjI4HM28+3pX+g2/yNnpM+w13sufN7HZdbtgNBGeaqTiPwgsq8mDcrGNXKywHbc7eUkOvkQTF5z3lO/GAGWfyDYbv2tD+WQZh7+L8riEW2au+oPJ9W58E1s1TxEuy1CuqJQfu5Smgy+c+6a30E5nmXbGz+qCvWyY3co7s9UpxpyPlAqfEkcgB1AdVFhjN5bWJEIHBksNwCMMDq9Rbox+fGtj4SscdWCCy6J+xtPTgo0BN+zYibsXDrevaPGFdMH46CItXwdYblbd1epPVrGWaDLLzruutRL1ac6XoO7sPbq7evt/SVJq681zEuQN+Af1AUdj38AvAkox/MKxWyNI8Ye5YrMnM1SbXR5RDTiIZMP2Ct3zCv07Yde5uw/EWKnzeprwZRBsqzGujtWRNNy+jwWIY10mkqTOSIZhkUO1jNjMf+472wqj5RLu/W8nZfQsY4ScnKz+iV38L8wl76xLGEIme8Ht2cit0rKFZffTjuxXHUd+7bMpUFBP1JGy3gAIka6e4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(956004)(86362001)(2616005)(36756003)(53546011)(8676002)(31696002)(8936002)(6486002)(31686004)(478600001)(5660300002)(38350700002)(26005)(4326008)(66556008)(66476007)(7416002)(66946007)(6916009)(186003)(16576012)(52116002)(38100700002)(316002)(2906002)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkFTa2h0QVVBLzVhMjNOeTFWd3pTdGw0RjdvVHBiVzRVVmQ0UXA0VzNlbmov?=
 =?utf-8?B?Y3hDbzB1elppS0J6L1RDYVZGVjVaSCs2SVA1UWFDSlZDY1dpUi92elM0Qk9H?=
 =?utf-8?B?aU5qcGxyMG9PVVpWYzEwOElid2U4N2RPR0htelZILzR0VHlWblNEcUlkV2E5?=
 =?utf-8?B?R1BVVjBZOXVRZVRaUVhxTWRsQ2JvdGljTGh2UzNoM2FyajhJMlZJSmFobDRl?=
 =?utf-8?B?UkFVSU1GSDdXQURkc2dTMDhSRW02MmVOekhuc2J4N2J3eU1Ua25UVWJ2LzUw?=
 =?utf-8?B?bkl1ZDJ4WE5IWTFnQWtwWTZiV0ZWM0Z6MjVQMk5rVEY4T2ZpVzZ6UzlJV0RG?=
 =?utf-8?B?RlhkVDRIMkpaSmR6dm9FNytqVnlwRG1MTmtNa2RRbU00U01jT1VzMXRHTjU2?=
 =?utf-8?B?TVpPeWlqbnV3azRrcTdqOEhoVTRoVHRaNnNWdnBPSXNGcDRoYWRNMGFwNUxV?=
 =?utf-8?B?VERlQUJWcDhITHFEMHRzUzk0LzZDY1pScHdhQ0lDbVRMblV1OGVMNjF3bEFN?=
 =?utf-8?B?NGd0OFJxWGN4SFhjSVFSZ2NqTDhnOTBDMzk1dnJmSXBJZW9yOFJyNnJ0RXJE?=
 =?utf-8?B?RGdSTklrbVU3eW1HT1BJczlrVVVjV3MrY00xdGt5TUEzTkZMbUJHRWxaN0Vx?=
 =?utf-8?B?WEJ3ZmRwRVpRZ2FnQlYxMkVISVdmbmUyWlYzZW4vY3BjMU95UjgzbHMyOXl1?=
 =?utf-8?B?bklveFgrWlpVdUozdzVIVlVURkRpOHlDcXI1RHhDY3FTVWRDV2JKT2ZCN3dl?=
 =?utf-8?B?bXNuVFAwakh1aE1VRUhOVHVBMnRud3lGRUN2dVhTRDlSNWNpYXlnMUUxT0pE?=
 =?utf-8?B?WkNBcnNTMWdtZ04zRjdWNVo2UGUrM3dwakwxS0RKZHA1MTNVbFdTTVdxTGxh?=
 =?utf-8?B?SnBHcWsvc2swS1BaYTVhRUZxMXlsQmZjcEtoT2trbGxuQ0VHVEtaRVR1bEkr?=
 =?utf-8?B?QSs3UWV1Tkt4ZnU0ODBFaGdYYXJCZUlIOXJPTTk5aHRJZThGRVM5dTRpVHZ4?=
 =?utf-8?B?RGNlQ3E2VU1CWnBKYTUrTDhDZmllSFByNWt2TldSWlEvVitERTFmM1FJQlRK?=
 =?utf-8?B?Q3dEQ09rQlowMERJczRHMHFNOHNPZVFIMVRseUFrU2hWd250Q2FoMWpydzY3?=
 =?utf-8?B?eHpMem1oRDA2QlB0ZE04ZFB4TDZHYWlpd0liZXNpNXM2VlBMM3A2NC9aKzla?=
 =?utf-8?B?bVpUVmxzMzdJYThqNVZhVlRqTWNSRGREdWd5SmEyUlV5Um82a1hWd0M1WExU?=
 =?utf-8?B?TzBqUkhxV2FDNzF6RUV4akdTeitxaERwUFRKNjVwUEdUdEZJUThWSVc4RjN2?=
 =?utf-8?B?U0c4cllrRlkzRllibXJYTGFyUWJ5N3RUYjUrajRsVVBJMHUwMUhDMytIU0xH?=
 =?utf-8?B?MWhFbGtVQStKaVl4R0ZjNnBiMzZLL2J2YXd2d25aQnQ5eXRMTVFUNzhqRWZJ?=
 =?utf-8?B?c05Jc2dIWi94QjBYQTV0eUhlZElja0swdEtXTjZmdXp5OVUyMHhXeVBtM3Y2?=
 =?utf-8?B?S1JrZXdFcHdIQ09jTnV1Z1o0c1NHQ2U3SThWOGxaOHNEZEpyOTE5azc1UGM4?=
 =?utf-8?B?ei8vdHp2S0ZyUlI5VDE1TlVUZHN0dS9DaXZhRnVpQWFNNVNFQkZTMzhOaEhK?=
 =?utf-8?B?Q1Zhd2FTVlBpMU5zYTN1cW0yTm44Qi9ZZU8rbERURUF6bWJXZXMxQ0Z6N2o1?=
 =?utf-8?B?TjNxWWVFU3hwYjdFOTkxUHRXRS9UVVdEdFFDeG9sRklWNHMzdTIyTWNzR2Zh?=
 =?utf-8?Q?+OjfLAT40Zwb2EvlX7b4zTPO7ZVUvoAl3gKWWsN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d950c7-6386-48e6-7ebf-08d960ef7fad
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 19:53:20.7024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dk1bc90wA3KGwvxP7VD41ky4/7idtc/7XnkgO6NUemRdlTBGUeNUbnH9+CeU2xAdw3xUcyUnb21MdgQrnYsbaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2832
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


On 8/15/2021 10:38 AM, Christoph Hellwig wrote:
> On Fri, Aug 13, 2021 at 01:31:42AM -0500, Alex Sierra wrote:
>>   	migrate.vma = vma;
>>   	migrate.start = start;
>>   	migrate.end = end;
>> -	migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
>>   	migrate.pgmap_owner = SVM_ADEV_PGMAP_OWNER(adev);
>>   
>> +	if (adev->gmc.xgmi.connected_to_cpu)
>> +		migrate.flags = MIGRATE_VMA_SELECT_SYSTEM;
>> +	else
>> +		migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
> It's been a while since I touched this migrate code, but doesn't this
> mean that if the range already contains system memory the migration
> now won't do anything? for the connected_to_cpu case?

For above’s condition equal to connected_to_cpu , we’re explicitly 
migrating from
device memory to system memory with device generic type. In this type, 
device PTEs are
present in CPU page table.

During migrate_vma_collect_pmd walk op at migrate_vma_setup call, 
there’s a condition
for present pte that require migrate->flags be set for 
MIGRATE_VMA_SELECT_SYSTEM.
Otherwise, the migration for this entry will be ignored.

Regards,
Alex S.

