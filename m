Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E60642945
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 14:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E7B10E20D;
	Mon,  5 Dec 2022 13:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2121.outbound.protection.outlook.com [40.107.8.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BBD10E20D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 13:22:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9Fzu1VlJho/MOqBADYbSl6+oKCz05ora0x8JD6QY6hGCtNjiCbWRLd+vClnowsuCPgDvdu/ew5cMfUzWKHAuqljFb5n2XXwpBIdV6xpAh7kg524jdXbi/A4vib4Eb7PC3oBwP25+06X1ww1I4e7QO8QC6G+6GCE0MOItZJpXqi2ytInG8TTFySBfqK3WJ1gIopASazAkkuDEnISx8wzoiZOnhZVjkROyOkWVA3RjjPXcskA+4seXcfcBIT5PK+vvk+XQP7m25XBsa61+zHWXKDJS9aZJc+allya5ZG9DUXk0uUerrgZAc7fEvkpngh7FOqTHZqpgbfRZXK/1hrh5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppD7IPJT8gsuR2pINn7ofLgt1G1C1jn+eZNPCbLbAOg=;
 b=lnbqIq7T73UOLiXydM5iAecre+2INby1+vYMLhGVo8RnycuP2kg23x7SD709cab3u5yVK4up67qFLqARImiSXYXeJclt82acI5zptNqlGYES8/Kst972T7KfcoNsv/utXconb6zjjKxaEfI4yHbmtggOMnYegnyi1w/58PWSi8V1foRN47E7CD946nx9FROMjnhvIBibkvgtfv8MEm+MWeX4vW5NsT2uC6BMChjlnf4WA6DCONJr5P3juQMOhlGdXyzQWWHfwtb4p31sFr0g8422z0NTsRTSUU1zxbSltrE//x0r7mOWUnEd05nRHm24gYp6zP7Hv9enWHGcE/M0wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppD7IPJT8gsuR2pINn7ofLgt1G1C1jn+eZNPCbLbAOg=;
 b=FSw1zFfVBeZrq0xoA8foAvZ8DPCq2jf7q+8TglomCxZUIB+MmisE/5b1NVZvNAM8QAfAgKW9Z+wXpDeA9+hiw9EYqiiWtN2DeW8ReG1Xgn0hj6mQ8DUBig++a3GLZbLJEGnw35y+tLhYFHSB8Dp1BTPTtDuhNgXbprSXCOrKXwE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS2PR10MB7901.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:64e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 5 Dec
 2022 13:22:56 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%6]) with mapi id 15.20.5880.013; Mon, 5 Dec 2022
 13:22:56 +0000
