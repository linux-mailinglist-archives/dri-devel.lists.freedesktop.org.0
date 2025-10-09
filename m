Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6C9BC9B3C
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 17:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F63E10EA8A;
	Thu,  9 Oct 2025 15:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KmV0eeJ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010062.outbound.protection.outlook.com [52.101.84.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9B010EA8A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 15:08:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbLNxcbJhv2Fq03UqJxmk3DUdtUG77zqwi5ny4jQldmyzEPiYDbV43vOezd5UWqKn56goIoos+JZgRxgp6s2laVorC64Vi+CgMBNf1YECOChVZcr9T9dioyO2WvPbeVA7lg8zKigC17t+bPScueYysLmG6PNjsEPxh62F7n4rBkcbp8668jVrOWadLXd0zQVtSvTgO2R05PgtssFgxvzB7KNpp4yCFDlHY4+2xWiZhBSRsj/j7uexjirKpV4Lrui3ryPkQry4Qx/jQmavZpO/Bjcmf8FKkq+nKsycL2YO6qHX1x0ACQKLUIcwyxpP8Oydm0FrmnR3I2HW6hFOHTKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3t5RSA0w2ALBpqQKc2IhUTOpOZNBk2jg2jO2yMFE2Ek=;
 b=My008e2Bc/F+0Xcslv4lWmBVM4ON4G6jku53YcAXL6cKXsnPgA9EkBD39ygO7+oxkMNSFcajQkRbvchNqWmuG5gArKXIloFL7p48untxGOBiHyL61CoaJGgVci5PzscKPBb61jpl8Jp92v82I/XOgyMQ8q49H1GVgJr9nmtmGa5jVgcdHbmfmHGdFuEqvN+is0MXMh1ZrpaeQ6f0b2dbYEWDk9AXq//j1QRdVqNDshMQXra9QAFQQOY5Xt453zf6dOw9ZB2cTuE1zY/G5fGaT5kJ0ZB6Ax5JB1TKfdyC8wy1j7CWmyeQGBP/W8/Fj7dvtYIv/Axwl46TqjRQaEFnDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3t5RSA0w2ALBpqQKc2IhUTOpOZNBk2jg2jO2yMFE2Ek=;
 b=KmV0eeJ1FYXtFJpc16JClh25YxAhpgMVEx9NuyTPn3VpU1QzccHjMvQWPs6AXWFsJBTQplCI0LG44rnliT+fMRIUWzpzpYXoD/z2NWSt5U3ws+haWidjJTCFSI9bpt2SUiA34vih+Wim/y7IW5/Jerls/ZypiZYYIVLnPt7uteKZKxITUYrmwcV6hn/IIMk4Q1PZCyEwPwAY4y2Z6Es6bQYa2oSr5G8CnRcYJd+J8migBxCIpCqohHsFz6iW1IMrH+2xP4q8ojEIZKQAw1ENE7IfEw/3KlpwxU4uKKWMNJf6tyqJ3ehC+QCsMEwO++HvlYuIv0XuGm/31sdtI0HuAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB9627.eurprd04.prod.outlook.com (2603:10a6:10:30a::13)
 by AS5PR04MB10059.eurprd04.prod.outlook.com (2603:10a6:20b:680::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 15:08:28 +0000
Received: from DB9PR04MB9627.eurprd04.prod.outlook.com
 ([fe80::c5f7:3093:4ebd:1a2]) by DB9PR04MB9627.eurprd04.prod.outlook.com
 ([fe80::c5f7:3093:4ebd:1a2%6]) with mapi id 15.20.9182.017; Thu, 9 Oct 2025
 15:08:27 +0000
Date: Thu, 9 Oct 2025 23:06:17 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: airlied@gmail.com, boris.brezillon@collabora.com,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 prabhu.sundararaj@nxp.com, simona@ffwll.ch, steven.price@arm.com,
 tzimmermann@suse.de, xianzhong.li@nxp.com
Subject: Re: [PATCH] drm/panthor: attach the driver's multiple power domains
Message-ID: <aOfPaQWIVzMaWlSl@oss.nxp.com>
References: <20251009140039.101189-1-jiyu.yang@oss.nxp.com>
 <20251009160820.74f04ead@fedora> <20251009160929.1b36b9ea@fedora>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009160929.1b36b9ea@fedora>
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To DB9PR04MB9627.eurprd04.prod.outlook.com
 (2603:10a6:10:30a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9627:EE_|AS5PR04MB10059:EE_
X-MS-Office365-Filtering-Correlation-Id: 284af00e-cbcd-4ff8-dcc0-08de0745b32f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|19092799006|7416014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5X5EX0Fij6/RUFoVTibDY82NFQK//57wbwTRnftELvuSU+HbAl1SZ/y1k/lY?=
 =?us-ascii?Q?gszHpbaaf828RtsmDIEn/nNPkitA7M96zDRKPXBkwOjnS8mojEUFOYR1QI2H?=
 =?us-ascii?Q?MnoJyg9oY5AcbiSa9g5fbHOlnJIUPEBEFBbpGbpurAIBMGbiAeb85xt/1hKO?=
 =?us-ascii?Q?5oqA5At9sRyr4WonAxsHFqquxAeQlf1aTuQAtQ1Fk6eNQqJv0dxLvt5z9POP?=
 =?us-ascii?Q?TQaHC98195xY7GQzKdOpnYZiN/DaRZkVbl4anl72pN8boE+Ar9irRjobgki5?=
 =?us-ascii?Q?H6neXD6nn4ZZkAIpC2X0pHtnQFm5LHi8r4TxnfBbZcCubtuq4HBV0UBcUD3A?=
 =?us-ascii?Q?Ja842ZrEOCHHzE7jqBoMZc7qt9AeuY9KbV5m1OS2UUlGTNGSkXCxgZb2vUCW?=
 =?us-ascii?Q?OT0bL4bifO0yZcYWFtePdAeQCHb1UdgbdixIHweJHqFMepcTf1kfiuE5CclB?=
 =?us-ascii?Q?VHeXZ6l6TKw5m59GUUj4+DMBKfmpy6xTVNqW5OBwyFibfLM3R9WkaGADgXne?=
 =?us-ascii?Q?A4EMAqKnp6S/NK1oKhdFQMXDYSch/UM2F+4HTfySHbZLAWmX/5TIt8eKW2uO?=
 =?us-ascii?Q?gNgl1kD/micSfy/ViX6rqrqA/LFz5hGytNbsDxJ5PXJOtqv6Banmie3p9Z/3?=
 =?us-ascii?Q?0zAZ+e2JUOW4COWUDhS32pm03JEANDuJ6mp9olNGx6JQ2WKhxn21OJ1q30AF?=
 =?us-ascii?Q?UmULOTYTu/kK6P74Zk2d/iZpVGJTp7rMV2VmNVORioCKWc0QvS2jG+3JMyUP?=
 =?us-ascii?Q?Am6r3hgu8Pis7BjGOdvqxgO13cnxZbmpP/wGnm4RnubyEHP4a8BIXUw/xKJb?=
 =?us-ascii?Q?WOmoNH/gcTw1S2RaPBIU4cPIixCCHFPq0DxqUIJgRXVawypBOjZq+q/deXgB?=
 =?us-ascii?Q?XOnX0VrNnps5hpTkzaDSXps3RROiZQWCtjfeVY4FSNYgX5p5QoRprDagamqc?=
 =?us-ascii?Q?VRzvRZnbf270l4i0yYcq4OgiX7OzmdALMvR8mQIXZrnGvIiYByQtLEYFxWWi?=
 =?us-ascii?Q?iDVj80FDd8d2ryAT4Je3P0vIpDIEfobBvnHl0Et8OLQ7LxkkgPEAotMotWPK?=
 =?us-ascii?Q?A82vJDC8cYIyDQpo3FFsgnpvyFKSyuMOqYufOmzPxMusVUtXkP1gi5Gjy4W6?=
 =?us-ascii?Q?0Cy056M+vBXXfFYmSSo7OgBYFFPwsYhoOW9tCEGbeDCfZ6fNRcMhvroAtsDt?=
 =?us-ascii?Q?uPRboCBwGkNXGWgD7lL1SqUxAIvjpcSb0Z9370EyeczXF1sxr0X3okjQ2BtV?=
 =?us-ascii?Q?ukngkAKAlenDNPuPHhrlAjJNgOMFsteC/HjUvR6E2JSKHTOiHdUmJQifZKT9?=
 =?us-ascii?Q?wuGrW3HRp18fNdSd+fvfIeb7xhEVfdLTnPLpfYJXt9uHnDCTeh1v+SbT+zMi?=
 =?us-ascii?Q?e8xrRIlx773xRiG/CemoTo+AkZljq3ft4My6jiq3hJZ3cYQTUdFLRcLY+NeI?=
 =?us-ascii?Q?abbfPZ81Z7dNj6sm/H9WCp/6L+JcxieuTBJvp1uFh7HUx1VYq0S/XeDSV0t1?=
 =?us-ascii?Q?YWFC+Lk/034qgxokZMijXCuKUtYWnGh9j/0l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9627.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(19092799006)(7416014)(52116014)(366016)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a5feOl5L9obORcC55BdruP3JFlCMIQO2hxA6uzw4JK0qI2HCxFr0TCcEo/Mq?=
 =?us-ascii?Q?fIQHiFjGewIpeoLHLMUdrM45GoFUUB9wBx62t95nopHOzLbJxPTxZGgVCBs9?=
 =?us-ascii?Q?qnXNkuSWkO+7IPZJ9CtdsjLDHTSqktzOuuy3ckIg5LgC5W5K3VwfgRCISMpS?=
 =?us-ascii?Q?/Xx1GWkkEZXGxAe+TCzBhXIhvBhw/sHG8y8HQszrZm61X/X8kB+3BeE4RQmA?=
 =?us-ascii?Q?OtlMQp1ZNSwfXBasZ348K6G0Vg935oyjwRc8APBx2n98syiBFC1uWfBfyuju?=
 =?us-ascii?Q?cCJEVVlaFMGZCpndSTv8sEPOtMABZ/i6QtlPj2HAZAW3IGkHAa1r+RFmr9sA?=
 =?us-ascii?Q?XnOGzFRvPM0k5FyDUKdVKsPeuPDCP2UUCTMBbTmlJgQA9oWIF8Qsaf0oU8kc?=
 =?us-ascii?Q?RIOGgGfPfEUvBE/XE+zNP1LpwZoBr6yVSgslbX8Algz19QZtL4EFx+9I0fax?=
 =?us-ascii?Q?u1QtwfUt0zP9565VXbEeSzofmAqGUV3rSFswogNdxflVJ9yoXdSPw9W0mr8J?=
 =?us-ascii?Q?X+9fkVT9ACIHv5dKg6h/37XBgrrdZuKNdAx5b2bf3WnFjQK2YPkCbKwQpCXp?=
 =?us-ascii?Q?XulbQWnPFDoqgFkK4Y697ZZ+1/ry0gzwrVHRc34TjmuuKT9FN3lWPMAXJJyW?=
 =?us-ascii?Q?+xAkp49SyanvtjtGHppL+uZ1rCCuT+AA2hYzYeqYPIk2JCJWStMT9+uRIVQv?=
 =?us-ascii?Q?+RGgJX7VVRXt7FKlsQmvlKaL8tbsoIayu85pFotF/cQiHJbBdu9axS6QLT5A?=
 =?us-ascii?Q?yJhRQtq3mFgbgxk0coa3SDkrZLIYO9ynnieato+RZToKglwfGjjfhI/U47e0?=
 =?us-ascii?Q?V4WVdx8QBfAOAh2d7DkQdlh5Lq9P60W1scP7a11iEzCPLX3bQXUzYt0bKy2+?=
 =?us-ascii?Q?ADirbMItXvNzxVYSsDpHt5hFSfybHmyxOC/XMVU2gxjcBoaEbKFG+BJZWgeV?=
 =?us-ascii?Q?PvfKfwmYydb/tFOc81drFZWWXlx2qBJfaPaE7YMJXTgWbB0VLwsyt3WPTqrW?=
 =?us-ascii?Q?LGNsr8zsk7NexOTeum5imToaVTLDK+XLuEckxgWX/KJWfnSnH4XWMVPbSzmy?=
 =?us-ascii?Q?Ap1d9U80HSAQgtVqcSPOWBwjoMcEmaUHvI1IWuR0m2ayFTF8lQ1V0Vk65/Su?=
 =?us-ascii?Q?j8GvvmJJGSfcCCU2BqhrlrwTj4MGdXM024UJkf58aq0gs9VbzMfNzyl/R5ee?=
 =?us-ascii?Q?CpibVzkgcLKRnsejYpSWECxY0WfHXwokMew89XlYMhoDhO4Dv/Gd6RPxZUJQ?=
 =?us-ascii?Q?abZtAB7F01wFEYLZKMUgQr08yd2eo213+bqzOKe670Eh0FQeDReJEWxUoGyT?=
 =?us-ascii?Q?MOQVbBmEQIGqS58MPkZorqT7NGy8cQe96ThDQ3DU3CGa/Q6mP773iivEpv7S?=
 =?us-ascii?Q?9D+pwnWh+PjBaeBFEOY2yXNny9LRHPrzlr7iPBJk8DixlJswYGasYJMPLmiF?=
 =?us-ascii?Q?5LQItuZ5kGtkZTd6FgoCnuX8gRTwjVED9wS5z9aO9awYcfixERz8GT8K5P0M?=
 =?us-ascii?Q?pZYjAPSSylNlQkP6iz2213IlTy3597xbzDzCRggUnCZIzLMaW9t0+b89Z+s2?=
 =?us-ascii?Q?45CW70ZEBt6u7S1XAov7fm4SUdE6Yj0ojv2eis/H?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 284af00e-cbcd-4ff8-dcc0-08de0745b32f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9627.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 15:08:27.8438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+czQJ3nMNj/DJ7iTJP1X3RpA4TfP0Sx67WTgELZLw/g+P6wQQZ9KNf37WHfzClbHF8LZ0UvH/QN83105x//LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10059
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

On Thu, Oct 09, 2025 at 04:09:29PM +0200, Boris Brezillon wrote:
>On Thu, 9 Oct 2025 16:08:20 +0200
>Boris Brezillon <boris.brezillon@collabora.com> wrote:
>
>> On Thu,  9 Oct 2025 22:00:39 +0800
>> Rain Yang <jiyu.yang@oss.nxp.com> wrote:
>> 
>> > From: Rain Yang <jiyu.yang@nxp.com>
>> > 
>> > Some platforms, such as i.MX95, utilize multiple power domains that need
>> > to be attached explicitly. This patch ensures that the driver properly
>> > attaches all available power domains using devm_pm_domain_attach_list().
>> > 
>> > Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
>> > Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
>> > ---
>> >  drivers/gpu/drm/panthor/panthor_device.c | 6 ++++++
>> >  drivers/gpu/drm/panthor/panthor_device.h | 2 ++
>> >  2 files changed, 8 insertions(+)
>> > 
>> > diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
>> > index f0b2da5b2b96..6f40d053b16c 100644
>> > --- a/drivers/gpu/drm/panthor/panthor_device.c
>> > +++ b/drivers/gpu/drm/panthor/panthor_device.c
>> > @@ -218,6 +218,12 @@ int panthor_device_init(struct panthor_device *ptdev)
>> >  	if (ret)
>> >  		return ret;
>> >  
>> > +	ret = devm_pm_domain_attach_list(ptdev->base.dev, NULL, &ptdev->pd_list);
>> > +	if (ret < 0) {
>> > +		drm_err(&ptdev->base, "attach power domains failed, ret=%d", ret);
>> > +		return ret;
>> > +	}
>> > +
>> >  	ret = panthor_devfreq_init(ptdev);
>> >  	if (ret)
>> >  		return ret;
>> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
>> > index 4fc7cf2aeed5..5ecb541ec67b 100644
>> > --- a/drivers/gpu/drm/panthor/panthor_device.h
>> > +++ b/drivers/gpu/drm/panthor/panthor_device.h
>> > @@ -196,6 +196,8 @@ struct panthor_device {
>> >  		/** @recovery_needed: True when a resume attempt failed. */
>> >  		atomic_t recovery_needed;
>> >  	} pm;  
>> 
>> Add a blank line here.
>> 
>> > +	/** @pm: Power management related data. */
>
>Also, the comment is wrong, and it would probably make sense to move
>that to the pm sub-struct since this is PM related.
thanks, will fix it next version.
>
>> > +	struct dev_pm_domain_list  *pd_list;
>> >    
>> 
>> Do we even need to keep the pd_list in panthor_device if we don't do
>> anything with it?
The second power domain is typically used for frequency scaling. The driver
works fine when there's only one single power domain. That said, I will update
the implementation to attach multiple power domains only when the domain count
is greater than one.
>> 
>> >  	/** @profile_mask: User-set profiling flags for job accounting. */
>> >  	u32 profile_mask;  
>> 
>
