Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5E83B5A64
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 10:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30306E2C0;
	Mon, 28 Jun 2021 08:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2118.outbound.protection.outlook.com [40.107.21.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874ED6E064
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 08:19:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbSYOIWq8wohgMxBl+d08+MoSDDy1EFAhAoGXztvtumAU1pX1Je8ROisK5pGQmgsaiDnrcbiSEizY+3rkoGejTHIIxUcdXs8G0qFv4GbIhpBC2GMQhfud4D2/gAr7UtB+ei8Vsslg1/wm1BMzcopfUSX4Ab+L2AExQnBV6W7ChbRndoSaGsDRj1+6JQlzg08GSXGYKPpKD6gnFURMrKCYbxCYDkpk03X3vnJewiQpHBQ/DQaePjENA4bEi+6x0KN5IZFSMrawXnYAKOSSLp0VqWxdNXCz3knSw0ibN+7V+M8rnAWjAtKz5lPz3ga+XmJ1ZweWafjHMlmsrZKNJ6F6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVVhrH6lejGU7I8biVfkuUrExWYlRFNR/bFqOTmmSGQ=;
 b=cSC5GHEg8Uotp/zRRvdbyhzMGaI0vWtC0yfwty1uhfEDUpac5kXOzX7tXuLvWJ6YOtwlDGKaYzJ+E3yTC9aKOcIoX7oQBTMAAeZ9lDox9ozmOlR/QPSrOk7cCFbv7F+54gmYh7BlPwQskLrAyYmu9JD8jZ/Sj2iVqRBqG5NB8ydUPfnwtWMYLZGXZOVGiOmF2lbf3a2huY0+9qfzw1oq0UQH/o/o29OqBINPtX2Ri25tpcTTbvJ0Gh95MwVRLc0f6IdBy5hUiigD6I8ivMbAmIfdMEHKmxBuD+V68CoDH073VgsOJwTvNjhWQ90RBbdFqljZPjxnkyDsuw7+vhIT0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVVhrH6lejGU7I8biVfkuUrExWYlRFNR/bFqOTmmSGQ=;
 b=bOZq38GyM4qp4OYJu/pA759BIS2K/bxu5+uVYwcTPOpukQeZkHXPWXyjkcV7199Xaax8cO95kxA7xxzWQlTKa4whWdZg/GmWMUvfMcv7G/KC8n/K4k3HDDJjzSQAFixAIC7v9OHKmAx5omHHQE2ZoAK6zvVf/hYvW+pYmDAtLaA=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB2530.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:dd::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.24; Mon, 28 Jun
 2021 08:19:52 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1133:8761:6cc9:9703]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1133:8761:6cc9:9703%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 08:19:52 +0000
Subject: Re: [RFC PATCH 2/9] drm: bridge: Add Samsung SEC MIPI DSIM bridge
 driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Tretter <m.tretter@pengutronix.de>
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <20210621072424.111733-3-jagan@amarulasolutions.com>
 <YNO0LHNVSWjrh1ZS@pendragon.ideasonboard.com>
 <CAOMZO5Ahbu4mohtMDOQOv_y5B_TDesbdYEUZTF1RL7_y-bS+RA@mail.gmail.com>
 <2decfea3-3659-2a3b-7706-326c97f57f8e@canonical.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <3aa47f60-94ab-cf0f-3777-3a872dd0e6d4@kontron.de>
