Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A76572726
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 22:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4499466E;
	Tue, 12 Jul 2022 20:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177E193D8A;
 Tue, 12 Jul 2022 20:24:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEBtQEwm5RCEadI17DJgw+VVBd5eeGDfnazsmU5wlbz/F7l4POV141nqALyatD46fBbZLHfRwvQCeiSN3sWLdBYhO6Ux5il6NwwL8W+e+hBKpEndqTcsRANrNPRDu9wi8HD3raZp9b9Ql+MQpkEbkhhEjMejfhe6lhAoYY0Ojw+/bl6Q3LmffCHjx7+Q5rZSGGFbDBtAiXeOZQ9S4E37X7gC47tJdp0+EneikMD5OUs8EHjSYkLJ5oV5QsBnJ2Fkr2PeYMI0Hd5FteZeOmJaWE6vZQc8FaLHvvs40fPCA1xnMdYeYhtOKleLrMruYwtia/VtCV2L9Xcuut18eqHU9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vdUJKSNSf8FHUMQKqLFkfrpOBRDPRSv/p88knp60HQ=;
 b=Huq5BgeYbjez9RrluiCgszrBMMPnV7g89UgUshpusNmf5UFnn7hD+CIpTtVByny6ci9hhG30XkqI9dNVdjdwfN4oLahVJVFv1DbrH1MvnpYtar+iV1AfXSOIVasMo/l6aA3OqJUUL7vkl+wP0aAB5cLwFHgNomaKPGmUx0e/YjTZvpgsSapjfKjk42MAodG0X546cmfciVY16xOY8sKWlEMLh66uxd8Y7EfDm8Xmhc7oyT3tZ3R/4bqCJHmoBFJHvpL62SNjjBQKzjxvLd97kIwlo2OgR5GOEehOuyK2JwD9P2/vDUylqd/FiGVmVD8O0Vv/LzTzKdGev1jfBVh31A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vdUJKSNSf8FHUMQKqLFkfrpOBRDPRSv/p88knp60HQ=;
 b=gf4n4/458AmG0EZAsNLCkMCh0pGmguCa+IN0iwpuDNijzvi7SxckszblivWnQYMIMp0wRQVioBy+Iwh/5ooiJrn94dr7ofXUoi8xUc4BQQEn6ZW7kZH+w4vBKtMt/JGircpqe1Rm9XOG+1SwHKeuRg1jzCzL/+vPlOfVgKb7yY2hPjEjyEVMb2iuM3TnLTtquNMUc1viRZk4sSlg4M6kEck47D0eNWss7aee86Vu5P9nzW3GMzyHGe+LRGhqRzAHREI6p5OeqxSq54WAzBBDiJkI0z2Z2/3XUSg/BexmrtJuVyBRdB3qg1DWaML9x9ZX/eEmH9bpGEt3rQcme981bA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 DM6PR12MB3305.namprd12.prod.outlook.com (2603:10b6:5:189::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.18; Tue, 12 Jul 2022 20:24:21 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::d043:c95a:cf42:cff4]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::d043:c95a:cf42:cff4%7]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 20:24:21 +0000
Message-ID: <2c4fafb0-e47f-d640-0fc9-4530a8d462e0@nvidia.com>
Date: Tue, 12 Jul 2022 15:24:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 20/29] platform/x86: acer-wmi: Move backlight DMI
 quirks to acpi/video_detect.c
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui <Xinhui.Pan@amd.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@kernel.org>
References: <20220712193910.439171-1-hdegoede@redhat.com>
 <20220712193910.439171-21-hdegoede@redhat.com>
From: Daniel Dadap <ddadap@nvidia.com>
In-Reply-To: <20220712193910.439171-21-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0161.namprd04.prod.outlook.com
 (2603:10b6:806:125::16) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 787066bf-850a-4114-8480-08da644480de