Message-ID: <c8ad8b14-fac3-2815-ed37-ebe6c78fec7b@kontron.de>
Date: Mon, 5 Dec 2022 14:22:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 00/14] drm: bridge: Add Samsung MIPI DSIM bridge
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
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221110183853.3678209-1-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P195CA0007.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::12) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS2PR10MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: c596d815-29a4-4dd6-9be8-08dad6c3d283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jDHrvmdZGQ9F5FdyMyi9wYolpel2xOXEVrx+zO3hcHCakjDQpSVYAodXd9zYqFHHmJGGXSn+awC0FrKQHpt6EW2V4Q7y9nj0nw+aIZ23/OEXrY1qgYntoZeCE9+IaKFSJvfKh2TxfTsAR4dTQAif+2AgORfhIzcX+JZjiv0aCMeGnNNkvV6ZcCqhEPuTzOH7XK2fDWrT1U9PMhtvPswkxqcO/J9kE+OT9/DMy6EHTDbNyxP1rb+EjykTqFfBnAfkO5x67xog/75k0nNtr53RhR9SdwOcZYk2aQyWow5d/0REmA3wOjl/VeMNjPpg3CCBFumT0El3Hed3qw4n6IWhuLYFIzz4o4kI32PqwiWXGchFvfhA0USI22o2HZae89IAe00Y6LfRMleSUqBkhJeVHwBrvWdgGtPrnJg1ssd+yiwJV2xKnmiuZROWVgT/gE6Tby/PzfNWlUkvErm5RIPgpf655P0qhiVSLpvuN9bDkATQLeQBBk2mz+mBqrWULoIIlFmAVl2IO3lumllbd675tZ7bewsBMIAwjLJbp2mZU+szsnH9x/3Cv4Kp80x64NhmpXSM7fUcUZhCQ3IrtGjc3+lHKgdthpF4de6KTSHqz0skNxjFNigqLwU8KudQf1qU/QLtHQdA31j6ENcSCZnIpsvounM7bt/QF22O+f2um9UdDHpHjRXbA1aziBu8f23W+05tSK0Sf/5oZhSP4PX1TxlKr27QKzOBcdrSkh9ahkXiJ1Hsk4IPXnsskkbJNizR57Y6rcy+EBtn48kCz5qXBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(451199015)(921005)(36756003)(31696002)(86362001)(478600001)(966005)(6486002)(6506007)(53546011)(6512007)(316002)(4326008)(8936002)(41300700001)(44832011)(6666004)(5660300002)(7416002)(2906002)(110136005)(54906003)(66946007)(66476007)(8676002)(186003)(66556008)(83380400001)(38100700002)(2616005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmtOSTZpUHl5STRNZDUvWjVsRVZ0amYrMTRMcW5OSnlRMXBXK1VGWGt5aDg0?=
 =?utf-8?B?cXlVNEMveitsNjZ5bGRWZ2p4VHlza3RrZ1pFcm53OENDOVo5Rm4vY1NqMnFj?=
 =?utf-8?B?MnZZQjkvVXg0YlRleXV5Vlc4NkdtNXZkaEtySWlzWUxMZUJ1eGFRaW1UVFND?=
 =?utf-8?B?S3FGQS9sYWhnc1hBUXU2dTJBZmVKbXM1M3FIRnI4NTRHUFdMUDZvUGN0bjlS?=
 =?utf-8?B?bzB4SUNVYmRnWXdRa1d3c2pYdG11bnFwYnNQOVpQTzU2WnJlNUt5ekRUaEt5?=
 =?utf-8?B?OUNXWmIyU0ZzT01veU5uOUdIeW1GampWeGxibXd6dTRMRjR3dlFUZzN3V1pH?=
 =?utf-8?B?a2JCZnpVemFHRXJTek4zdXJDU1hxTUdnZFRZcHFTNEMwM2tqRGN5QXFTdk50?=
 =?utf-8?B?Qjd0VHhDVXcrYVM0b252Q1NnMHU0VzFQT21Sc1NveVJQQll5R21yYUkwOFZJ?=
 =?utf-8?B?SVNWY0Vpa0FQalhwekoxQVI5ZXhFMWYwVGJFdzNoclZBNkVvcXVxNElXcWs5?=
 =?utf-8?B?QW5ydWFEbmVaampLMWdNc3NOdkhCaFhCdVVMR2xqWDFBOUdybU9WNnllajNX?=
 =?utf-8?B?UHRwbjZ1NS81YWpQYnpnTmZpcDIrWllkRVRJek52QnNZVVFDemRhTGFuNVBW?=
 =?utf-8?B?eHdFMDZJRzhtSXk3bFBSYVFhZ0pWQWpDaDRSZVdNUldheml1YnZObEVNL05F?=
 =?utf-8?B?MFdXeUVrUzUrRG4xZE80SlBWeUZmMkl3RUxxTUpaVTVBSXRJaXlYOXZEWnRi?=
 =?utf-8?B?WVpNMWRMeDRoNjB5K3VBcndvUTFXZ1RYVVprK0NJbkZIZXpKV0lsckl2ZnEr?=
 =?utf-8?B?NkdrSHdIVGNFanZOUDVLOFN1R0IycFZscHZaYXlWdm44UGVHYjl6LzJJbE91?=
 =?utf-8?B?aHNhWjNSSWo4NWJmS1QzWGlsNUwwdGk4M2c5QlB3SS9pRWdwWXZXbm9Wem1R?=
 =?utf-8?B?NUhmMHJDalFyN09iaENSMlpOREdrMDcwNkpCUlRoTk1tbGhXa002dXIvMnBl?=
 =?utf-8?B?VGNmL1o5WkoyQ3ZTM0g1RjBVNVVCakhYQXd5ZlF2aGlORy9uVVJ4ODVDMzUr?=
 =?utf-8?B?TW9jSUJKQmFicWZHUVUrS2MvSXlMTjZxTmhnc05DS2ExeUIvd1RXREdYaXEx?=
 =?utf-8?B?WFlIMjdIZ2FhNDVUL0xBVWpBTUcrdER0U09LS2RZSU1WY1JOL0xET0pMZzZN?=
 =?utf-8?B?aUtORDFyMG5HZ3BtUkkrNHczRktOZjY3N2ZrRkp0WGtGVmZzT2puUXBUWHVn?=
 =?utf-8?B?L0k5OS9qMUswOXBGaWtqeW82NXpmdjdVWWkzS3N6OWR2LzkzTnpkeXNNNnBT?=
 =?utf-8?B?OG90b3Yzc1k4bGY4K1VnbnpWVVJmK0N3MEg2OFZ4bnhrMldXM1J0czNVNXR4?=
 =?utf-8?B?eDZCRGx0d04yL0xoWUhqM2o5c1JtVVY4Z2FsVWZZU0p5RlAza0RpR2RWSW9Z?=
 =?utf-8?B?UUQxbXpacElOaWtqL2VoK0syWjF4WThMMXJyUFppeGdYYi9KVUlFN1ppR0hS?=
 =?utf-8?B?T2JaM1RRTWpGUWIyZUppa3MzaU9maXlzL2k2anJUZWd5NVM2SGduNW5iODJX?=
 =?utf-8?B?K0pIbGJIRU5NUzZYNWM5U3o0WFkvbWhZWCtzSjZBRkREQk1KVnI5VjZrcHNR?=
 =?utf-8?B?Kzl3L2MzOEpyL0V6YlVRaStUeEtpbVc3amdoMXJiaW9PUDgwSCtKUHAzaWJP?=
 =?utf-8?B?OFVaajVYMmozV2FTZDYwNkcrR2FFMFc5eDA0U0tSUDY3SzFMWEJmYVZsMjZU?=
 =?utf-8?B?WXdxQmVmZkVHQ1NjckQ1VExGQWE2QzFxbHQ4NTZkSmxXczJ3K1h4MkMzYUMv?=
 =?utf-8?B?cG9pVkY1YUlpcy9rdjIwSTc1bkdHbTNvOWtDOHRxS1BxTHFHM29UdHo4VVBZ?=
 =?utf-8?B?Ly90WTFrbHoxVkl1N0szVWhQRE8xbUVBKzA5THQvazNvOUM4UWhycnFISUZ0?=
 =?utf-8?B?QzVjVnBLZjAzWXo0TlYrKzg5c2FyTUViOUtSa05yVElpaUV4V0RKUHVYNFBu?=
 =?utf-8?B?TnloQ0ovVkQ1dVhqUmxnaUJnR0ZESkRTQ3BCNjFYdmhDTldOYVlPRlpwTVRE?=
 =?utf-8?B?cTBoNWdubTR3RW1zU0tSM0J2SlR0b2l0Qzc2T1JMTGpPcFBsTFFUc01xWHE5?=
 =?utf-8?B?bGluV3dob2Q4TkN1ZlpvcEkvVk94YVYybS9uUFBpdFpnTjArRFlncnlSUWln?=
 =?utf-8?Q?uF0wdFUyFtd2oXEmM6LxpHIkurxMoGA8ENdcQzcnDdoU?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c596d815-29a4-4dd6-9be8-08dad6c3d283
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 13:22:56.7184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTCgRZZWZ3WX9nOz9NgTauoVZGeN8+ZwoPCCVFgUNaR1i2G/bUuoHg8AIKzDEHvji2bnxxK0utdPAj1AJdrATYwNy/Nd3gU9TGcUrk88Ses=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7901
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

On 10.11.22 19:38, Jagan Teki wrote:
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
> 
> The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
> 
> Changes for v8:
> * fixed comment lines
> * fixed commit messages
> * fixed video mode bits
> * collect Marek Ack
> * fixed video mode bit names
> * update input formats logic
> * added imx8mplus support
> 
> Changes for v7:
> * fix the drm bridge attach chain for exynos drm dsi driver
> * fix the hw_type checking logic
> 
> Changes for v6:
> * handle previous bridge for exynos dsi while attaching bridge 
> 
> Changes for v5:
> * bridge changes to support multi-arch
> * updated and clear commit messages
> * add hw_type via plat data
> * removed unneeded quirk
> * rebased on linux-next
> 
> Changes for v4:
> * include Inki Dae in MAINTAINERS
> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> * update init handling to ensure host init done on first cmd transfer
> 
> Changes for v3:
> * fix the mult-arch build
> * fix dsi host init
> * updated commit messages
> 
> Changes for v2:
> * fix bridge handling
> * fix dsi host init
> * correct the commit messages
> 
> Patch 0001:	Fix MIPI_DSI*_NO_* mode bits
> 
> Patch 0002:	Properly name HSA/HBP/HFP/HSE bits
> 
> Patch 0003: 	Samsung DSIM bridge
> 
> Patch 0004:	PHY optional
> 
> Patch 0005:	OF-graph or Child node lookup
> 
> Patch 0006: 	DSI host initialization 
> 
> Patch 0007:	atomic check
> 
> Patch 0008:	PMS_P offset via plat data
> 
> Patch 0009:	atomic_get_input_bus_fmts
> 
> Patch 0010:	input_bus_flags
> 
> Patch 0011:	document fsl,imx8mm-mipi-dsim
> 
> Patch 0012:	add i.MX8M Mini/Nano DSIM support
> 
> Patch 0013:	document fsl,imx8mp-mipi-dsim
> 
> Patch 0014:	add i.MX8M Plus DSIM support
> 
> Tested in Engicam i.Core MX8M Mini SoM.
> 
> Repo:
> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v8
> 
> Any inputs?
> Jagan.

I tested this on the Kontron DL i.MX8MM which uses a TI SN65DSI84 bridge
and a Jenson 7" LVDS Display.

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron DL
i.MX8MM
