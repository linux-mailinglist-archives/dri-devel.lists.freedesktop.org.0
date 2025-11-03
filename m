Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10EAC2A644
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 08:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA90F10E15D;
	Mon,  3 Nov 2025 07:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LXM3/8Px";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012035.outbound.protection.outlook.com [52.101.66.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED91310E15D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 07:47:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkIrG6XTMHDM6RzGc/QSxvetN5e/SwHUE8Vn3KzuLz6UW1qzSfNtZGBoOJrUDjqB0HfVq6ObPTCCJzWzB9xGuBYXvdubD2vMqePgYN1XRuAPRfDjt3mpInIJqCOsDfgHcogzmNHNQe57wGFb1s7BC1O4gD5qP3/HUOiGkARgf264xQnQNuqKFDHeFM8fB1yiHFpd7mXZAtYpfSAsAZwFnJR0p3Z56M3S72pdAG+s0/JtFt4rIc38fwabwkLVXzA9MXbqOTu2pog0YNOSfoRT+PY75thUGPznmweoMLp4Tp6vH18E6QzbGR6dKeUB9twcL7YU9nwPUIKh4L2VxJOkDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJPjDtX81MIbT+rib2vs4mPM6eY6mIGIZy8e1nZAwQE=;
 b=Vb4Fnd62Ob02ZBYyZL2Bt3NN5wieZZwmLff1KjospA7TeWyG7o5KC/Py6hdplQ9NTHwavpJYb7yWD+VjwOpAPjRnfVx6V0gs5Po2T4REXeJ9q++QHGvuYIbguO5M5U1/EjG4i9KNGl2B8ZBrTwjCrqDvHYHJZybsDy6BqS1yixny4zOnqd9NcsA8RUcJqklX+LjCh261ynbqIJ6c8WkZujM5nfZfkQ1cQHwQUjyHt3cMELvvSwbzf14WaP32znabWYhrPGd98tNHQKmi/b/BwoilkkXXsFvm12LKqMt4ayZoi6n9oGA6R8c30z7ccHX/sOS/m1mj4EvPPfTIFC7GHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJPjDtX81MIbT+rib2vs4mPM6eY6mIGIZy8e1nZAwQE=;
 b=LXM3/8Pxxk9EUI4ilfLhsSylfUQSfKzZhnSLE1YfSpF2u3RPUZq+/a0t0acIpyhdDCDZSFo9UbEKyklLulJNZXdiGjLOeryOpGM8bMza2rF0w9i/caPQ+g0/bYMVkhPsFHFY5OdYZelljv3w4UN0lrzZpGVaFPDTc2Q3jysnQsmfyjAHgNBt9hvBFjN8SxptWnY+Obuyxb1PpAxGLpqwnlpLFB3V5f7ob/1JOqcV9x0b0HGkAGR9y0xTDVtoc9EEMp0WNkqMrGEq1rX/vVRW+xShFBd4MORU5GeYGGE5TBQPm1Wax40sfPEcl28E0JWHBNYI6Zwec6lC9baXXV5XGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9624.eurprd04.prod.outlook.com (2603:10a6:20b:4ce::9)
 by FRWPR04MB11198.eurprd04.prod.outlook.com (2603:10a6:d10:171::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 07:47:04 +0000
Received: from AS4PR04MB9624.eurprd04.prod.outlook.com
 ([fe80::fa4e:dc6f:3f71:13b7]) by AS4PR04MB9624.eurprd04.prod.outlook.com
 ([fe80::fa4e:dc6f:3f71:13b7%4]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 07:47:01 +0000
Date: Mon, 3 Nov 2025 15:46:25 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: shawnguo2@yeah.net, airlied@gmail.com, boris.brezillon@collabora.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, festevam@gmail.com,
 imx@lists.linux.dev, jiyu.yang@oss.nxp.com, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 marek.vasut@mailbox.org, mripard@kernel.org, p.zabel@pengutronix.de,
 robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org,
 simona@ffwll.ch, sre@kernel.org, steven.price@arm.com,
 tzimmermann@suse.de, xianzhong.li@nxp.com
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <aQhd0Ri4CviuGMOE@oss.nxp.com>
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
 <ba95487c-ada7-48a4-90b7-fd99a0278f51@mailbox.org>
 <aP7DZCMk1pQ7wsFo@dragon> <aQB88c_AEC1RAZtH@oss.nxp.com>
 <aQCIAfyUC6N5y2fB@dragon>
 <f9057853-8b43-4ab6-ae65-ee5e4d569c46@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9057853-8b43-4ab6-ae65-ee5e4d569c46@mailbox.org>
X-ClientProxiedBy: SG2PR02CA0119.apcprd02.prod.outlook.com
 (2603:1096:4:92::35) To AS4PR04MB9624.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ce::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9624:EE_|FRWPR04MB11198:EE_
X-MS-Office365-Filtering-Correlation-Id: 48047412-4a7c-44b6-ec1c-08de1aad2c42
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|19092799006|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fCBJ1yM24PvP18WiYcM/HYZYcyW28a4+GUzhLCy7vIq06mHIGcGvR2ncINtV?=
 =?us-ascii?Q?tXTlJSVefOtZeiCyTDbDrdXUkF1jPOYlDu+hJ9CVx9pCmaqGPmu7S6YZzBoa?=
 =?us-ascii?Q?3SmLDyf7QdNZ1UBB88m0l9ZoBbJq9wJLTUYJfuTEEkA1isAszr1dZ2dZtvr/?=
 =?us-ascii?Q?8mCp6QD0JFArNOCVzs91ScJAhhFal+DmbsMtu0hYpOZEIw2+emZfHXOmTd0s?=
 =?us-ascii?Q?17Ya0PnCkLqD7GO5vStnX1wv5Ifrf+sghXDtYVSf9J+7PzfT2YvTNDoJMGRl?=
 =?us-ascii?Q?PiGllcErA/3Fd1qnE871mpd1trYBhR4TqG4uifO0lZwRh1Zi3lmTIEN3Wa6e?=
 =?us-ascii?Q?CmvuzRNWAYFlByUqliltAFf6JpgtZ31tbsXgp8TPfrYv13ng7mYic2BsgYND?=
 =?us-ascii?Q?c7TFVMIypvnMTgML697Qw7s+8rIRmH/nS8akKoiemk92Wd+X8J/0PwaVno9G?=
 =?us-ascii?Q?Bl7Jrc8qEepIt1qmmQ+vW2Z5D01hgHFwxcYtArpO6SAIsiXxCdDvlbsNOpwv?=
 =?us-ascii?Q?lOe+MyMe3xvqEl9UG2DizAMmvlazftxSjB2W3nZyBJtAkxeUIsZ/PsYJHmvK?=
 =?us-ascii?Q?bIOmBdKNc7s4aEDIFTC/E+zQU0XfAG6++NizboGLbQNvdrT3VotrvGY1Hszn?=
 =?us-ascii?Q?7bfCPhtnrA2cr7Ay95tKbCq+3Hl28zEWuasjtXon/jNG45V0YCLUtN6xeIPG?=
 =?us-ascii?Q?JOOB4lFdYBMnppNOBxHS+ew5nuyemRdp3ZMJWpjkl3wOmIjU/8xmErJnqu/l?=
 =?us-ascii?Q?vt6hkkZvocushP2cwo1w6FrIcfZKj+Uyq5JfGvkezObS0/pA1JFhVoENZjs0?=
 =?us-ascii?Q?8O/6rxAtjPp9ToqnzfX7F8pHB8W1y7EkgU5eztLig8sTNa40M3bxuEgGpQ+a?=
 =?us-ascii?Q?7R1gAr/APJx7O86ATNeIKywEc/sWA6iMHsUDMG6b0YxUBdN5wgMQXfL/Q3zt?=
 =?us-ascii?Q?7cVJphAVs6EhHZK2lLKWZiOBhAsHnVcKy+E+EPjdoednsTC7nDh1VmmQuyN/?=
 =?us-ascii?Q?OfSfJIuJKfXXnYeI3P4LOB+FvtV98MvWuxiuJpqpG15QjgWp3nlIh4iAtVfl?=
 =?us-ascii?Q?Jd2dVfHAMpiLl+IMpGTjNxujEO7HoHktVJ4/+5SDBXxjhlGxblVz1wB5ihUh?=
 =?us-ascii?Q?4dz4fublFnNkVS7qF1nOHbB08YW4HXGaS2xXch3uu0SAhvGWMzUv4K0b75nH?=
 =?us-ascii?Q?CHJkIZyoqwhQE7pQjn8ULnYkGz9HtfPo7l4nEkhtbDdSV6PFQsaOBu/9DAq5?=
 =?us-ascii?Q?yA+VHY6AenzkVakGrmbw3fvMNqmg4msAixhfzt2TC4fO4XC6bDX3mftJL8Lr?=
 =?us-ascii?Q?cebEiJ6kzNuioZtwRYVDoalFqH8NzYX6odWyOTKYUJogHKgO3P/uONHNs325?=
 =?us-ascii?Q?AiCocOz+K6rAyppPM7zOJ23sra8ihX7sbbYmsgZHGvkNdOV2HDecuLB6FlCc?=
 =?us-ascii?Q?oySqrgxfPas8S+e4OF36l9vVWWBl9rLDpzz1FP8MQHxSEZgMNAAfvw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9624.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(19092799006)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/xil5HMShN+zqD0cJjWXpM4t9/7SH9p8HcnzClP+IcWMlBKCdW05KxKS7qwu?=
 =?us-ascii?Q?i+k9QoYgHLhyuJO3r/dQAKtmViOdVofcLZpt+N6WOP+yvXFGrrsZozD9LxU/?=
 =?us-ascii?Q?1a6kCk9iv5tVpgotFvQqS86h9a0jmhskZuesTZbrQtAq5Ro2h9BLei8SNJAJ?=
 =?us-ascii?Q?r5Rd0cceun0Fo9Yc0VN+0ixsXsbw+CQ5OKRs7jq5wPu8UyX4jOZYUrXpU/Yj?=
 =?us-ascii?Q?8eRPxI6soARlIFyCYEmus4DExJQXjG9aROSVPzwNEBaCzEyVG0xom4dJnrgF?=
 =?us-ascii?Q?ZCVdYNSvGAQ2jtgTZzRYzBvbw5jcOOGN+CAJNAHegtYqrTcPi+826KSJWOR9?=
 =?us-ascii?Q?LEkRVxBMDBcGRVY/+rH7Yut9dJlqw57m8UR4bjRNEYOXemJzoNaJmayYeKSd?=
 =?us-ascii?Q?laNI4S3U/QoyzgJW/vBO6+xcGRvE+6kWsybPBsLPO+3fBq/xXCAHqI6HF0Mb?=
 =?us-ascii?Q?K30zrHXRdVFje1ycez340hpgzzZWEkjmAuIQSq7O/BileV4X8aiAzLnkKpwk?=
 =?us-ascii?Q?7MG8AdnglSAJAto2i5sg8a2y297adyEETJrpl6dR5foowFYMYRglLWUDs0wn?=
 =?us-ascii?Q?q0LogmZDFY+osTHylE3Qnwf0gaosF+K2DQWXHkAC8z4G+jnRToMBu3vDtTHz?=
 =?us-ascii?Q?igEUa0nT88Z1r71f6FcSjMW32S8c7WcWWxHHWswy8l52jn1YWzcqLovVsyN1?=
 =?us-ascii?Q?bVmc11FUI9mRZ2VUn1fNJZKkjl5/BHnmnYWDhHgTdgrCIoGG+QH9XmMNdPgK?=
 =?us-ascii?Q?ABhEV5P0iIQJE9AdSzYwZQCBzQST3STGkDRk8nZn8u+rLZhW6jBf07h0CZzV?=
 =?us-ascii?Q?qeiTU2l5KHdXYV4v2ZPPsftBugc5xpvGVOOGEjdMEWZZ606CfEDbgqYce0c2?=
 =?us-ascii?Q?zWzBwuuQToxNHSaOHlTy0HjLuku4Ay+HfCZGypYdczDSHefD3OPbjT4+pJTq?=
 =?us-ascii?Q?Cyk+4WqWUoAiXEp6x09644wFqrDfJAh3Ra4QoJQ0HLrnJCWGBbsAFNwNoD1F?=
 =?us-ascii?Q?P2QXqWFcbHI63/UsM+aD4Xu51Vnr/AjodQHU/XnhbpSgqIj/vhR1BXMBy9RU?=
 =?us-ascii?Q?yyY/2QvsZFXsFs6/G9Y/ujuH9GkiUvwkgnZSEdJ6wzRYIkJA96u1xbPKgIKL?=
 =?us-ascii?Q?fHjjQkYpgrqn9Z058UJCITToAgVzV7L7WacN+b3wk0JvEwRvzqfrcerh7QAa?=
 =?us-ascii?Q?4D9PxrgTGbHdqA+ZyBwCrKibykR7CLRFN2dIOxeu8BtoM8rb9i89SUX7Zfx8?=
 =?us-ascii?Q?p5HN2ywqjUsn+BcytuppFTXeNlASFXWKtzbGrvxYgIuxVviqYFa/Dw2lM6oT?=
 =?us-ascii?Q?6a72DHfAG3Z4zz6JfTOp+XhEX9wvrrQ2JWHXKu33jT3e0NVYYMKsphwaAMxw?=
 =?us-ascii?Q?6/ldL3hHb6HI1jTscRNhJhJxC/1QsoGLUeW3QaY4lDjzoP4oYU/lofwX2UEF?=
 =?us-ascii?Q?lTLmZxPiMd0RjrhbjhkUF+Z4IBRJLGA8KkTdOjBJYD+dP9XFgYtdERdwierE?=
 =?us-ascii?Q?cHYuRDLH1IedcrcTbq910zK7++gsCC0WUnmj36bzgT2K/pAPHpkQ09IEXx+z?=
 =?us-ascii?Q?VTWAXjCq1vKmt/go6St/hvOEac4vDpVpC9aexr3K?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48047412-4a7c-44b6-ec1c-08de1aad2c42
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9624.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:47:01.5101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfXytg699uakdkun4LZMA6vnkqxO3vPglciSjNMaGbv987JArP1NYO/SqryGdoOdBbtJ9u2TEoKRe4azv3whhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11198
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

On Sun, Nov 02, 2025 at 05:02:37PM +0100, Marek Vasut wrote:
>On 10/28/25 10:08 AM, Shawn Guo wrote:
>> On Tue, Oct 28, 2025 at 04:21:05PM +0800, Rain Yang wrote:
>> > On Mon, Oct 27, 2025 at 08:57:08AM +0800, Shawn Guo wrote:
>> > > On Sat, Oct 11, 2025 at 12:53:29PM +0200, Marek Vasut wrote:
>> > > > On 9/25/25 10:38 PM, Marek Vasut wrote:
>> > > > > The instance of the GPU populated in i.MX95 is the G310, describe this
>> > > > > GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
>> > > > Is there still anything that should be changed with this patchset, or can it
>> > > > be applied ?
>> > > 
>> > > I'm waiting binding change to be applied first.  Or is it already done?
>> > > 
>> > > Shawn
>> > > 
>> > Hi Shawn,
>> > It might be better for Marek to remove the always-on GPUAPB clock from the DTS, given that
>> > it's an SCMI protocol clock and the kernel expects it to be available during operations.
>> > 
>> > Also, the gpu_fix_reg appears unnecessary for the driver and could be removed[1].
>> > 
>> > [1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a8cb5ca53690aa809f4f65e14192753073e61a71,
>> > https://cgit.freedesktop.org/drm/drm-misc/commit/?id=02df3543f3e0ea572e2c739605ebd6c20e1149c4
>> 
>> Ah, sorry! I did not know we haven't reached agreement on the change.
>The feedback above is new to me, so I am somewhat surprised too.
>
>I'll just send a rebased V4 now.
Hi Marek,
thanks for your patch to make i.MX95 GPU upstreamed.
Maybe I didn't express it clearly in the previous e-mails.
the always-on GPUAPB clock must be removed, otherwise, it will result in redundant and unnecessary
function call to M33.
