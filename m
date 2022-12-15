Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E83764D7DB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 09:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C1D10E4F2;
	Thu, 15 Dec 2022 08:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2113.outbound.protection.outlook.com [40.107.8.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B44E10E4F2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 08:37:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uhkbuf/Krk/+pm5IffHbIFAECpoyi51WCzb+LrUhOhEEUHAPccKVdwWzcU0RPQ1eGuBisJ3dstYUB+unGfbVio8vBYyq6Y1eLKH1n2OKhHzZc8yNF6YmHL88uZSt/DA/kDbEcmh5Uz4AFt9uZF6DB8KPX+6dQIlK3PsEuvFxH0PVR3d5DlEi4GYxssPqIg1En52Sj2MwveYhRZMiSIlcJd/6RU/L65SVBQU6/g21vyne5eOE4KxmaLBoc4GNWSW2qCzBu7I1C7+ffY19vDNQU9TwHCek6XvbtZYzhj0UAugtKGtmbSQUrbUh3G9jr7EkJ/aJwYYlRyhysk5eQKkTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hL7UPoXc+FGRCRf1e2Kq9c8g9NM5c9eZptPcLV0t5DU=;
 b=i91WfsOBMy8rWuuZGmHlmmx4X0HEqfzlcGSvNPVuC9pWtTK5zcVcsVWU2ZZwsE+QNTOfc/dqtxgO9+vUDT0w3QhYFQRnvKmOfbXP7DbyOMCAnKWVn7MmVjXVdNM6010A79BlUzGo2z0W9hZC4BJhN+vRjIAn+5lZojtXIAEeRkjYHTE/17eOGbezHWfGLWflIaPztEMf3ARLybXE7DOWef/4itLQ0VoHPsG2YL0vgDGxP0i6POviVY3ymmINL8lAJegbU0vzKHKMJdtXgiVRHEeog3OcmMyvbRpBisR8wt+dayXKNiDbcV+3ojB2Vxv31REQicdH8gc4+kCScyEAZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hL7UPoXc+FGRCRf1e2Kq9c8g9NM5c9eZptPcLV0t5DU=;
 b=k9b8AWIq5D9ZYsC7PaRH4tdiZLFj0FzUpNMjBAgyzbLVUDx1tgMABEfYVssIdm7SHSbSLjIYKqgLvSpWwOhmu9U6DnJCY2fZdXfcrPpCB7K6d0600FfNbCaPQ8akoHo2LqXP4VLlwb9IEwbQVBvY/Gmp3GZEELymosI/0RueWR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by PAVPR10MB6913.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:30e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Thu, 15 Dec
 2022 08:37:52 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 08:37:52 +0000
Message-ID: <b8cd1a69-1b4a-5e46-3823-28c82cc2c6a3@kontron.de>
Date: Thu, 15 Dec 2022 09:37:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 08/18] drm: exynos: dsi: Handle proper host
 initialization
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Fancy Fang <chen.fang@nxp.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <20221214125907.376148-9-jagan@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221214125907.376148-9-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::23) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|PAVPR10MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c28d1e5-754b-4abd-7444-08dade77a7cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: suXwxYHl4H1996Dmnt/dJYykMz9QGKkht26F9nrW8lmfTAIpFzcQS7yDCUS32hIYFbZWtD3HVbLGipIcz5cU7NkHmxajfqNDy+1lYPyKFxVGrDty3d/afHp5/COvhsTKiffRjTRViFhmZ/zBXJ0f5iwMwSHGmXPh4STb78aZIsGlwQr1koVqUZVS+pN0wZGBhJZKhYOx19rk7767bBcNwGT02jCDbL+WNEhNYpYDIcu7gn9tgURzrZf9lva7XWEYVue+mc0mV8Yiz38oGLpS9pK/Gz20SUynFwolqvczPAbWtui4DGDT1vRC+K4DcyheH0R4fCzTCn3NnhtQ2XSZFh2hmGj+3ER8X4S2PVQAaH1DoDPKPlafk0E1S0xl9ECdzVQRICEvW1DbyWCg89dYO4y4Z4mBCqYy1zw4FCSfts6OlV/usBFU5pr/OYL4eBowep+XLUzpgJT0u46PZ4AWCcHjuhFdELF/tsUCan7d+UiY3TYGSOAz+gAbr7ZolvkjeafnSfjVh8fKnsJNxq9qWoqao+fMHdpPbAJrazikANtRGoyYUwcw7lLI7bfcX176USj4e/cPiCjILY36IiTy4bkLJRkX+tEXJ5mmt3xHnMXkHVtBDkRXJ698R9O76SfqDzRoJthahS6aN8hCDbiTww8/e5f15uG2IG646BBeEiA5Kd6YoV8XwbAYx8bcSvp/NpLHIxytWjQ7QxrJoE6X/BpVJP7sKBekIBu4gmNclGlC39Ql5BNYmIhLcz4pI7TM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199015)(31696002)(36756003)(53546011)(2906002)(6506007)(86362001)(6666004)(6512007)(5660300002)(41300700001)(54906003)(110136005)(8936002)(83380400001)(4326008)(7416002)(316002)(66946007)(66476007)(66556008)(8676002)(186003)(44832011)(2616005)(38100700002)(921005)(6486002)(31686004)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUkrS2FQb1VSYjN4WDY1akdienNOdGozK2FIY0FFWFR4Wis2ajdjNG83bHc3?=
 =?utf-8?B?T0ZLc0E4VnVIeTZXaHhXWTdIM3EyaVFJZnZ1UWphYjlGa0Ztdm5kc0lEcUpa?=
 =?utf-8?B?d21qSnRHN1R1RHFpaFVaOUtNeUp5ekh6UDJzSTRZM242OWRZMFJjRzJPYTQv?=
 =?utf-8?B?NEIzYlRwaHpocVoyK1N1UCtzY1c5SVhUT0U4QUpkVkdWZUVCaEQ5OWtpcy9u?=
 =?utf-8?B?N05lNDIrL2FZR0MxMUtEU2tLZUNTRkdrdzhMNnVIVnFPU20yTmQ2UmJlWDZS?=
 =?utf-8?B?cThndU43aDlNWGNoVWRlclNCbmtCaDRQUngvNldHZnVOWU1ReDg1eXdVdmlj?=
 =?utf-8?B?eTUwZU96U0JKc0ZUSURXd3lidGl2VEJORWZNWUVVbW9WUWNoS2pwZ0sycXFr?=
 =?utf-8?B?cUt0WUtiMXIwai9BbGd1WlJSWTV3M01UdHhhWG5KR0o3WEFEY1MvSzNFcERK?=
 =?utf-8?B?QzhNcmRtay9WUFh5b0g0cUxUenM0R1cyU3BEQ3pCdkN5NHpNbkNLVE1XUllr?=
 =?utf-8?B?MEhNL3VTd1poakJNY2p3RHNVTXFhY3JYNlVDd1hUK0w2cGlvbWtvRTVVV1JZ?=
 =?utf-8?B?dGlzVTdHa3Z5UXlWVTV4c09OVUw4bU9vcktYaFNVdExrWjhuQmM2TkNzRzFq?=
 =?utf-8?B?WFpXL1ovSFZvZ2VSY0FCUUUvUGxxeUpHb0VvYWZlS3JGb0w1anZRaWFUaFNv?=
 =?utf-8?B?bEg1M0JqQmltcGVGUmN0ckx5SVFKNFh1VnVlWGNMUmlLMzRCNWxYKzJTbmwr?=
 =?utf-8?B?VnV6Zis1aE9MWjhTaCt1OUFhL0NVWlhTbyt0RklsTGxka2F3VEhnOHQ0Y2Z1?=
 =?utf-8?B?OUlTL2l5MVBYeHpDVW8wUjErSys2NkhjUWhuMHlPeWFtbkVPa3FGUkJZY056?=
 =?utf-8?B?ZTVmd1pZU04xQ1c4Y3RpQ3cvSTNFM2ZsUWdPUmZoRmVvaUFUQmh1MmNtYS9x?=
 =?utf-8?B?R3dVK1RiclphNjg4Vm9RTERXdzJXNytIaklTZGtBQzBuM0JVUjdtM1Y1SE8y?=
 =?utf-8?B?Sk9oTEtnaDFJVmtUUU1QMVEvenVtYTFPVXhWOFM4QVFIbnNSTGRWV1JkQ3p3?=
 =?utf-8?B?SGJwK0dNY0h2YmM3UWpjQ2Y3L1BTSjUxQktVNE5rbnhYMFF2dzZMTU4yVStS?=
 =?utf-8?B?azRvMkY5TE1BSlJObzB3NERFYno2d2ZEWmhnd0w1RE1OaHNzaVJyMWQvbFdF?=
 =?utf-8?B?N01KOS9mbW9EbkRtekwvaHZpTUtOVzBTY1B5eHZjWEt6OWxPMFBxOXZaRXBp?=
 =?utf-8?B?VUEwYWY4ZXNvd0ZmR0FWRWU4RTBUcFdNWWRYc2F2c3BwSmI4amhacUFjbS95?=
 =?utf-8?B?MzVObHpvczZYUzUrZzgwV2J5Wm1rWEQwZTZQNDdrQTF3N1JmK1NJczlUVjlD?=
 =?utf-8?B?TGp3RlNoVGJ5bFNSYXpqL1RwYlZFL2doNnFxUkR2RExKdXAzRlgzSkYrWHZ4?=
 =?utf-8?B?ZW5ES0xqZ3pwNEt6TjNkY2haQnRmQzY0R0Z0US9PdG12dGV4NWJlNEVnOFZv?=
 =?utf-8?B?WUVxbEg1S2cxSTJBRWY3bld4WHhPNFQ2c2VnV2hyc254alVXbVh3aXpEa1ZN?=
 =?utf-8?B?LzVtVWVsV1ZiTk5ZQUFWdGMvelNnazZUSWE2Kys0OFk0d2RLN0F6RDhVMmVT?=
 =?utf-8?B?ZWU5bjFQbmtyMmVDRVhmVDBTQkZrQzZrRE5ZQXprTmZPSWRYcUpOUW5VSkpI?=
 =?utf-8?B?NzJhOUR5Ym1scWR5d0dwVWJTZlM0ZmRoNkV0MTBJakY2R3hJaFpFUnNZZlhE?=
 =?utf-8?B?bkRXNGpXNjYzOU0rVjA5M1dRamE5Zyt2dWpXZlAvWmFNU1dEQ1NSZjNpSURo?=
 =?utf-8?B?SmVza1lKVVMzY1ZDM3M0T0MzWDZlbG96cGQ2WjB1dTZCNXgzNi9rTE9YSi9h?=
 =?utf-8?B?ZVBGeC91a1A5Nll5SzBXUzJLci9OYjBDQW05V0lEOHFIdHFBNzd4eEVOc2NU?=
 =?utf-8?B?NFJxQXRZZTkzSllCQlViL1VNcnpEdFd1NEo4MlZDc1RlSEluMW9NSzVBNlFq?=
 =?utf-8?B?ZW0zMVhETFRoVU8yNnMxckN5T1V3bzZveGZMVmVPSHBuL1pGdjhBZWc5NFpy?=
 =?utf-8?B?TWhCcDFmdy9CUEdibXNYYTYyL3o4OVJtSlFyUVMrL3NIVTZnWHg4YUVmTnkr?=
 =?utf-8?B?OEc5NjdORUlVRVNOejJlL0VuNmVONVBiK2lJN2poZ3BXbUVlS0ZRVTU4QXFl?=
 =?utf-8?Q?NosZs7YATf8yCAEsKmdtKfY=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c28d1e5-754b-4abd-7444-08dade77a7cb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 08:37:52.5199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+kZC4qX/wGiR8+GBGYJvprLblIFqH867wJLbuUtRAl+5GQvjr+ScgcSueTsp1JelB2hfmQAY5KROYxGHW+ub3NQ8Fb2rUOBUyuIPFuf3dQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6913
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14.12.22 13:58, Jagan Teki wrote:
> From: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> Host transfer() in the DSI master will invoke only when the DSI commands
> are sent from DSI devices like DSI Panel or DSI bridges and this host
> the transfer wouldn't invoke for I2C-based-DSI bridge drivers.
> 
> Handling DSI host initialization in transfer calls misses the controller
> setup for I2C configured DSI bridges.
> 
> This patch updates the DSI host initialization by calling host to init
> from bridge pre_enable as the bridge pre_enable API is invoked by core
> as it is common across all classes of DSI device drivers.
> 
> The host init during pre_enable is conditional and not invoked for Exynos
> as existing downstream drm panels and bridges in Exynos are expecting
> the host initialization during DSI transfer.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
