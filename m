Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F6C7B8E8B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 23:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FB710E1B1;
	Wed,  4 Oct 2023 21:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E85710E143;
 Wed,  4 Oct 2023 21:13:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=US9AwIfRbpWst7yGYYHHbXevXJ6EHJO2mAy/DEbB5QERvb8INvpo3Frkq2Xa2zSbDTlANmI7zHdqtQTrGvkyJgioN5bRPIY8uMmGM8wkzW6+ads9CxsrqORjRLr7W2YzmcDCDr/AvDa2fbVGERHfhybmL2SA6wtQQn68JIObuzGCSHZnxws1g3i56uxU7F/KQM3+dRJIZFG0xwi5Y83spJA/Fb2D8dclNzbIGG/AcP8kZXJljAdc96nDsqUInxJrOsMWNjGwk3+7XOn2d27YyaOOA1vm/3arWGGwp35RpKyLULWYxU0776BmArI3+fEQRzJFiTiNIXbX7Z8y+7arGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzF4i9t+hN6tJ+1vYs8whZLV7o0ZniGWaLD6PSpVeoE=;
 b=DwgcD+3Sp8d6J2WgqDOUJhoEMjj7dakdwc0Z2ji5R0FTTBZpo3q4PfUScUsyMAM68CpWDZQzOUoFrNDnaCs5Bn8MymA7xeR0rncexA/HREvUi8c7JFUQG1nlx3BzdgAwymHxXN9+8IugTBvXTdmtRK9TpdFNRiDY3m03thL/+Xu2iLWzEnjwcasKdT6FB5tvdAScL0+c8otVUzLnsyY1YNGqBkO4vusKMDrgMkkWP0weksRaw+TFBD3TXDUVhUXw67KcaehbtELo32xTFDddyR1AGzI6z8yhMymQmVVxkBZ9mjw/+Yb/nVjiu3KMeGRetBr5P9Jdkmy8peD63mmuxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzF4i9t+hN6tJ+1vYs8whZLV7o0ZniGWaLD6PSpVeoE=;
 b=f1XGUI953fiT75FVvzD3UGRjG2I60Dh92Xq7W3gTrNiqSz0W58uOS9+rmsslGMMce0qDq4yt2lk6bgD7vOvZ0MX7ULsnP3D9UMYIFDf7Jprxiz8axhOZDOlqhfbzwrWBLNYwn70KwOKy62qfRD9f2p2/LT04l+ek+yBPpRHiFYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DM4PR12MB5150.namprd12.prod.outlook.com (2603:10b6:5:391::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.33; Wed, 4 Oct 2023 21:13:33 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5aa2:3605:1718:3332]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5aa2:3605:1718:3332%7]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 21:13:30 +0000
Message-ID: <15c4ba31-39f3-45e0-aac8-b45f844e294a@amd.com>
Date: Wed, 4 Oct 2023 17:13:26 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm/amd/display: Remove migrate-disable and move
 memory allocation.
