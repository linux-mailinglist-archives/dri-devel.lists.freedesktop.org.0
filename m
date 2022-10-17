Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD87C6010A2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 15:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D11A10E0BF;
	Mon, 17 Oct 2022 13:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B896110E0F8;
 Mon, 17 Oct 2022 13:58:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeuN8sZLQHn3wrCSWs2nXEtBq1wXP/hbu3xZ13YOcczzqTxLtDNZSeZvhgxSku3/gRbnFT7s/D/j6JSW16xuRRl8P5wvpCXqqql0CKGWfwcBnCQBG99GAxO+RRKKnZob28y7qG9Qx4Sp935pCrdCunswS7uL6WsA3ljuXP6aEtfY5dQ2wr5aYhtfbl3dEBElgKaCka8DyE0m1tHd5wSla9qEP1PHF+gfwufJdd8Di+YdzGB0Yk0Oulke0338cKLBmG0RI7lJcRDLQ8R5WJWImOYbHytUY9mOpYk8OW7G7OySev35teDPNq5m9H5T3VanzzJxtr0q1QG9RCMmvtd4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0X/aydKfdzOmHcxiN6rPv/KC9KTvOHG4XLWcEO9FdI=;
 b=QHwiJ5jxhnx5vMCSGUv/8975+RMtO7SGFwEb7QYlEv/pXi/23hy9JICQqDa5ZjfHYaRIG7XNN1QQ+MDALFWsE6vOG8KqaUYsL2X0QlUFa1OWkQvJyGqtQhSnmXEs1/WBuXyE9r6E84bzN0kWmH+SsqMIa81j/oy22wjNRT2zSgaSmAx0gIo4NK+j0kzbKCmYmeeIx0Vs7wexuwcRHn1U1EY+LT2K0saDVE5HhJq+N3lQ4iodR6q403y66LvP4kqNRUp9ES6Mqy3S1grFETaubS5oYiM1rnXc+9YvzNBREtRdc1OpGM+o9WnvhNuwtvajwpdyHui1cz1XqSn5IGnrew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0X/aydKfdzOmHcxiN6rPv/KC9KTvOHG4XLWcEO9FdI=;
 b=TQbB9Rt8dDvKBoyUndLW3ZLA7P1rLyg49rXqxARpupfxQKrQRstG/sFw97sWAiprIoRxIGboGKTOo3h3B9713Ks/QdBx0dA1NV7BQ2hZp61PfkUHIUCtDJZfYLorG9XAuXLfER3WcK2A3N9SYZsWNh2vV4CoatUD/IE44tQgWtM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 MW4PR12MB7357.namprd12.prod.outlook.com (2603:10b6:303:219::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 13:58:14 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::8bd3:e54b:2f15:989d]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::8bd3:e54b:2f15:989d%5]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 13:58:14 +0000
