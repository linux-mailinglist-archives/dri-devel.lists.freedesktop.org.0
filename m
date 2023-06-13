Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EA672D9B9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 08:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9721F10E02D;
	Tue, 13 Jun 2023 06:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4695110E02D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 06:15:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaW4EI+OlyL+/EglB9uJaZ5n7w+c+bIiLWUZ+AIpU28e08VVD/FmAqIrfgSgvqxYBQjgoq7vurKZhIRMR8BxTeUsguPFRLXePgXeJTvRjQ3CaqaWocSYs6ktipymF0QdPJaFbhiVeCS+YNIbC8AAJePWsRlhfxMovfPnZCawgr6T06WSnL+XAYOURuLaMbj7CYoOkJMidf/jAYX+OzIxbtr4BVXwrxtE7lYuSUA7RSeHpmMQPje8hLCLdkRvDhlEwF9Do0ZbR+0sTqUgaTa08vNjCmPa4ezgCI/g9/bHcbUNgzEJzZOiJnpxJZOeLkdO7aQrKW8p9LweG5zIzeWUZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=es86mkgVz/fYOVs8mmdWwfhzPMpr+FTbrYVWhpKj5zE=;
 b=FyTDF765YHloDzS9YfIwUNjiRTQGKWC8Od7BJRIogMeQX5w4ycPR4LPLh2U3Q44vPhi9GuWACCyMTlLmu8w5TleGt3xlzSMO1CamEug7kYTugMIE8ThLh5bRPtarPujilLE/26WXC+PDkLZL41CB4aov6FGM8qbGO1GVb40B7jcrWXtBGNNnPVrQoXm4LgX2x5saMqmssQfhcPuRZArZo5miGRzo1CVWDKR1qTT/8W9taXvizqHWLH6vWTXtDy/kd/jM/FOuAAVI1Q/RtT6xlgGQTBoTXeyJs1K4ApndJ0jfdvEEJoabAFyBQ3xSR5OwBP7+C3QDkJR5PUyEZ+0vSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=es86mkgVz/fYOVs8mmdWwfhzPMpr+FTbrYVWhpKj5zE=;
 b=0K1aMJlg9XFGkKAm37dDPM/DyIBK1JKMymVEs5W6DSa4b+MUguew/lWgtW2hHqa2PVGiOXmSSw2sDUmDPtHQciupbBZlPLqcyDcRdrfrL/anSunixBNzIJF3rLKf6fQ4GrtxEfD0guQJB0KHsI0THSGDcgs5DT5gTmXSaVJjlXk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PR3PR08MB5755.eurprd08.prod.outlook.com (2603:10a6:102:86::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Tue, 13 Jun
 2023 06:15:28 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::77dd:14e4:a772:d85f]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::77dd:14e4:a772:d85f%7]) with mapi id 15.20.6477.028; Tue, 13 Jun 2023
 06:15:28 +0000