Content-Language: en-US
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20230921141516.520471-1-bigeasy@linutronix.de>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230921141516.520471-1-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0013.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::9) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DM4PR12MB5150:EE_
X-MS-Office365-Filtering-Correlation-Id: bc2d754c-48b4-4c3e-e6f6-08dbc51ec277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jY6A5IBszjUCJcA9OZzHwXW1GMrVulOyc0ndBbBzO6JXDv6M3mxCz7AaoeOZA6cq5zO9xG8wxkA0DvPOc2uW4zQNDU9dw2TNy/0YPjUZu37Bo5LiY0LuP07rvaHMEQUSly39IkVoaxNRO7TNnhiJ0JGEQIGTfF04C9sDuEDQDEknt/S8ZqkySZI7CPvQgltzSVqDF8mjV7S5sbRgxcXiITfCNWd1QazYCPfNg97JBoS+OI1We5adTF7HyrAV7iCctaz4U3aP7Xsez6aAYXELDRqToxAL0sATLqWDUH7hntDv/zJ8RIC3KjhXZA5s4hOP4QfmlufVv4b6HawIKfA/rEsxvcpQdexHJqXw/6UcY1wdW/pA2iJkq2h/7Mu827MBPg6c2a4n6HqiaVWEqI2/isFgDroH8ch9Rdsn10ywFKqulgPK5k+tX11k7em99TOe6zmCeWm/RYcsQwqNeYZOA/ppSX9XBpMbWEqvuDGu9GiFz08B8snhWo51oZ9bFWqggoARaWxV1M0cB6W19EyzXNqsjZDp9Z8qCn0SWxs4daVehIPWw1csWDejky1eimr7WITJl35KodiW3+IGvFeg6gD9RR/kQ6Gu78EqucG0qHKpKAQKhFUDd9N3q3SSl96Uyk7FP2dMHhnFpnMyiTF/tQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(396003)(346002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(38100700002)(2906002)(86362001)(31696002)(36756003)(558084003)(316002)(66946007)(66476007)(54906003)(66556008)(6512007)(53546011)(6506007)(2616005)(41300700001)(6486002)(478600001)(6666004)(31686004)(8676002)(4326008)(44832011)(8936002)(26005)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGUwK3dac0g4MVJnQTB2bklIRHMzWmdDM0k3NG92WUV5aG9HNWhJdkwxTXNG?=
 =?utf-8?B?OWRmajNIYnlEL21hSVZ3cUxSTGVuWHdpRC9jRDN5cjIrUmNnVHc5cDJPNVAy?=
 =?utf-8?B?SWd5cmcxWTQ3Zk1rUmxwMi83QlBjRWR1Ukd1ZTdPT1loQkFyckdxN3FoMm01?=
 =?utf-8?B?UXBNVExldU5lc1hiRmtaYjJrVUNxdXF6b3hjNThtcHFCTERrUzdWeVlNZDZ3?=
 =?utf-8?B?aHdyS0tWeHhNYXVQOUR2TC9IZ3laTCtzYzlKM0JFNGZIOStWek5lNGE2Tmt4?=
 =?utf-8?B?NnFHN285a29XdzY5ZEJUYUwzaHZLZmwxdTM5SkxXKzFGSHp6NDVtbzh5OS9F?=
 =?utf-8?B?V0FqMHVqNGUrUVJxSzdnZDhYTFVTWTIzbXcvVno1alFrNEY2Qkl1eDhXODVJ?=
 =?utf-8?B?WXhDb0x1Y2VLNlNzbVZDYjNMVXczNjRqWE9MK05nZnVCMjlJb2plVDRtdURx?=
 =?utf-8?B?WTJkUFRHR0s2QVA2VFphRXNINER6ZlpyQmZqV3VybFA4TExOcjFWdVRsK2cr?=
 =?utf-8?B?NUplSmhPNHFIeUtUMUlvaVdReXpvNXQ4ZWl5cDEzcXVUUmNwWk9iNXUvRUdw?=
 =?utf-8?B?cWJ5azZMakRCWWRqdDJTcFhKWW55R0NibTA2NXJaS0xHNThnS2wrdWxLTUtU?=
 =?utf-8?B?SStlQlpEOVVpbmhob1c2aDFKNHZTZU1PMHNXQTJZRWRlYzJDbDhiT3JIMnpP?=
 =?utf-8?B?dHhMUlVaVlVJWWtjeHhxbDJGTldvV2dOSnV5MmphR1RGa1c5ZlJMS3pRa0s0?=
 =?utf-8?B?ZmEwY0hHL0JzdXRod3cvV3dBbVFFMDcxeWRMMk5sWnEydktUVVY0RVNHMnJy?=
 =?utf-8?B?dWF2K0FWc3lxSlZzaXRNK2d3OElZQndBek0wT3NnV0swUThyd0E2aXNNV0Ny?=
 =?utf-8?B?VU5HM3BoVFMyS0lXVE5Qb25jR2dUNHNnT1ArQzlJVmF5eTFYS0xuK1RQMHBt?=
 =?utf-8?B?QnVGSFNBZ0UyQWl1UFlxaXRhc2kraktSaFVVRzNia2FoZ3owSGIzaU4veWV3?=
 =?utf-8?B?ZFJiU3IxUWxEZjczT3RWZyt0Y2V5YlhwUGxIeVlXcHBZbHJISnNXZURtRTMy?=
 =?utf-8?B?aUFWMFVNY282YzdMdFFUOUR5OVFxVnJJSlBXK0F5VTNpdnVuNGJBV1RZYVFa?=
 =?utf-8?B?bjJVVlhGeDA4dWFWdXpGdjUybFdrOXJZSjhtSjJqd0xUc1BZR2F2bDNiY1lo?=
 =?utf-8?B?RVlVWDlvb3VGUkFpT1FZakFabjFHTHBQV2NpaVMzelJQYmY0MmJwaWVsMHR2?=
 =?utf-8?B?K1FvdnRoN2NHb2xVZXEreTJKRGRUU0VCTTlzV0RvejFJb0p2Yi8wSFE0emEv?=
 =?utf-8?B?WVNhemtnY1FRcHBUdzFndFZlMXJSVHZpTlFOQmpJYVB3UE82aHRaZ245ZFA4?=
 =?utf-8?B?ZERNWXhUMVY0U1RIZnZ3aHkzTG80cmJrd0xlZSsrck9seTdjeHFJaDNUL0hC?=
 =?utf-8?B?UmNHK2JKcTRZT0NRakFpV0xjL1luaEgyMWN0Y25mSHYvOUlFQkROSmNsbEEw?=
 =?utf-8?B?bFBweERUL3Evb1pnNE9jSFZzMFVVS0Z4bVI3TkhXQ2RIUVR6bXovT2VZQmxY?=
 =?utf-8?B?TUVWa1NzeXRCenk2VkQ1NVRpYk44VTIxeStvdHhSZHBPMUZFZjlVUHpOZDRQ?=
 =?utf-8?B?RXdmc2xJVGlRRlBRc1MrNGNHUDVvWlBMMjJqQTcyL2RMSkFJVjVvMkl6cVFV?=
 =?utf-8?B?RkFlaCtzd1VWU0VaTUVLN09BV2d3ZEs1MFdXTThJRGtkZk5FT2hOQ1JHZEg5?=
 =?utf-8?B?djY2TzdUZnVLR1ZmR1orVXplQVRBTFNvWUFuWUd6MVNFMmIrYVkwdnY5MDhR?=
 =?utf-8?B?Snp3ZmkrSnE1clJyWndPOGNjOFJUazVCYWJpRDMxQWVQV2V3QVQwc2IvWVB5?=
 =?utf-8?B?Y0N1UHRFZUlGUTg5Y1hTVWhtMEFqNnlIcTQ1VUVDUHcxMWRvbDF2bzVodHFk?=
 =?utf-8?B?K2x3YksvRkcrZUI0VTVsRGZDTGs0c21oMWwzSEluMmcyanlYZ2cxNlZlSE9N?=
 =?utf-8?B?eGw3ZVBiM3RweDM2dmZ3RkJMbG9OYkk4eTVuODBEZGxJUkFsd2V0OEdpS1Ni?=
 =?utf-8?B?YUsvTTNjRFMwS1E4cTluZUZPM3Z6ek8rQkh2TXY3ekdIV1hNdkoyM0h0TFNu?=
 =?utf-8?Q?5hF6INYCON9C8J1eEg7dU3mb7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2d754c-48b4-4c3e-e6f6-08dbc51ec277
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 21:13:30.7962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rOrywI0fVS7ouNs7T2e8SfkJcE1YKHXaUPcC4cBXXVhEkQCImjeEEoZyr3LDm6F5CfrWm4CTGMoGnopc5BxrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5150
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/21/23 10:15, Sebastian Andrzej Siewior wrote:
> Hi,
> 
> I stumbled uppon the amdgpu driver via a bugzilla report. The actual fix
> is #4 + #5 and the rest was made while looking at the code.
> 
> Sebastian

I have applied the series, thanks!

> 
> 
-- 
Hamza