Message-ID: <5aa210ec-2252-1709-70b7-f1421ce27440@amd.com>
Date: Mon, 17 Oct 2022 09:58:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] drm/amd/display: add a WARN() to irq service functions
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
References: <20221014153129.68674-1-hamza.mahfooz@amd.com>
 <ec75ba21-97e0-9479-8d87-46cc8032d44c@amd.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <ec75ba21-97e0-9479-8d87-46cc8032d44c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:610:4e::22) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|MW4PR12MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: 313bf977-7fce-4f12-3b07-08dab047a2bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NODAgTWcqlHgrzhKv5FfC2wGPDPG0tFJ1z2U58z+xuQG564vvr3cdtgkDe5EvGFgBi0JturIY+Sr2c/V8+fssfYGB5/xdJcfXPk4Ow8Ad4iZy06SJU17SGst8PtCGIARUajpg+48Nw5r4L3jmZnA+6+HVP2Ytg09zB+N38oKi2QMyLjihD+1amShm1JwFwuqWjYm2GEbDQqSzLKvlXVDXcCDD8el5/+07GNfDFTTBOI3thBB7nZu1yvhmQuSmsC4UQ+9hs8HAFYYeq1yaAy1q3lHUUSlBKvxzZTJwAb/QPrDZV/2pQOIi/zPoCj+5lnI9VMzgxT5wmGY2YILSjamV3DgwOUJCs+E0+30PPXaHQ3/85BvcG8K1/FmWUbshmhqYNfuibLlR5KAWm+Qdzyw0l+w5GzFbAHUEhqjNsUv/lpVz02fHxjUfWPsJQl4fRrMx1XyAnNvqIDRk3p2sBJRu4ma698Ns3HlKzDsgRCbmd3+Ji7wve0JClsmlYLl30gQvis/f2PaAUFqsQFzz+c5MtKb8WrzqAmm+0jXsS5seJz6Df8MVoTQmP8PtEjyILmCUiJg2utghwBCaadM4Skzhxja0mN73QlfbcvGp8EuW74DqslHVbQDw48RRqNG4V6i4I4NBi0w++eSD1MYYxkNiYAC/BNFkrLZgqc0AU+fJ+7uX1uZc6fEIjczQVr0PekqHPi48N2fkKGOYkKirxIZIRj43jvih3XP+0qnlKqioFpKUN4W+1CewGKk6ATwCt+ma+IUNqVv5lVAQqNEnrqvX4ewE/1hhhWeoSsjMZhgkB0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199015)(36756003)(31686004)(86362001)(31696002)(5660300002)(37006003)(44832011)(2906002)(4001150100001)(38100700002)(2616005)(186003)(6486002)(6636002)(83380400001)(26005)(6506007)(53546011)(316002)(478600001)(6512007)(6862004)(54906003)(66946007)(66556008)(66476007)(41300700001)(4326008)(8936002)(6666004)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWdWLy9PWEZjOWlHV3ZBeEpUb1pnYURyc3BYbUZmeHZPT29oVjRKc1c4alFy?=
 =?utf-8?B?NUpIZi9nTi93RjJTd1BlcVFkeTVXZlRmT3dHb1Z0WUR4VDlvRFgyd2Y5OWwr?=
 =?utf-8?B?TC84b0VkM3doT1d2U1BXZlZUa1ZBV3hLOXNZSFlRcmp1T29QeGw2NmY4TEVl?=
 =?utf-8?B?Q2hCZVlBQ2UzT1Mvb0tPSlVpT2lzVS9FdDQ0T3lVMlZIb0thTDg0MGdQWmJG?=
 =?utf-8?B?eTJFalJOZW5INDA1N3JlSWhrdTVIRjV2OWE2YzQza3FyQzFYQXpnbmw3N2dD?=
 =?utf-8?B?Vml3OVFZMTd0WDBkV3FYVDZVcy9xNW5jTFo5YjZaSlFOdWVjZ0ZUMjRYYUtV?=
 =?utf-8?B?L0hVMXNPeEN6Z1pqcDZ1YjFpRFZWNE11b2RBMXJzZ2NFUzVFbUdueEQvcklO?=
 =?utf-8?B?ekxQN2hNQkRkNEJRNmtYa1JaV0dHUjdWRWlReXFIRTJ5RncwWXNjdHExYzlX?=
 =?utf-8?B?ZXVxWDlkQ1c4THdPaGk1ZTJ6QlBydUlYNU1RSzZnSlNmVFJ2WE5YM1dBYTIv?=
 =?utf-8?B?aTlNUmllc255ZUYrbWhVakhqRTFGN2E2azJLOU56aW80OUZNRGJFS0hBUFg4?=
 =?utf-8?B?bjFBWFBiRWVteElOaHhZeE04alF2ZDg2SzU0R2lxbzdWWm1Xd1dUWTl0cnh2?=
 =?utf-8?B?S2RqY2p6Z3M5SlVvYXV3YUxzZnlNSG5nbk9wNUFSL3FOWVRvSkpPa1dTcUc2?=
 =?utf-8?B?M0FCL2Q3RE8yQlJKUzlqZWhwNUtIa3ZEem9PMC9kanVPSU1HTG5oNlZNNHdr?=
 =?utf-8?B?S0MrcXlocGtoN01FU3hQakQ2TXd4QzBQN2pYekp4RDJkaEhvOFAwY1Q3VC9y?=
 =?utf-8?B?UHR2RzhTUHhMRURRN0lMa3JqWWo4cWphNEthK3ZqVmtHNk1ybkhwMGZscE1x?=
 =?utf-8?B?bVBaeHRNMmNKK21Qdy9ZSE1lb1VrWndLb1V3TVFQelRybXdZUUJaZWVkYytj?=
 =?utf-8?B?OHBnbnNsekpWblNleUxLQjJ5NjlzaEpQWTZLdWtHZ3Z6U3M5Sk9mTFB6OEl2?=
 =?utf-8?B?K0RsOVdla2g3ZHNmbGRYQ24weFVLVitYRkxkYmxIenBCY3g0ZzdxdzBEdXBr?=
 =?utf-8?B?UEtIQStjZ2VMSFcyOFo0dHY2a2ozbnBMaWV3amZNR2pjbWZWSGo1Rm5Kc09I?=
 =?utf-8?B?ZEJ3djVKeE1zUVIydHJueTJuUnZyai9IVnB3VERjUU04c0tEL3k0UXVYZ1RF?=
 =?utf-8?B?SkFGR1AyL0wzWW50eGFMNjQ3TEFSdmJhak9zL3JPR3EvU3Z1am9XUS8valdJ?=
 =?utf-8?B?eVV3aWhUMUZvS0w1UWRaMXk2QWw4Qkw3NW5DUTJiUmZKSlYwTHcyNDkwNVRD?=
 =?utf-8?B?cDhTQm43WTl5NmJaclRJMkRhRXFXR1hWb25YdzV2Mmd4T05UNzFGNFAwVDBJ?=
 =?utf-8?B?dUhBelpnOE1VOGhCZytvYXZSNzRPaG5KNTVBNjgydDYwS2c2dkVDUG8xWkVT?=
 =?utf-8?B?Z0JVVU5FeVl0TlVjSVY3WFRUTVRmMFpOaFhFWUt3TGgxWkp0RkN2bDZUOUto?=
 =?utf-8?B?VXAzeGY3M3FDU2FtV2FkL1ZLbXQ5M1ROK0o3aGpXMUE5L0hKeHRsd0tZbGdD?=
 =?utf-8?B?ajdNVTJ1bkJxcTlUV3JkT2NSS2lrRUhCaWlMS0YvNyttZ2toeTZjUEZKdzVX?=
 =?utf-8?B?ZGVsOXpTSXNJWEFwVUY2NFZ6dWdSc0ZIQWlOZ3RvbWFycGVVZDVsMVc5Umwz?=
 =?utf-8?B?T1FrYU1xbG4zejFmNStycHBoeHZLTldGSDAvVndZQTdJc2tNSDN6KzhIQ21N?=
 =?utf-8?B?L3pkK0dMazdkZGxETXo1M1dFU2NiRlZKYitMbFg2bUZyMm01ejR1L3M5cGxT?=
 =?utf-8?B?TTZ5RTR0ZnlLUkt0UnJ4ZlhCMnpLVHBkNThmMmFNUnlWSjVxak1KQW1OQlda?=
 =?utf-8?B?WkliZmZtTEl6emozUS8xK0pURlhzQVNqZTVHZjJML2htWFNCcDhRMkpvYkxQ?=
 =?utf-8?B?TUpRZ05NcksvSHFJN1g0QWdDWFVZVnp6RmxpYVp4NVZ5a3BVSkdNT0ZUT29r?=
 =?utf-8?B?YkRiVzUxL3RrV0hvMlpIbEp6UmkrcmxyMWdnSEgwc2w4YWVFeUtXOTNuaE1p?=
 =?utf-8?B?ZDNVWU1tSXlDb1BJc2pMaHJUcG55ZHhhakI2cjVsVW5KYkRSRFlzSFZkZC91?=
 =?utf-8?Q?BTlLkPYZXqTMs2bd14/MC9Olr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 313bf977-7fce-4f12-3b07-08dab047a2bf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 13:58:14.7216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ti4JPD7N352Y8bZgq0p6ohF5b/6hlSU5vPIGUdhoIvoGQupa7/yJFZs7UI/u/d0gtbJCmN9ychWfeJppLAXmgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7357
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
Cc: amd-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-17 09:06, Rodrigo Siqueira wrote:
> Hi Hamza,
> 
> On 10/14/22 11:31, Hamza Mahfooz wrote:
>> Currently, if we encounter unimplemented functions, it is difficult to
>> tell what caused them just by looking at dmesg and that is compounded by
>> the fact that it is often hard to reproduce said issues. So, to have
>> access to more detailed debugging information, add a WARN() to
>> dal_irq_service_ack() and dal_irq_service_set() that only triggers when
>> we encounter an unimplemented function.
> 
> Do you know the specific issue that triggered this unimplemented 
> function? It might be useful to describe the situation in the commit 
> message where you see this problem.
> 