Message-ID: <b4ae6e9c-b548-b1e3-42f9-e24aacaf2b38@wolfvision.net>
Date: Tue, 13 Jun 2023 08:15:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/7] drm/panel: sitronix-st7789v: Prevent core spi warnings
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
 <20230609145951.853533-2-miquel.raynal@bootlin.com>
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20230609145951.853533-2-miquel.raynal@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZRAP278CA0012.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::22) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PR3PR08MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: f00dffc1-2422-40f5-3ea4-08db6bd59570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T4SPinOBThu6LO05hO5mF1XJMv9IoKoqYBdo9IjnYQq00VbNM0yZnJnk3TKsP8DPqggS4aaFfg5ams/F7hI89hQ2zKqvg18azlHcQonGrCoN7k3n1HltBzl8xic7kq7jKJZtdTkb2b9iUH7GkSzUMAfSBbUjsFSXibtjzmsAS+8ihU1kpAKxtY2OoCl83QKrdoADaVyrq/GmML5aarDQN2IaDpHVI1N0+JRGUYo3TGTLTQUurB8CXwWNPUiI+i2dcPiFuReC5HwnfV68XKgZgUiDKwpO+GmEe4BJSYC1nHYIXEte8oDcGdb/WTmGohSO8DWbOqip4i0PsmHq00b4iZqGYZMTRKpzpXY1XHZamFBsSjcmHmCRilOgCifonip10NdW1xASWC+UdfUwsUn+lbELJ9Ksy7ZC8TvoSAJ3j0VquT8ohjXyYE0rG1RNJmbcyt8FhUvPqmcX8hBL9Qa0UEQ2TNdTZs6glvcKd4icWrodvjSU+OSWdroTrASvnQnYhfSO8xkEMeXpteTmPZj9SoW3oLJFindey2bNYehLBApIBYTYxE4PSliiEuTS+XweG5s/njgvu25l49uj/7J4NFqktkCkh5hXbDlBME2OLfD9zgH5tBqJCR5ZZMuda86/fJRHGxrLe1sKldNtmSWM8plrGyAxMlTa27258fBKAS6SBssWmDY8wYvNUVSsYSB6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(39850400004)(346002)(396003)(376002)(451199021)(8936002)(7416002)(8676002)(2906002)(66946007)(66556008)(66476007)(41300700001)(44832011)(5660300002)(4326008)(478600001)(6486002)(31686004)(316002)(54906003)(110136005)(6512007)(6506007)(53546011)(966005)(186003)(38100700002)(2616005)(83380400001)(36756003)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1R2eGRLT2lZanpWM1JvS1loRnhuTXZhcTFlUTVvaXJ6aVNMYzZybmt1aHBy?=
 =?utf-8?B?UzZMeUxmVS9NL3ZmT0RINUVESFhkRnArZ21ucmtBN25ITC9qMEVSaGROOHJ3?=
 =?utf-8?B?bjZqNnR3Q2UvQ1FCU3E3Q0tBbi9GOXRWazQveDRBY2JIbHpNN0JzbXozWVd2?=
 =?utf-8?B?NCsvcVRkSTZidkJpMVRTYnU4MHBHQjNLNG0zbzBBMjNMQ1g1aWl5ZGpZQldD?=
 =?utf-8?B?d2k3OTR6U09tOEthTVpRUWtPcDR1Vy9XOHVGMmllQzZZcHVrNlU3Ri9JdHdq?=
 =?utf-8?B?NVpHbmQ3UjZ2N0FuOFZBY25QbGZxTlpUeGppSFJiREhpVmNWNDFGcVpwYXZk?=
 =?utf-8?B?amYyNk9jOTd1NEdDWFJxdUx3SzJORStwNld5QW1QOU15bzAwUjNoMHhZblp2?=
 =?utf-8?B?a3RJaE5PUEIyRmloM1ZRQjloOUdNb0FMdUtCcXgwdVE5MmR1Z1dXSDA0RkhI?=
 =?utf-8?B?UEQ2OVZ1dXVaYUFYdWpBa21jUkRUaFl2RE4yVVZhbXBId2pDbmVnVS9Pc0h2?=
 =?utf-8?B?Tk05ZGUzRXhERmhjRFdlOHJuYlZocFd2ajFjK0xGeE9EY3hVd3pNWWd6bXdt?=
 =?utf-8?B?OWdEQXRiRlZwV3c0RjUwWldyQi9zeGVmVWV4VDdlRnUwZTZEcWpibXNOSFVI?=
 =?utf-8?B?c2VZOUh2a3JtTGRGdytDa3VhWXZzbTBzVEVrZUI5WnUxVEozMnVaUWxPRXBL?=
 =?utf-8?B?VStJZFl3TkNwMmJyYjc2ZHJMVEk5c2tTb1BhVUNvbWV1ajFNTXp1b29XL3hy?=
 =?utf-8?B?L3BKWTFmamNLdm5ubytGbkcveXA5c0cvVi9RQkhPOHlvL1dkOHUyRWxBWitn?=
 =?utf-8?B?c2xrOXJvY3ppSitCYTdUVDhxQnpTRUp0aDN3cGY4M1Zyb3VqNFpGbVEyRzQy?=
 =?utf-8?B?aXRZbkNCRytTNW5xL05KbUlMK2VIcnRIS2F0bVM3aVlkK1hHc05oTy9zOWVX?=
 =?utf-8?B?ZDd3UkV6K2I4Z3dlL1dqalBwQTNSYVpobVlIYjk1MXNGNGtIY1NRU1JKUU1B?=
 =?utf-8?B?blBvYVVRLzdJM1ducENQaWlvTEF3NWZMYUhyMmUrU1ZuU2lLS1cwYlNJMFlj?=
 =?utf-8?B?VTQyL0orQjA3cnJ0UDBSUUR1UGlMNmwzWFd5RmI0MlBvQjZaRWovSXhVZ1lJ?=
 =?utf-8?B?WDRWVi9wOXd3UkREb0xzQ25hNENMM0EzNTFhUVJZR2FKMW1iVEFXMFFUVEFN?=
 =?utf-8?B?MkdwN2ZoSUZWZys3OWRhRkJQNjVxOWZGeDJDYzQ1RDBadm9OQWp1TDhib0Fj?=
 =?utf-8?B?clBTMDRpMlhQVVliLytmSU5TTGxqMGEybDZuaWNVbWJSQzlKUXFGUzQwTVo0?=
 =?utf-8?B?Vm91MzczREM1aUc2RHErZGNGTzJob1BITEFLUXNiSlFwWlJvMnBienhyQU85?=
 =?utf-8?B?L1VUZnFrMFdFamduMy96TnpuNVBSOHhHays5ZnZTZ1VSSzBhQm11UE9aWGRG?=
 =?utf-8?B?OGk2NDQwQk1NY3I2MEFLQzJNS0ZmeFkvN3dwOFlaTTdjRmcvam1PMytpWDM2?=
 =?utf-8?B?MjIyYUg4SkdpZWt2bXgraUYyaldxSzdSNTEwaTJCV2IvWXU0amVoay91WW4y?=
 =?utf-8?B?T0o0dTBSbHEvRDRRd3dTMDdZelNaNUs3bTJRMXNFaEp1M0NMZG9xbFpYclFB?=
 =?utf-8?B?Z3lscnczSVlJUXlTZThzZXBZTTc4cGh3SWZ1bDNxMDk2OTJRTExzTVRFWEpF?=
 =?utf-8?B?NGxBc1hWQkZSaXhaMitpSHYvRUduUUtZSmpaUjdvcmpiYlQyWmp0ZkR0MVcx?=
 =?utf-8?B?eWNwS0ZTLzBpcVpFOU5IS010YUtBdGRVcFBMRldtUUN2aVpiWFRRNnA3T1h1?=
 =?utf-8?B?Y29mWFRUc2lZT2UxSG5uNnpCb2VYSzBxWk04bzhxY3BQaHlncDlSNmYvSnBF?=
 =?utf-8?B?S0wxUE1DR2ZtaFBPVG5xdExWL05mc05ORGFSRUV5Yk1OUG1EQjlOdWhldy9j?=
 =?utf-8?B?Y3pRVDY0d1RYMTNPeG8xM0QyeGRGSU0zbmVEdUtwMjdHSDBjNmJSbnVPUXRS?=
 =?utf-8?B?bnc0N0JHVlhGdW5RaU8rcSs0d3hnUFY2R2hHR2R3M0hWNms4Z0w0ajhRd2RV?=
 =?utf-8?B?Ulg3M01KZkdPY082UU9Ha3F1dllnNmhFcS9Kd3FuNWtXRG1aOWVzYlkwV0hC?=
 =?utf-8?B?Y1J2WUJXWjNqLy9pTWNEclJzUlB0QTViM0RVYnNHV2RFbWJZS2xyUHZoeUdl?=
 =?utf-8?B?bDZ3RnJWRnVmMHovUzMvcndweHpoVTlnaklISHB2bCtkQThmaUZ3cjdPbnRR?=
 =?utf-8?Q?I6HcJT6QCJtyfYhq2hMCjiLeZbEA4pPZpT9iws/P0I=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f00dffc1-2422-40f5-3ea4-08db6bd59570
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 06:15:28.4353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2AwIyMk/UAw7psu4QvlE0/Pxvds+XqtQGmq4zn+BJGCRWwlesoV5E7Ce9c0BeRkORJooIEGf6pOw/KuPCntFEwtHODPsYeHW2ellbKD4ciQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5755
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Miquel,