Date: Mon, 28 Jun 2021 10:19:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <2decfea3-3659-2a3b-7706-326c97f57f8e@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [80.147.118.32]
X-ClientProxiedBy: AM0PR03CA0011.eurprd03.prod.outlook.com
 (2603:10a6:208:14::24) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.30.119] (80.147.118.32) by
 AM0PR03CA0011.eurprd03.prod.outlook.com (2603:10a6:208:14::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19 via Frontend Transport; Mon, 28 Jun 2021 08:19:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4eab4633-9a68-42d7-0c95-08d93a0d8119
X-MS-TrafficTypeDiagnostic: AM0PR10MB2530:
X-Microsoft-Antispam-PRVS: <AM0PR10MB2530006F347498FFDF8DC6FDE9039@AM0PR10MB2530.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +F4ti6up/FG+jaljV4jRzhK+k6PcwAKPGoq8eOUnL0Kxbzi6O3ScAlCyN6vz/iteRSPNP8I7cmu7dlSet6vnStcKiIp3SBaRGWvj2yv+0KUG8iBaxNmze66Sv0U411mCr+gYJw93leli0wcLscaJK2GCYPGhsFKgMt5j7r8tGTWpNe9fTlltil1zW/Vy9wcDLZPOW6hFL84Zv2AAZEzKETjBlCA/UqayjzPQtdClbP9h5m61hcrp7ZLU+/XEeLjekmEFHmD21QcaOOPSwm/kv1lo3W+pMKy0he7fwrxTy9twJJYBdlksaJLlhXi4X1U2pBpHjJ+b1R1pqxrOoQymbTJ5FTvP60Opze8XXylxjIq39Gj5ND+cSVMsVE5lghKtzVoysaOQijX/EHA/lqIZ3W67gdkMJ9QhDxDSPMoA1jBftZGQsz+E+JmoofAI8UTm3yFRUF1XyqSQQ4JoZCCfw/8cHHnjoHHASLHdCSJHoxzk7dThMhI8D6RZBLs1L3IOI0vyKbZjggYn5J1TCiGx6r423boQUMwSkvf0MA9iOR9ciPKnR8tglUZnO1x04wu0F9DGatnaCNj324Wh+VV/FwjkuSCVw29oZq2Wf2LfyC3de46kxzVuQO/17lhfmuYX9qk3DsAJNTntrmFoSq1bqfg2cwr/DdXp8gK9DOiOdT+pnw9DXjnGdGWbTMxfD7HWk0ZthvHtlECcxwNHSPVLspk02Uruw/E62mxEM/srpD9fyQAhkzj8r9EygU25Pk+mzvujqFkZQLbsrvupVc00CXEtC6pTt7AZahj2qZ3g1CF0ZF3xT6+qGJz+g2FD2SdMfexnlqUG+c3IXEj0VdA8jdUJKhvGKks5zrU/yFBtWGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39850400004)(136003)(366004)(54906003)(6486002)(316002)(31696002)(16576012)(8936002)(110136005)(8676002)(66946007)(53546011)(86362001)(31686004)(38100700002)(5660300002)(2616005)(956004)(45080400002)(66476007)(66556008)(186003)(44832011)(4326008)(36756003)(478600001)(2906002)(966005)(16526019)(26005)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVpWVGpIVjBXdGpIc2pIL04vVXU0R2wzUjRmVHhuQlByUUgvV1Bsam5Vdk5r?=
 =?utf-8?B?YmJBaSs5bkpudXBNOStVQklkUklsMEZyT3piTWdFdkE4ekQyb3c4bmkySUxO?=
 =?utf-8?B?R0o2NnFWRHhuandlNTIwMjNtMXlrUnNsdUdXN255eDhuSTc4U2xLTndJMURK?=
 =?utf-8?B?Q1lwTkJncC9meEZOK0QwY2h2VVpzalNMdFRNS040SUh1REhpWmNqbzBkc2I2?=
 =?utf-8?B?aHE2cmtGc01VQXB3dkFTWUN2TEppelRHYXppcjYzZjNpdnRJNEZGVU50SmxQ?=
 =?utf-8?B?ajNMUUZlMksydzlPaWk4bWFoSlZRMG93a211Q2VpUmo0SWdoZlBkcVBXdDU5?=
 =?utf-8?B?ZmZ0TjVSb1RxN0lKRmVmemtQTnUvaVM3UjlOL3VBYnJkbjFpVTRtd1hIU28v?=
 =?utf-8?B?VXpmNFBFaHlhemlpSklxZWo2K1dYVWxadTAvU21xNHRVYk5laGpZOEpEcHVm?=
 =?utf-8?B?OFExT0RUZUJnR0l1TFJLbzY5QzRnSFh4d0F4OTVQMGJVV0pPL29qYUFEajZs?=
 =?utf-8?B?TkplWmVVTENSZE5ZZUZrRktRd0I0OWxWSFpJR05YYWJwZ3NHR2VkdmoxMDZz?=
 =?utf-8?B?eW40djN5UWx4aUJoSm9YRk5hdGZwdFFhS0NCanhlSzE0M2lXanM4MHd0eCtP?=
 =?utf-8?B?QVBUeUN0cWJRSE9xZElES1hLbElTUExxTFZldExNcjJPTjB3YjUraVA4TnVQ?=
 =?utf-8?B?WTBwRlVTS2d5TkhwL09TOGYvWnJ2K2lrVmhaeGFrV1F3YmhNWVpjdDFjTk9h?=
 =?utf-8?B?cTlXUWJJYnIrQm84V0VSMlE0UVZjcldIbU9yOHpIbTBwS0gxQWljZzRDZmlk?=
 =?utf-8?B?OENVcHp2ZjNjRS9nZ0lucWlheXpIekRhdnpxRTdwZVNaZFMrQVoxOWc5QzBo?=
 =?utf-8?B?eVBibXZFV3JMc3cyQy95M2dEeFlJdE83U00wZVlHZEJiaVJOalp2NUVHR1pI?=
 =?utf-8?B?RE1zWlF3NFlBRlg5OWJWZUNyanJlcVBPSkpEMkdIcjdlRnpvSXkxWHdOMmVY?=
 =?utf-8?B?d0JjNSt1UlgzdjllRFZ5K05OY1E5SGRGQmp2ZysxMFlyK2NxdWZaT25FTS9L?=
 =?utf-8?B?aktpNWhnNW84b3JDaTh3ZzUrS2RiYnVRMlRYZGRTRFdjY2R3ZnIxeGNnemhT?=
 =?utf-8?B?N3BIUkk3VElsNzZVTjl2VVplZWFQN3NmWWVTWXVpQnVkblcyWmxIVnpWZ2Zh?=
 =?utf-8?B?aGFYb1NyL04yRURyZVExUXBVdVpFSm1SNTM0WnlRTjlqMnR4bzdXNUdBMitX?=
 =?utf-8?B?T25BSHhBZndrcnBBRXlMUmNYenRzdGZVcFkwYk5tTC9HM1JmUnA2MVBVd0Zx?=
 =?utf-8?B?UmVNOGM0ekdiY2pxV21jSjhjODNGVm1EMkhqbm1NMHZkd3lHdmY0cXRtVEE1?=
 =?utf-8?B?QkY0V1kyVDdaaXIrbTdyTGNuRXN1Qk4rNnRISVRldXo1U2ZhMGgvMm1Vb0Vu?=
 =?utf-8?B?ZlF5c3c3czh4YlZhU05ac3lJNDVrRDZVOG9BM3dhTzl1TmQxaWs1bm5xdHRj?=
 =?utf-8?B?UktnUWFEWHg1MFBHTXpMRnlKcFhjRE13T01XU2dkbWRQejVTbHh5U2d4WXJm?=
 =?utf-8?B?TnVIUkR0VlRzQ0FnOUFsNzZmSGJmSHcreU9nRlk1UHVWcjNxbmg3VUI4NHUv?=
 =?utf-8?B?MFRlaGFxN290ZmNJWi9sWDhibGo4TzNadmpvclU4SVRiOEl3Nnp2aG5qSDNX?=
 =?utf-8?B?dkdvaUZpVTlDQTB0dllkVE1xOW1vempHcmt5ZVB1aFVnSkNrc0N5OHZrcExk?=
 =?utf-8?Q?Rp+nJYdtnn6/HgaBc+vdsShcKrenSyX6KxQmZ57?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eab4633-9a68-42d7-0c95-08d93a0d8119
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 08:19:52.6223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbrBObOvOii+IWZihJITJ02Z7eZkfqQNAnR6NjZkyDHN36kPHL1f4qzoeZGmm28+dUvI6W3RcYDA+0enM/k/OcV2KYShP5lOfq7fbsJy1U4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2530
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
Cc: Peng Fan <peng.fan@nxp.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Tomasz Figa <t.figa@samsung.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Milco Pratesi <milco.pratesi@engicam.com>,
 linux-phy@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>,
 Fancy Fang <chen.fang@nxp.com>, "marex@denx.de" <marex@denx.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Anthony Brandon <anthony@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Matteo Lisi <matteo.lisi@engicam.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On 24.06.21 10:30, Krzysztof Kozlowski wrote:
> On 24/06/2021 04:48, Fabio Estevam wrote:
>> Hi Jagan/Laurent,
>>
>> On Wed, Jun 23, 2021 at 7:23 PM Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com> wrote:
>>
>>> Looking at the register set, it seems to match the Exynos 5433,
>>> supported by drivers/gpu/drm/exynos/exynos_drm_dsi.c. Can we leverage
>>> that driver instead of adding a new one for the same IP core ?
>>
>> Yes. there was an attempt from Michael in this direction:
>> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fdri-devel%2Fcover%2F20200911135413.3654800-1-m.tretter%40pengutronix.de%2F&amp;data=04%7C01%7Cfrieder.schrempf%40kontron.de%7C52db05459ef0462d5a9b08d936eab1ba%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637601203901391193%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=LTYk9kpUeB9bgfRITQT6wIij3XTOIk37AHXbzQ2UI4Y%3D&amp;reserved=0
> 
> That's the proper direction (maybe as Marek suggested - sharing common
> code like for Analogix DP), not duplicating a driver.
> 

Just to make sure that you are aware of the previous patches and discussions here are some additional pointers:

* i.MX8MM glue code from Marek (+ Cc): [1]
* DPHY driver from Marek: [2]
* General discussion about driver implementation: [3]
* Daniel's (+ Cc) suggested direction to move forward: [4]

It looks like you already did a fork of the Exynos driver, so your approach might be generally in line with what Daniel suggested.

Best regards
Frieder

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20201005134250.527153-3-marex@denx.de/
[2] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20201003225020.164358-1-marex@denx.de/
[3] https://patchwork.kernel.org/project/dri-devel/patch/20200911135413.3654800-11-m.tretter@pengutronix.de/
[4] https://patchwork.kernel.org/project/dri-devel/patch/20200911135413.3654800-11-m.tretter@pengutronix.de/#23995147