Ya, I'll do that in v2.

>>
>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>> ---
>>   drivers/gpu/drm/amd/display/dc/irq/irq_service.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c 
>> b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
>> index 7bad39bba86b..b895bdd8dc55 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
>> @@ -112,8 +112,11 @@ bool dal_irq_service_set(
>>       dal_irq_service_ack(irq_service, source);
>> -    if (info->funcs && info->funcs->set)
>> +    if (info->funcs && info->funcs->set) {
>> +        WARN(info->funcs->set == dal_irq_service_dummy_set,
>> +             "%s: src: %d, st: %d\n", __func__, source, enable);
>>           return info->funcs->set(irq_service, info, enable);
> 
> Do you know if we may hit this condition multiple times?

Yes, it is possible that it will be hit multiple times from different 
callers.

> 
>> +    }
>>       dal_irq_service_set_generic(irq_service, info, enable);
>> @@ -146,8 +149,11 @@ bool dal_irq_service_ack(
>>           return false;
>>       }
>> -    if (info->funcs && info->funcs->ack)
>> +    if (info->funcs && info->funcs->ack) {
>> +        WARN(info->funcs->ack == dal_irq_service_dummy_ack,
>> +             "%s: src: %d\n", __func__, source);
>>           return info->funcs->ack(irq_service, info);
>> +    }
>>       dal_irq_service_ack_generic(irq_service, info);
> 
> Just for curiosity, did you run some IGT tests?

No, this was encountered during manual testing.

> 
> Thanks
> Siqueira
> 

-- 
Hamza

