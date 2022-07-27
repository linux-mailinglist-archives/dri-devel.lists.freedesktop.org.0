Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 438EE582968
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 17:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E719F18A413;
	Wed, 27 Jul 2022 15:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC40A93C28;
 Wed, 27 Jul 2022 15:15:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5Ry9zJ3csw3eqK7H4B7bzQ+IKLQdsNdUslJCHCYkR6MbDjLyWbq6866r1taPbzAoTU6UHGAQCa5zyj3cu7Nj0oTjQcqz+EoABgud5zmykbpGaFPsf9RUcK0LfHvLD652AqHQVX5GN/SMTbK62lQ4B16tgaFSnXnpUhP7K4An2hGK4uN2G9eiyPVp/RwHBaLPMcbTiWxLE2Ph8bdSbIqaK7oSK9fIQ7LGNqqYCUZ/B91FlyrZLqBJiKoodkXdxXmcWY3TyCtvvm1lJG+ncAXYxrG4S6EfIYM52Jk3nE0PBLYX3HU+xEmhlYx0xC+2GlFLBQlnjFsKn6jefqNT9Px2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/NuTHojEuelbf6XTENMKI8DJF7F/2DrSH7wnyREkO4=;
 b=llkD1LJW11zb6NXBVjsb0iWMv3NM2+YEw8zPlvRh1KlXLX0t0/lEeI5XeizpVIX+NuZUu6OqxdDp2Y61nBK/0jpE0OBJ/mHQiWDOrPMcqt9AI+5UJvBEmBtCYgHXwVN28e9/O3hJEDgDz1Sn/cuF4AP9To8NyAoHGDHKR2XxJ7RBuIJjV8Ecle55h8V3KeYqzDt8xeqpK3iCbtNE6Qkl/Bi1x+l+hWU3kOKjUWoqkRdF1ZmbT+NViiuNh+Og9pc2phNqll1n8Sil5XZH0yeaReUKncomJzkI02bp9jpvm6sx2WZbXJqtEkBNqLdM7Z7i5tuVAyE4Boare3jVNDolTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/NuTHojEuelbf6XTENMKI8DJF7F/2DrSH7wnyREkO4=;
 b=JV9ZBmZQgjjvw7Fbkrl7aPxcjJDkUaqp9QWUy0P7b1VXk/GpjP6rgcebz/+C4Zzl0MrIE0YKCLHHFlkiQYmokIMOzVthKPAkHBcYyrxS7gmSk8d27Kh91X/3mBRAZhP6whH1VBfeo3NRfltG8FiFQVItNPDv/DCBKoK4AvErg50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by MWHPR12MB1247.namprd12.prod.outlook.com (2603:10b6:300:10::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 15:15:55 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::6d50:f6c5:cea4:1d95]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::6d50:f6c5:cea4:1d95%7]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 15:15:55 +0000
Message-ID: <1031eddb-4cfa-e94a-e77e-03aa3cb8b680@amd.com>
Date: Wed, 27 Jul 2022 20:50:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amdgpu: fix i2s_pdata out of bound array access
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20220727144249.415228-1-Vijendar.Mukunda@amd.com>
 <CADnq5_PKjmNw+bAPCyDu_G=yNQcpJSpFd+EVzNwfNWzig8apFw@mail.gmail.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <CADnq5_PKjmNw+bAPCyDu_G=yNQcpJSpFd+EVzNwfNWzig8apFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::10) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e89f591-0d07-4f00-9574-08da6fe2e6a5
