Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75744856A2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 17:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4373110FBC2;
	Wed,  5 Jan 2022 16:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E6F10FBC2;
 Wed,  5 Jan 2022 16:28:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENEyHPbaxKkB1215MSCO0WFqVrxEoZfuzqqan7GlBfzWROu9dzLdTkC13NdFXnBIJbDiyDAzfDV7VpU5IE951DEp9XOiRhzFnoJ1zadRxcjYlSVHlbfsXdmgELQJ06bJ7z7pH357+QYzskSQs4SGLhcePzEvUCiVEDabsyR3ddpoveoP4WmDYw+DIXr12FNGz2JimuM2hDZIhHuyQQANgTSXGV/+xzWS4VBtLWNcpHs3X5FNP6MUX39RWBF262I0c49Sp2o93IRgukTLJekBJMv2iUZzy6yUq8gHFo/FbEX2hcohw4r/38XY8Lu/OjGR7vSnEBVkRgGKvteUxvcDug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdzzVySe8NdoTiHo6meHBPxUMid9qdEkrNnDU9vu1yQ=;
 b=PSQk3XiZ3IuqIRoXsPyR9aDNEJQpwafhRvR53Q7Fbg1YapdKY6STDUvQC1OzQcwuMySw45BgwwIP/I7M+0Db9zKRv69Jh+has3gF9pGJTiiu1LMBEcfvi4QAJOWobk7A+jrcCLM54DPE0hi9K6z41aV6+fGhsXEZ8xCbN3xDSyWY7l1H/qxYNn6ZG9ScJcib4p1VeWEvsL0P9Vc8Ym/1jO/ebS2oG8HWWa0ZjQnhZJA6hZpNr1EkCeuQBQ4xOlYQ9/f1/kHqERZdrGY1d2fH7/1zvItz9Mg4XcnhbJk7XjjXLSozgqQ7Vr+rqVahoYhhzTZU8XK97/PutF1EYqnmFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdzzVySe8NdoTiHo6meHBPxUMid9qdEkrNnDU9vu1yQ=;
 b=fOmsEHXDWIQpFlCLGeUX79T+GF47OkHWRpJQw/UqV7dBEpZrQfeUFm8sOeER9ONZ+YNmeCewQO6fQceRa9bO9IwwPPoEm786nH25Pru9np2sfhhLhHLWY+qn5EqmN19qkH8OGqt+E8BMQHkG2byMX5ZeUiMEAKNMEpBGn6IqEYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5098.namprd12.prod.outlook.com (2603:10b6:408:137::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 5 Jan
 2022 16:28:01 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 16:28:01 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
From: Felix Kuehling <felix.kuehling@amd.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>,
 Adrian Reber <adrian@lisas.de>
References: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
 <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
 <58d61e47-3796-3147-db6c-ea7912d16902@amd.com>
 <de272de9-3f4a-db40-699a-41394cb699dc@amd.com>
 <cb5668d4-a13d-3b0b-442a-bfe1b3a7239a@amd.com>
 <000edeaf-8a89-ea4d-5b9a-2bd7758f675c@amd.com>
 <f00f2f16-f0b3-cb54-f88e-d53353bfdb79@amd.com>
 <f4527002-ec6d-5279-3b79-1aacb6cc55cc@amd.com>
 <YcBM3PMz7J90F3LQ@phenom.ffwll.local>
 <9d1030c2-2269-cfdd-bbb0-9c3d5995841a@amd.com>
 <YcOQN/l7W66W/X0f@phenom.ffwll.local>
 <a5c769fd-7eac-2628-a36d-fedddfb7d398@amd.com>
 <279c7ffc-99e5-f052-5de1-9b957c455d85@amd.com>
 <1ab2558b-1af0-3319-dce6-b805320a49d0@gmail.com>
 <60760210-3b3d-952c-2637-4d70fab1a857@amd.com>
Message-ID: <185b8195-e100-ad90-49a3-061a50069c7f@amd.com>
Date: Wed, 5 Jan 2022 11:27:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <60760210-3b3d-952c-2637-4d70fab1a857@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0122.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::31) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 113a4e56-6fa3-4265-6921-08d9d068577b
X-MS-TrafficTypeDiagnostic: BN9PR12MB5098:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5098C44A812E263BBFA91983924B9@BN9PR12MB5098.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HhulgxVej2z1SPrs6QByrv75ZBFbpcZ5AgMyRL/s+8goEvLwPGI03VYOp5vSzKUeEWAlW73WPsr3qjhtCicEHauRiC8YkgTjPrkaXjFx+//ydxMp/ntTzHfsuM03G3bfpbd3QwAxbEs8AZfrqf/dY3xksMTXcCQpr6TQ+QszcshyqYC6VWSJj+2/OTukwo9mfPeOtgVSP6AxYfeJAlSsqIN292Fvbjx2uzNjbx6SL2M85MGwFiKkYR2ejErHek518rQzA+aFmjdS+AyFrzYS6pwtN8XLfzt3y1pTNglphtgtVI5fVO8l3HkBPTrmwjgI22rluQqSS7ebk6pW4Moa8G6zGWzFwl0AM7UMB6oIjWVRFgyQhk89mPmx0aVBWBe8IiTpo26LLPHaHE869bTubD4yeyGNKoz0SQdp0p0IbPBLg83iDKg7UFGExSeM5lTf/9nm2z7kjvmf6A3kIT6KQVcElq8RIyk+bropiMJZ+nY55He1iZBYVb+fZnqo0BE4yXaaFhNpzWIUlkOah5+7zoJatqA2COx78iI1ez9zInze/qgLODbpaS1ocG1nwnlgyRqJpNUpU1KRC/FTVQNxRc1MapQoJxUCcnFKNFEZVQ6e6gbzJ38aMyiNfRJC6L6Z9FqaxZgE5abGtvaLgFdvi/YzAbhWM4lDTgGKKOrb6MzLTpQhaZYoJhK7WJ5FZoQ9Efko7LSzoQDJCksukepHMEnQG4PQxp9oIM4u9Fti4HwoeBvH9c36/JX5iJ/pZOn/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(31686004)(6506007)(31696002)(186003)(26005)(508600001)(8936002)(8676002)(86362001)(2906002)(110136005)(5660300002)(4326008)(83380400001)(66556008)(66476007)(66946007)(44832011)(2616005)(6512007)(6486002)(4744005)(38100700002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmlOQ2VVb2RXRjJwUFA5ZnpTbVJvV2k0QXRFVGJ0NExkQnphWkFYTTE4R3FO?=
 =?utf-8?B?bERDY1ZsWTBJTWliY2ljUUwvTDJwOHF5L1dXVW1sSkRKaXlnMGlEUFJHREpE?=
 =?utf-8?B?NGgvcHZOc295RFQvOENaR3RXQ2hFYjlsdjh3YnFkUk5wV09oMFhLL25jWEJq?=
 =?utf-8?B?a00zRzlUN3RCenFwQ00xbTdBUmorcll1MXB4b0RoTVViVFd3OU9WMG1HMlBa?=
 =?utf-8?B?YmVIcXJkcjdia2lEQjBsVjJWaTZRMG1aR3A0YXFGYWFQOTgyOHIzU2t5S0VI?=
 =?utf-8?B?SWtFOGNJcEZDTUVsSjVSY1owL2dkblY0TCsrYTFPODhHU29FWjRpY2VaN3Iy?=
 =?utf-8?B?bkFLazhFbFduakpOeW92RTRHeGR5V2hBVlhxQUxmRnpTY1o5MzRuSll4RjVy?=
 =?utf-8?B?VlY1QzB2b3g2WUQ0YVRwNHhyNFVMbDNjT0VqSzR3aW95aU1ObHhJNWpkTHlM?=
 =?utf-8?B?OCtnWjdQVmhnTGpMcHBNeFJiQ2NLVTNjN1lqNlFNMGhhMGxLcVY5c3VUbW4v?=
 =?utf-8?B?OWZ4cVJjK29tU0d0RHNFNFAzQi9PUlBPcWJORWZWR1JSQmxCdVM1ZUVFbnY1?=
 =?utf-8?B?cUdpbW1rOCtiRkdXeWlrZVEzNDI0b1c3eUhsSlUrc1FVZCtWUWtqeXdPRENH?=
 =?utf-8?B?dGNlcGhkZHBLSlk0SG5xYzc4VTlsaEM3WXJ0bFE4OHljYUZFS3RVZERBUkZz?=
 =?utf-8?B?Z1RPdXRSTExyeE5naHVMOFkzQ1ZoMm1wcURXd2JYcGF0ZzA2UzhlY3JXQW53?=
 =?utf-8?B?WmRPQWxMWXNNS3E1TXJhTkFKcXJkeEhLQTE0cDY1UWtUaVlzbHdDSzFWa21W?=
 =?utf-8?B?ajBVOW4yK0xiYnRMK3NCRFhXTUdsMmN1VmV4Wlg0aVlVMHBhWnY4Q0RnZStH?=
 =?utf-8?B?di9RZU9iQS9IYVFMYmhkY0s3bnpQeDRXb280cWN3YmNhNkYyQ0JId2t0ZGdE?=
 =?utf-8?B?cUZRSlBnVFVyeVhuMkx5Qjk1TENQOGRCdmVoTmhqM1JUUkg0WUZ1Mk93S0h3?=
 =?utf-8?B?ZDFwQ0EwYk52bGx4VHVJeDV1NHFLTGNhNTdCWmN5dFM0eFZncHJTNjFBc1hq?=
 =?utf-8?B?M3lqbGR2MXRhR21YaUkyajRJdWYrcUJmdkNPZ0picHZ6UytZeUd6SDh4Vkd6?=
 =?utf-8?B?am8wdHI3NkkxaldWdFBheGNRdkR6dld1am5BMWpLbCtxMHpsZnZQK3gvZHBX?=
 =?utf-8?B?UG1tYzVxMnB1UHUzaWp2ZTVTWWN0eW5SVXFVOGRWN1E5bFRPNzRtRWdScWVR?=
 =?utf-8?B?Vi9yV0ZFRVJrMnN3RGRuNUU3dW8zTDRWY2ZHMSt2SVk3bFY2R0xGdCtiRzlR?=
 =?utf-8?B?OW5YVFZnckdKOHg3TTJuYjNRUWszRERrd09ubitXV1QyQkhvejc4Q0M1MFdF?=
 =?utf-8?B?d3ByN2xSRWV3NWpvY0lndENwZEMwOWNRbDhxTy9jUlNXNmlwU0Z4MEsvVnB4?=
 =?utf-8?B?R2dyK2c4UDBkdHRaVndIZUlEWFZEb09ZME1FblZKSlEzeGUrZ1d0QXJDaHhw?=
 =?utf-8?B?WCtBZUNiY2ZZc3lkZmZVckVFK1d0OE1HWGUyNkZPbjAwSTNEQjZoTWtPU0JO?=
 =?utf-8?B?bFhaQVhnMUVrODZUWGVsZ05VSnVHbkRMZGZoU1BhaDJPeGZyNWhSU0g1b29Z?=
 =?utf-8?B?a0hEVVZBVzYvclFFUDIzZ25rWTB2eEJjd3ZYeFI5TjljV3ZrUHdHL3NpSCtw?=
 =?utf-8?B?endZRW1RWjljZzJyUFhSb0Rqc1JIYWpaR3RHeENWbTFHa21KUEc4SGxyemdh?=
 =?utf-8?B?SWZZY015QTBDNjkvZ1o1R1VPdlZZRmFNeDBMSmJDOGFsNFFuclo4R3VVRFox?=
 =?utf-8?B?ZjZ2b0tQOXVaSjgycE14WHNyOUhJb2s3dXZIcTQ0RFQ1Z1Y4aExyWFgxRERq?=
 =?utf-8?B?bDNlclJrZUVENnVJRk9jMFJ1WWNBNHhBQXczRm1mZWw1c0hIOUlZM3RtSGJz?=
 =?utf-8?B?dll0dUFyU2VnTWt4alB4enNhM3FWMWlGMVlERDhyZkhHUVZQOGpHNnlQTXh6?=
 =?utf-8?B?MkhoOGFJTlM1YlJWSUtZcjBBWW5YZFc2Z0VZV0hhWnJrYlkwK3N0UUpiUlY4?=
 =?utf-8?B?VTN2bzRLK2hlUy9YTVBUdnp2R2gzbUpHenE1RnduSDM1OWRlVG5jOXowZUhy?=
 =?utf-8?B?VlBXNHN5dHFDK3BqVzlraXdRc0d1cVovQ2pZSGtib2szREdrRTdkbWRXOUlv?=
 =?utf-8?Q?4lau9IWKWyTymzdobK/fgGI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 113a4e56-6fa3-4265-6921-08d9d068577b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 16:28:01.4704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3E+4ScHp+kjyQPspSTj64m06EVJ6rGNsd3VaHCwbjJ6ZB4ZDDIbqR/kPTpfh+7enIQpkUBr+5sIlkZIZQcx0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5098
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 David Yat Sin <david.yatsin@amd.com>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-01-05 um 11:16 a.m. schrieb Felix Kuehling:
>> I was already wondering which mmaps through the KFD node we have left
>> which cause problems here.
> We still use the KFD FD for mapping doorbells and HDP flushing. These
> are both SG BOs, so they cannot be CPU-mapped through render nodes. The
> KFD FD is also used for mapping signal pages and CWSR trap handlers on
> old APUs.
>
> Those VMAs aren't causing the problem. They still map successfully on
> restore.
>
>
Small correction: KFD already sets the VM_DONTCOPY flag for all KFD FD
mappings.

The patch under discussion here does the same for DRM FD mappings (at
least for KFD BOs).

Regards,
  Felix