X-MS-TrafficTypeDiagnostic: DM6PR12MB3305:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yk1HMnVTam9icVkrZUFkYlZTeEcrYjZDVHJpelJrRFdYR2ZwZnNpRVBNd1lM?=
 =?utf-8?B?VjdrRExyYkErU3hCYS84R2FnMC9laThRVWdQcjZkRmJ0ZklMaUhKMTFTa0I0?=
 =?utf-8?B?QUg0VlFmR2tZemlkdVB3QUZISUNwOXBqcGJ2K0NkVFhIRFlLU0N6SUpBd0Y3?=
 =?utf-8?B?VE92elptVlNTcjU4aE5tTEFVMzRNMUN3QnRmRy8zRjZ6MDU2Qlkya3hBMnU5?=
 =?utf-8?B?dkF1N0V1Ny9vQmtJSHI4Mi8xUS9DMTBoM0VndDRLTTNLYVhtWEtNbStJWVpR?=
 =?utf-8?B?clJvZUMrdnVNREQ4Um13ZWRoc0JIaDNoVHQ1UnJXc0FBYTFmWUt2RHREZUgy?=
 =?utf-8?B?bWdFMHlUTENtVU5jaDR6OEJoMEgydTM1R0RCblRabHZ2QjgrRER5SXlYZ2FG?=
 =?utf-8?B?UDRtSEp5cm0rUWFkSmQxWk13Z1FxNGFxeUx1QndnOWlxZUVlbi9FZXdRUkp3?=
 =?utf-8?B?YUVkYnNncnl3aUlBK0UyMXFudXJjR0oxeWhaMHR5bGdTOGNUU0FpUkNFS1dq?=
 =?utf-8?B?c1BXYlFtemlQSGFaQmw4Z09lTGs5U0pKSGM3SWNPMmc4WFpZV2tHTithTXMx?=
 =?utf-8?B?c21xL3pJYmh2K3NkblE5dmJaNEtac0pTdzQrRnZFZ1ZPcGxyQzB5Vi9zbUQr?=
 =?utf-8?B?WGxNNE5tZ0kybzliMnJ6QzBFaFBMb2UzWmkxbm03dTliSWtKbkRZclh2OEM2?=
 =?utf-8?B?eXp5d1d1YXFhQ3VhOWhUN1g0Mnh2RDdMZHBQbDMrbDZxNGs5MVlmVEFxZEY2?=
 =?utf-8?B?L2lXaWxSSFhHZ2g4bXpuTk11UXFMZ0FRVGIxUnZyR0x6Sy9FaWlEVDQzUzFk?=
 =?utf-8?B?ZlU4N1gvOTg5Y2JkUVRsTlUwLzFCUEdBZ3BpVTg1aUVjdGRDelFjWktrb1lL?=
 =?utf-8?B?MzhDNmZUUDlNN21YY05TT0lJYnYyUlRNcTNZUmQxbXA5T0ZXMytmUWFSS2xi?=
 =?utf-8?B?SFF6Qk4wbnpuY1VmbmlYMTB2SzNYV1J0cTNRQWlNUmFwYWthS3luUU9xVlh6?=
 =?utf-8?B?Z3lvbkpnemJZUmJ6MWc2aHNkL1laOXEycTZ6dVBpdmExRzJuOU56VHB5aEVz?=
 =?utf-8?B?cEVYV25SWU9XYkU3TVpWc1AyNXlwQ3RZQ2l1Rk1kVXhXZWE5NHpBd25DNktx?=
 =?utf-8?B?MTdRemZhNG96Y2ZZdjVpUUxUbUx4NHVKRUhMb1plUUdjMW40b3FHUEdjOFRx?=
 =?utf-8?B?M1kzTG0xSzJUMVFoQlRjNEdNejc3VlpTc3hiejBJLzN3WXIzL2NPVkFYejlE?=
 =?utf-8?B?Zm9oZzhsSXVnNStGcFB3TE83dnhuQ2tzQVRFWE5XR3pRdXJZcTBkM2NVSk1m?=
 =?utf-8?Q?hdr1ghOu1SdIk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2763.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(6486002)(186003)(6666004)(54906003)(316002)(2616005)(6506007)(4326008)(6512007)(66556008)(966005)(478600001)(26005)(38100700002)(36756003)(66476007)(2906002)(53546011)(66946007)(8936002)(41300700001)(5660300002)(31696002)(921005)(83380400001)(7416002)(86362001)(110136005)(8676002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djlNN1JFamJhT3l5L3ZwV294ZmhzNkVoc3hrSEZTM3FaT0NleWhVOFFHWFpj?=
 =?utf-8?B?c2w4YnJqd2lBenRMZ016QUlIWUNra1hjQXBzVVplWGREY0t2RlNDSVNGeG4x?=
 =?utf-8?B?ZnRCSUk3bEtLK2QyR2JuLzZmRHZMdjJTVXpQT1hvcnlOL0tnODNxRzJsMFVK?=
 =?utf-8?B?NHZ1STBEM0JzUVJsbFRhZ2FrbmtDb3l6VFoxMmxCUlVEVDREQUN6V2pVTXVs?=
 =?utf-8?B?N3lBeGpyU1UxQ051NkxDdUNNLy95aWJLSzdnQ2JVL3FQb1FoNVk0WExJUmRK?=
 =?utf-8?B?aUk1VnFPWjdMQkQ0RmVpWGJrMFc5WjdoSUlxaUg4YjB6UFlNQkQ1OENENHNn?=
 =?utf-8?B?VWwwdEhzL0x3d3VqVkEwQTFzd3lWeTQzQlFLZVkyaURrdGlrOXpnYTBSK3dz?=
 =?utf-8?B?Q2J2dERPbWZrWnpUWEZFWWQ0OEdWSEphVU5zVXdFYVdZdUNuZit6T2U5SHhJ?=
 =?utf-8?B?OFhEOUJDZmxXZWVOZTBJWHlHMW83bm1jM1VVRElpcUpGV2dWRlFScGR0QlFC?=
 =?utf-8?B?WktOVXFQcm9ON1VyM0FPK3Y2TThtR0RnUkh2UXNjOU9neDRBZ3ZIRzV0NW10?=
 =?utf-8?B?NmY3OW54Mm4rRmJUUmwxODlCaFpja29ROTFiS2ZUYlp2bG1wbGU4ZWYvL2hL?=
 =?utf-8?B?NjFkdzF0anptaW9vK3B0QXoxamdpV0RZZks2UEhkdUNZelVLcWhMaUlSMFA0?=
 =?utf-8?B?RWVVSEs4SjNmRmNHOE5HOXZTbFNiUmdGSldDMHRUTVVzcW9Id2xBcDVaMjZa?=
 =?utf-8?B?ZklRbW5yVjZHNTROTlRWS25Pdis0RVdXVFlyWEF3SjZHYVZrdXNQVHQwNDZV?=
 =?utf-8?B?dHMyc3BTWVlmam5PWW5NUnZvMk5XbmpKcVFIdHBJaGJHKytmUm9RTFhNbHhY?=
 =?utf-8?B?NTh3dGpXRDBVT1JWajZXenZ2ZFR1REQrZ0FUczR6K2l2MThxcTZPS2tDa0p2?=
 =?utf-8?B?enU2dTFtRDJuRWMvd2pXcGgxbDBjZzZaL3JBVjZ3MDVHdWFsNnZwZWwrYU9V?=
 =?utf-8?B?d1YxTnB4a3IwUlQ4aHF4WXR5OFF5dUwwK1BqNnJNT2JtMGRna1dUR1NaNy91?=
 =?utf-8?B?VmRaTUp5Y1c1TGY4R3FaMU51bTl0aVhJeUdFSlNlQnFYQW5RRHFxUnpPN0RQ?=
 =?utf-8?B?NjlHSUtMbW1VRDVVRkl6bmI5TXUzaUxRek9oSnM5Q3kzRm1KZFBjTjUrWndE?=
 =?utf-8?B?bWM2OTg5eVVqcVR3WFI0dGxGUmtRVGV0MkZBNm1hMlM5c1psNk5IVGZ6NXEv?=
 =?utf-8?B?cjNlNW1vUHN4eURxV3RtdGc1ZHp1SnNvN05tRDNZL2ZWeDlrTVlwc2QyUWRT?=
 =?utf-8?B?Z0N2Qjk5WlN2bnhTdXk3dVBPMkkzMGJMT1ZXekswMXVibE1FNWZmbWNyTjJV?=
 =?utf-8?B?MkNzd0RsNzNzTGx6UUxEOEE5MUxXTGM1QXhSQnJ3UVpjSHQ4bGg4ZGJSK1Zw?=
 =?utf-8?B?MElnMEFtZW9ObEpyQUowTjNpNnp0YXUyR1RYRTFPVTFGQzBQL1cyNWkxbjNh?=
 =?utf-8?B?a0NQVER4eXJ5SW9URnpYWE8rdFZKVmRIYnlxcStUMmk1aE5yMmtZUC9yd3BC?=
 =?utf-8?B?UnhOZExVTFZUV3QyV3pBR0RYRkdTQ3d5amtpcDhVc3lRYmk4OUtFQ29hL3Vx?=
 =?utf-8?B?SXFNUjZuSDdnWkJsQXNibWdBL2xHMytLejYzVjNUNUh2REZuYXQwTmYySjlJ?=
 =?utf-8?B?QUNHSEVhdTFXT2JJOWdoL0JMNEVVc0QxRjRTZTRZaDc3V3EydklhMDFEZzdO?=
 =?utf-8?B?Tm5tdWtQc1BsUWd6TXZFYTB1dCtsM1hacHFCcHZGcmJISkdqUjZ4QjNsYVNV?=
 =?utf-8?B?empNZ3hQTzZpYlNqbFhBS0pIMXV1SG5ROHd2aUVRRkpYWStMQ0svbWduS08x?=
 =?utf-8?B?cis2cmlRTk9MbGpWa3BEZjA5ZHhFZ2ZlS3pLdm1DVGZFTm5zYWVYNHBvRlBn?=
 =?utf-8?B?MzBqOGcwUTc2WnRZTGo3REJmV2JOaGZ2RlRkWHRxODdVQllQNWcwN2U1WmFW?=
 =?utf-8?B?YXYxcjcway9aRTN4VWlhVU9TN21RNmYySFlZS25EcjlhbnBxZW0xWmZMTVVz?=
 =?utf-8?B?bTR2UnNhTFdJTVRHQVRrV1dxQU14VHdUNERTUFBEYzdxdkU1M2d6T0Q4cUhx?=
 =?utf-8?Q?sJheI5/KJaOkjKeH+g5vIgPAh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 787066bf-850a-4114-8480-08da644480de
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 20:24:21.0529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqK6C/WqZvg2hjKICm4c8lZ5J6Y0IqNBoMqz0zPhePs6Lsr1olxDb0dxzXLDO00LpSLhQxPaeg5SJHQT7SnEFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3305
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'll ask around to see if there's some DMI property we can match in 
order to detect whether a system is expected to use the EC backlight 
driver: if so, maybe we can avoid the WMI interactions in patch 16/29 of 
this series. Although I suppose even if there were a DMI property, we'd 
still need to call the WMI-wrapped ACPI method to check whether the 
system is currently configured to drive the backlight through the EC, 
unless the system somehow exports a different DMI table depending on the 
current backlight control configuration, which I imagine to be unlikely.

This change looks fine to me, although I suppose somebody who maintains 
the acer-wmi driver should comment. The bugzilla links are a nice touch.

On 7/12/22 14:39, Hans de Goede wrote:
> Move the backlight DMI quirks to acpi/video_detect.c, so that
> the driver no longer needs to call acpi_video_set_dmi_backlight_type().
>
> acpi_video_set_dmi_backlight_type() is troublesome because it may end up
> getting called after other backlight drivers have already called
> acpi_video_get_backlight_type() resulting in the other drivers
> already being registered even though they should not.
>
> Note that even though the DMI quirk table name was video_vendor_dmi_table,
> 5/6 quirks were actually quirks to use the GPU native backlight.
>
> These 5 quirks also had a callback in their dmi_system_id entry which
> disabled the acer-wmi vendor driver; and any DMI match resulted in:
>
> 	acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
>
> which disabled the acpi_video driver, so only the native driver was left.
> The new entries for these 5/6 devices correctly marks these as needing
> the native backlight driver.
>
> Also note that other changes in this series change the native backlight
> drivers to no longer unconditionally register their backlight. Instead
> these drivers now do this check:
>
> 	if (acpi_video_get_backlight_type(false) != acpi_backlight_native)
> 		return 0; /* bail */
>
> which without this patch would have broken these 5/6 "special" quirks.
>
> Since I had to look at all the commits adding the quirks anyways, to make
> sure that I understood the code correctly, I've also added links to
> the various original bugzillas for these quirks to the new entries.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/acpi/video_detect.c     | 53 ++++++++++++++++++++++++++
>   drivers/platform/x86/acer-wmi.c | 66 ---------------------------------
>   2 files changed, 53 insertions(+), 66 deletions(-)
>
> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
> index a514adaec14d..cd51cb0d7821 100644
> --- a/drivers/acpi/video_detect.c
> +++ b/drivers/acpi/video_detect.c
> @@ -147,6 +147,15 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
>   		DMI_MATCH(DMI_BOARD_NAME, "X360"),
>   		},
>   	},
> +	{
> +	 /* https://bugzilla.redhat.com/show_bug.cgi?id=1128309 */
> +	 .callback = video_detect_force_vendor,
> +	 /* Acer KAV80 */
> +	 .matches = {
> +		DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +		DMI_MATCH(DMI_PRODUCT_NAME, "KAV80"),
> +		},
> +	},
>   	{
>   	.callback = video_detect_force_vendor,
>   	/* Asus UL30VT */
> @@ -427,6 +436,41 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
>   		DMI_MATCH(DMI_BOARD_NAME, "JV50"),
>   		},
>   	},
> +	{
> +	 /* https://bugzilla.redhat.com/show_bug.cgi?id=1012674 */
> +	 .callback = video_detect_force_native,
> +	 /* Acer Aspire 5741 */
> +	 .matches = {
> +		DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
> +		DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5741"),
> +		},
> +	},
> +	{
> +	 /* https://bugzilla.kernel.org/show_bug.cgi?id=42993 */
> +	 .callback = video_detect_force_native,
> +	 /* Acer Aspire 5750 */
> +	 .matches = {
> +		DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
> +		DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5750"),
> +		},
> +	},
> +	{
> +	 /* https://bugzilla.kernel.org/show_bug.cgi?id=42833 */
> +	 .callback = video_detect_force_native,
> +	 /* Acer Extensa 5235 */
> +	 .matches = {
> +		DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
> +		DMI_MATCH(DMI_PRODUCT_NAME, "Extensa 5235"),
> +		},
> +	},
> +	{
> +	 .callback = video_detect_force_native,
> +	 /* Acer TravelMate 4750 */
> +	 .matches = {
> +		DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
> +		DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 4750"),
> +		},
> +	},
>   	{
>   	 /* https://bugzilla.kernel.org/show_bug.cgi?id=207835 */
>   	 .callback = video_detect_force_native,
> @@ -437,6 +481,15 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
>   		DMI_MATCH(DMI_BOARD_NAME, "BA51_MV"),
>   		},
>   	},
> +	{
> +	 /* https://bugzilla.kernel.org/show_bug.cgi?id=36322 */
> +	 .callback = video_detect_force_native,
> +	 /* Acer TravelMate 5760 */
> +	 .matches = {
> +		DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
> +		DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 5760"),
> +		},
> +	},
>   	{
>   	.callback = video_detect_force_native,
>   	/* ASUSTeK COMPUTER INC. GA401 */
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 9c6943e401a6..c08eeb1e0e05 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -643,69 +643,6 @@ static const struct dmi_system_id non_acer_quirks[] __initconst = {
>   	{}
>   };
>   
> -static int __init
> -video_set_backlight_video_vendor(const struct dmi_system_id *d)
> -{
> -	interface->capability &= ~ACER_CAP_BRIGHTNESS;
> -	pr_info("Brightness must be controlled by generic video driver\n");
> -	return 0;
> -}
> -
> -static const struct dmi_system_id video_vendor_dmi_table[] __initconst = {
> -	{
> -		.callback = video_set_backlight_video_vendor,
> -		.ident = "Acer TravelMate 4750",
> -		.matches = {
> -			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 4750"),
> -		},
> -	},
> -	{
> -		.callback = video_set_backlight_video_vendor,
> -		.ident = "Acer Extensa 5235",
> -		.matches = {
> -			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Extensa 5235"),
> -		},
> -	},
> -	{
> -		.callback = video_set_backlight_video_vendor,
> -		.ident = "Acer TravelMate 5760",
> -		.matches = {
> -			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 5760"),
> -		},
> -	},
> -	{
> -		.callback = video_set_backlight_video_vendor,
> -		.ident = "Acer Aspire 5750",
> -		.matches = {
> -			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5750"),
> -		},
> -	},
> -	{
> -		.callback = video_set_backlight_video_vendor,
> -		.ident = "Acer Aspire 5741",
> -		.matches = {
> -			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5741"),
> -		},
> -	},
> -	{
> -		/*
> -		 * Note no video_set_backlight_video_vendor, we must use the
> -		 * acer interface, as there is no native backlight interface.
> -		 */
> -		.ident = "Acer KAV80",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "KAV80"),
> -		},
> -	},
> -	{}
> -};
> -
>   /* Find which quirks are needed for a particular vendor/ model pair */
>   static void __init find_quirks(void)
>   {
> @@ -2482,9 +2419,6 @@ static int __init acer_wmi_init(void)
>   
>   	set_quirks();
>   
> -	if (dmi_check_system(video_vendor_dmi_table))
> -		acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
> -
>   	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
>   		interface->capability &= ~ACER_CAP_BRIGHTNESS;
>   