On 6/9/23 16:59, Miquel Raynal wrote:
> The spi core warns us about using an of_device_id table without a

s/spi/SPI ?

> spi_device_id table aside for module utilities in orter to not rely on

s/in orter to/in order to ?

> OF modaliases. Just add this table using the device name without the
> vendor prefix (as it is usually done).
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> index bbc4569cbcdc..c67b9adb157f 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -400,9 +400,16 @@ static const struct of_device_id
st7789v_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, st7789v_of_match);
>
> +static const struct spi_device_id st7789v_ids[] = {
> +	{ "st7789v", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(spi, st7789v_ids);
> +
>  static struct spi_driver st7789v_driver = {
>  	.probe = st7789v_probe,
>  	.remove = st7789v_remove,
> +	.id_table = st7789v_ids,
>  	.driver = {
>  		.name = "st7789v",
>  		.of_match_table = st7789v_of_match,

May I point to you Sebastian Reichel's series that features a partial
overlap with your work? [0]

For instance, the patch at hand is comparable to [1].

Cc: Sebastian to keep him in the loop.

Best regards,
Michael

[0]
https://lore.kernel.org/dri-devel/20230422205012.2464933-1-sre@kernel.org/
[1]
https://lore.kernel.org/dri-devel/20230422205012.2464933-4-sre@kernel.org/