X-MS-TrafficTypeDiagnostic: MWHPR12MB1247:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: It9P2kacAdizA5JZEuRmWmyTLFnMZuNqCsmslynbIfLOa/Zbu7PDQLBXpELWTt2A1gZTiOzm1KRCQFseVtDLA50zFgrVbTmi/Ochu2OSM+lwaEvxeFAghpU/AFOwLbRe1VYfAB6+IPXydV6sW9esQYRTGueWxb0pBY7WAgsWTw7oKSr6uH+c8R4KkpiCBDZPAo6PEK22G5h+hRH4mxEkvno6dP2YU57Sk4U0Bw9wcRy+5cs0pcna51Suu+S6+mrJcYnsZ2B8CvO4t6i0Kx5dPQuFFMZvPrm8e9COY9e9kTysdMdsZ1VqiE21Cwbqna1g9qmQe//NTcxxkeo7MLcA0b/1o6PEBzz7tMn7qvcyF/uaDjtMp3sGsXN2gsxIBZPKv1V6cv2EF9YjFlrJmQso2F78wQJ3Q/utxNp09/ssWopLGnc+2bqarAvJqtJCY9zMoxsiAYBYNLqGUPcniIFFLjwefUVuKYE8BeANAeClVfnLQuzG8xTjHa5zPpOJ4bhm/KCRZX+lToCKWr9YmfgxqDMSskZ47w8O7htceJbr8vhuoaOomb4LOMiusDo+5HUiSmg4E8YpwUsgiGKsY5oRW0e0tsirl+HOkO8wxILrGtFzHT6yBFXFziC3wFfVTzf0l6405D18Dp18nuhcnxo12phsJue75T5MQ69E8qq0yVGu3ixgkNk8RoQ0OH1kfjtcKpUUuaqbZsw3PU39kU7k7euywLgz3dlW6QIBSb4qO5xSgGk+4M9pC9nVF7lFfEx/Lm9aZ2BQFey6IB/tb/3BdfEo6q5Xja+5BzkFZc/NrYWXlZ1uP95gXFEdkTlZzohCzAPd7+GU7OBLY/RqvlyRsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4123.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(66946007)(31686004)(316002)(36756003)(83380400001)(38100700002)(6916009)(186003)(54906003)(53546011)(6506007)(4326008)(2906002)(8676002)(31696002)(66476007)(6666004)(41300700001)(6486002)(8936002)(478600001)(66556008)(26005)(2616005)(6512007)(5660300002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGIwWTF0Y0t0U0l6ZzdvSTIvWUJOMnVjMW0vclZ3RjBnM3hPd0xQbEVNdnZa?=
 =?utf-8?B?Wi9lUGdBTzZmeVM0QUVCVER2UFdlM20vK1dlM3pSQlhkS3hLOXpucG80UzJU?=
 =?utf-8?B?RkwzeUN5a2EvbXFXdy9uZTlXTGVIOGlzMVF3SGhvem9uaEZ4aTc2ZWNnZlNv?=
 =?utf-8?B?Qjh1cnFSbnRrUEQwcXRxTHZOQ0RmVE9NMEVRWjR0Nit3SFJxbmJCS2hSZ1Fx?=
 =?utf-8?B?aUd6Z1JIbFRvcVhDOTNGZzZ6T0hLZ04wcERGVnZlcTNrRHpGSmM4cGdrWXAx?=
 =?utf-8?B?OVJad2c5VlZJVHdTVjdWSngxVHphOFdBQzNjZkpXaWp2a1RrdFhPV3JFU29C?=
 =?utf-8?B?Y1NHT3VHNU9VUzdNOHJhK2RYSXVRQlB0c0NMSHRBWHkwYlNrQU5NU0hmRWl1?=
 =?utf-8?B?NlNrcGF1K09OdXQzWGsremgxK0xFRmlTZjM3MDN0VmRFZ1pjMmNmUE4ySld6?=
 =?utf-8?B?UVl4bVVNeWd5eENuMENrYWhTZHR6ZG9yTlVxeXFYUU12K0xsWnJwcjVwcUFx?=
 =?utf-8?B?cFlIUXVkVWZad2VCVExpd3VYaG5CUzlXOTJxQXljQXhCUG13S2RXQzZ5ZXpE?=
 =?utf-8?B?d20zeWViY0VuNW5hc1JiSWswTFJadmZmTlZtS0VUaXdMVXlxZllvLzFWM3hP?=
 =?utf-8?B?OEFXdjFHUi9nbm1Lc056OVJRZlZqVk1kMXd1aGsrdVNHRE9ETUVkbVZ6S2dO?=
 =?utf-8?B?WVFwZUZPSkRUU0RldWladjNOWkY4YjBCS2lXY09rYlMrYVMvM1hmR25WSzlr?=
 =?utf-8?B?Y25UT1RDV0c4dG1UTXV0SytleVl1akZaTU5JdnFqdHhodW5hMGtKaXordDVP?=
 =?utf-8?B?STg0V3FxL3JnSUFnbTFRczN5dTNwelk5K0w4dEhhTlMvOWkxaUpObE1rSllB?=
 =?utf-8?B?OXVvZUpMNjRPNnFISkNsUzJoTEg5OFRoVE5BbGRVclU1elVWdGUvQ3VGSTZ2?=
 =?utf-8?B?dndKQm1tazVHUFB5VzdMMFh6TVlONUU4eTRhVlYrRG1jZm4vUE4rMHlqc2k1?=
 =?utf-8?B?SFNxOVVtZ0VsZHArTzBOOG50Uy9NVFJyN2xJV1FsUElNcUVMdTY5bjM4N3lv?=
 =?utf-8?B?clBwYVByclJBR0tDK0dxME02d2xmOEMrTktwY1A5ajgyeEZiTTcvMVNFZGtU?=
 =?utf-8?B?TWFJa083UndUTEFJbEFWSmpLU3BEcGJBeDJhYThYcURlN0pQWEhFMEVtN3M4?=
 =?utf-8?B?bHZjL0tJcHFXMXhka0EwUFl5N0VhZ1RvUldhRGozK0g4ZmxUa0dHbGdma2dF?=
 =?utf-8?B?NWVWRXRPTCt4NTAzNGVraFBjL2IrV1JGOHJSUldjbXcwK1NDaWlPK0RpL0lr?=
 =?utf-8?B?aDlBZHcvU2RwbWZyaHJYYzBTSkRZdm1VSTVveko0QTJ4WllXOEVRbUhhZmtX?=
 =?utf-8?B?cWNNbUZmRjltMXdSeUh6WFZvYi9nd0xTWHNTVHd5aDRiN2Jxc2RvbXdYK3lR?=
 =?utf-8?B?YTFVaWhUQUZ1bE41MFI2UmpZNm1GbnM1eVZ5VW1aWFREY2M2ZUR3VlNBU1ll?=
 =?utf-8?B?MG9LcGdhU2xyYmdYVytjOC9HVkxLRk5VbVUrMVZWK2VxckNqcTRBNElOSWc3?=
 =?utf-8?B?S2pCd0trNlEwa3FqTkRvbjVKdktGM052K0V3cmIvMDNFN0JXVEhQS0tZUE9x?=
 =?utf-8?B?Wm1lQTJLMGJjV2VEd2ZTZFF0MzM0UUF5M09IMU5sbDN0NjRxTEx0K1JpM2U2?=
 =?utf-8?B?M1J6U3I1V0ZaQTlyNWc5bVJPNmlYd0c5K2xBb3grMWEwK2luYUE0SEtaeUFj?=
 =?utf-8?B?Y09wTDBDTzYxUGZWVGZXOVNHbmNENXpjMWpYamJwODVjZDJ5dFdZazJQN0ZY?=
 =?utf-8?B?azhoL25KTGYwTDV4empBUC9Zd012RlU4MTRFbFRxN1ZxS1E2R2w0aUxtMENo?=
 =?utf-8?B?VE1TYXhjMzRHZVBwWEhQNXEwblloL2RBNGhPbThIbnJWYWYzbEI5eTJjWmJI?=
 =?utf-8?B?VzJTVlFZVHB1Q2d0eTVmdE1NbXpUUnF2YmRpVExDeHJGZ1VWVXgxZHlXNmsy?=
 =?utf-8?B?bGIvN3ZKSEJLekNJWDZZc1VZbS9oRXpzdm10N2JqK2hYaEZYNEMxOGpYNlgr?=
 =?utf-8?B?SW9aK2RySlpnSEViZ1dDTWU5aERZaXRTUW5McnhvQlViK3Z1eG8vR2FQazZW?=
 =?utf-8?Q?DZxxUoNH6suaULPPjgLjtT6UO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e89f591-0d07-4f00-9574-08da6fe2e6a5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 15:15:55.2999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KdPDrUreB8XIeGUguySN6m4SU6uy7nLwbXMWazCEdygq4GhLHdZuTTbESGLH0lo973yABspJ7XVC3Jx+1i+lKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1247
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
Cc: Sunil-kumar.Dommati@amd.com, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/27/22 8:25 PM, Alex Deucher wrote:
> On Wed, Jul 27, 2022 at 10:42 AM Vijendar Mukunda
> <Vijendar.Mukunda@amd.com> wrote:
>>
>> Fixed following Smatch static checker warning:
>>
>>     drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:393 acp_hw_init()
>>     error: buffer overflow 'i2s_pdata' 3 <= 3
>>     drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:396 acp_hw_init()
>>     error: buffer overflow 'i2s_pdata' 3 <= 3
>>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 8 --------
>>  1 file changed, 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
>> index bcc7ee02e0fc..6d72355ac492 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
>> @@ -390,14 +390,6 @@ static int acp_hw_init(void *handle)
>>                 i2s_pdata[2].i2s_reg_comp1 = ACP_BT_COMP1_REG_OFFSET;
>>                 i2s_pdata[2].i2s_reg_comp2 = ACP_BT_COMP2_REG_OFFSET;
>>
>> -               i2s_pdata[3].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET;
>> -               switch (adev->asic_type) {
>> -               case CHIP_STONEY:
>> -                       i2s_pdata[3].quirks |= DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
>> -                       break;
>> -               default:
>> -                       break;
>> -               }
> 
> Is this actually not used or should we just increase the allocation size?
> 
> Alex
it's my bad. i2s_pdata array size is 3. when we recently included code
changes for JD platform , this piece of code was added mistakenly for
Stoney platform switch case.

--
Vijendar

> 
>>                 adev->acp.acp_res[0].name = "acp2x_dma";
>>                 adev->acp.acp_res[0].flags = IORESOURCE_MEM;
>>                 adev->acp.acp_res[0].start = acp_base;
>> --
>> 2.25.1
>>

