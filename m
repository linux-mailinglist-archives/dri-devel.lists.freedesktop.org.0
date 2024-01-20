Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83768833262
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 03:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF68D10EAE3;
	Sat, 20 Jan 2024 02:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2079.outbound.protection.outlook.com [40.107.104.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8C710E1EC
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 02:02:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFCx2bahScwm9Yf7DPxoSjvIWiEQ0x/dmw4aKkAb5gMMoqYfYkIZyn1nx0XQ1v9s+4v7T3OX9GOtE/BidlnVE/g1uc9wsAPoIHnPfr9Fx6QWc84pOfxiTU7r+ujAdGMSLjp3ykWfu2ADyCvKUUjUTfP6kOQR12UlziMAImFYqHj/iWDR/SCaFAL0AP9LIiVHMYkI9BLLVHx0wPZZBFRjtsgceyCwbpAgvSdFsWHlhxjmcg2ExbW8TDgmqf/iaStYt/SfhDFq+d2651ptkZnkv/26TVOmuMyxtM0LWjAyuCunjw0BiCdaRxgmymCLCEy/ufYM3sg0lAcWPuGZLXQFQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kj5XQXn5L+EVxBpk7yA3pTebgM8lKWJFP3W1zlZ6wrg=;
 b=bwsfwk7jrkIQ9Pi9ClEXYDAmf75vowc1IeSLsLz/u3fY9ywyKcwCaKO2PzwWeyj2cIMzzja8Y4/N5WeCQf84ZaB4v0ZCCgyQFvssynjJcKiJfpbfcYOjaYuoUSDs89fgpHlEuVakz5BjgG1pjjbpjs+eYrQ8vzC2Oc4sk6r1zRXhqIPCtIcr4H2VcYdWeGlotz1MXvLrNdrYSfnRdPxI0aFx1wuRj9Ilof+dzGvXck3RJ8mYceEHr0tnICDFD8ZT/LOld5UKRJyx/jvWjWEt4uhhOk0stCVn7N9q+6//1KTD43rkrBpWkO5/NaoP19D1Tv3K3SHiD674KxbUrc9pnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kj5XQXn5L+EVxBpk7yA3pTebgM8lKWJFP3W1zlZ6wrg=;
 b=TPoYOfbKa1ILDW/fCATsA5M6MB+MOTOgoKlXJITIQ2OAhRqj89DyNbrYfExnP6ANsDTK0EIW8T3YXphf+XMyiXv0AJA9ybW/Ov/0Uhur+Ha7EDO6QtwxKjUl921fyGyRa9j5tpnY8wZ3HAi8/15anVL0Aj6Eg/y7BNaQsnazSPk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7785.eurprd04.prod.outlook.com (2603:10a6:10:1e7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Sat, 20 Jan
 2024 02:02:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::b8af:bfe5:dffd:59a9]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::b8af:bfe5:dffd:59a9%4]) with mapi id 15.20.7202.027; Sat, 20 Jan 2024
 02:02:04 +0000
Date: Fri, 19 Jan 2024 21:01:57 -0500
From: Frank Li <Frank.li@nxp.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 1/4] usb: gadget: Support already-mapped DMA SGs
Message-ID: <Zaspld3SOwDftYhj@lizhi-Precision-Tower-5810>
References: <20240117122646.41616-1-paul@crapouillou.net>
 <20240117122646.41616-2-paul@crapouillou.net>
 <ZaruU5BpQF8SeZZS@lizhi-Precision-Tower-5810>
 <59799a40d8cc425dc5a847a0c8e25730db4fc5c8.camel@crapouillou.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59799a40d8cc425dc5a847a0c8e25730db4fc5c8.camel@crapouillou.net>
X-ClientProxiedBy: SJ0PR05CA0137.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3ce63a-6d60-4a39-9333-08dc195bccbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6rBeEKEMyZa5yc+6pKasw98E3TMJA9pt1f9ED+yHZ2m773l4ig9pNwBUQTSxHvAsX4WEqPWf/+EmvxK889sP9KOlJGOCD2sJ9LlnDmpbZCLmo/JDsEIYb9kjSQzZIbi/qy+ONtHWiso1Y09DQziua7ZpgkHHFwsNDkzVc0W3/qV4RLpjUatzRWmjAMjeZD+pVxAZn5p6EjACCbofccCe4bRy3FI2j2e0ML4Y6IJ0Z4jiVR0GFp8/h6HLT172ty6uS76dSJUfNdqK1XZXqbJjRcAnH3S2JIBhLZXLh6e+j14zEfui/vch/e8aYPu4ZBMRk3dWQN8DpgCS1PzWrp9827JLwr/VMszOZkBz0rOqZDg5be+ANjvxCfPGSYP6LoX9gyAt90awq6KHJ0RU8qxBIszgI7giTtxNkboMANlWDBwIi7JNkmVWVZlY2Q16lRnsKNVgKgASBE3gGkS2nJmN/TAis5GsBWTvWeMjDn5+/NYH853MTptObDPiM6LlGwhcV0TqsJIAH0Cqhfsj8TJ/k10pQ4GDNcG6DrCTIRe4HxPXRuc8F03zyBcBtkrf9qO05TfmEepOwmdUDr9RCI26sI7r3stl7aZoQa4uNRFxMI7T3dAsBUD2ezgKSOpu/VpA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(366004)(136003)(396003)(346002)(39860400002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(6666004)(41300700001)(478600001)(6486002)(66574015)(6506007)(52116002)(83380400001)(26005)(6512007)(9686003)(86362001)(2906002)(316002)(6916009)(7416002)(38350700005)(4326008)(54906003)(8676002)(8936002)(5660300002)(66946007)(66556008)(66476007)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7UuQ305yYTWllyjUv2dZq1I9qsFttpWiI1Zsyl4jxbMC+WQCS3h189a6Hk?=
 =?iso-8859-1?Q?FFWdyM3CF0a5cIiap/f1/i36OeoaLEbJGVcVjpZvFcVLPyzHcD5jnfgd3N?=
 =?iso-8859-1?Q?WRUK0icCxevnIGEmz3P3aXwGMDnx7sBLQChCNZ/mSxVJPkjxIX0Q9efq5M?=
 =?iso-8859-1?Q?BX2tMEtBvpKle/ZD9vnUgYac+oShXdiml+1XQMg/TX68WC0nWwOrXKVFVq?=
 =?iso-8859-1?Q?IJU1TEIiERJBND7vc66M/+NLks3wQkMA4AkA7s+bFyQIv65IaldVXPaWIJ?=
 =?iso-8859-1?Q?sJqrzvUWyS6ChxAIZW/DiRY23zHA6LClX6aESWwwd69cRvm7kGMlwcwuqG?=
 =?iso-8859-1?Q?4UMxi2sXB+VB24an02eKwyNgjbND/MkAnlvHup9n9In90gCnKx1IWS+pQd?=
 =?iso-8859-1?Q?A2CwtHtwSsKWfY1Bs+uCjeCBELL8LomjYsHkCrclFEJ7InhBRkHhoIeSqe?=
 =?iso-8859-1?Q?6+y4AuAmPVvf5JqqszskzCz3geqiBcOIzfXVNxAvE/p6G08T1fErSEz0HS?=
 =?iso-8859-1?Q?SKTpmW2J4jpFiulYyQpM/hX3VgHUU6zYS/WKGNyKbQpWHhFvMj86fb884i?=
 =?iso-8859-1?Q?MqHa6hNLo3Lvbc+EX4bt15fpcyI7AfqFoiwTzIC3hhyWVTTP8JAxnt+bOO?=
 =?iso-8859-1?Q?GZtzTu9hGeo2PWX6c5KbXWyu3fehDQl6t1eRJPpBZ4R4HP6NHU8anmA2tp?=
 =?iso-8859-1?Q?C1cWTBIrOUiLOLh6rkxLA6WvRzPuDo2jEQJWx74vdXLFbiuUJDNFfBBAN4?=
 =?iso-8859-1?Q?tmKLQAn4D8zJfqyGYwXBuFbzb2QRHXvqr2yEcQeXKUE0gqV2q03uspJm26?=
 =?iso-8859-1?Q?G3xcUBBF7tMeDXWsknR7MEbfmHzn4mIpzRnfXUi1jTzEnqApR/7/IwlqeT?=
 =?iso-8859-1?Q?Yqeyqe/znOkm53aXs5QKEmcxTyYxP32sahV8InQRquubWgxIg2VnDef5ZE?=
 =?iso-8859-1?Q?FS37FvRUfx3aTJPPorAupY/GGYSFh547v5f1g2M1Uqf+J1++CD4f6yjcyA?=
 =?iso-8859-1?Q?egFtEH8ezELc1FDeoFY502cziJxJnTY2jAyq1Fs4WOOH9d8hgp+DdsyVPz?=
 =?iso-8859-1?Q?5oDcx7GSfwrPvUwQHDcogK1iOumPErSizl2BFXCJKN5QUpEQEigwQ/dZ4Y?=
 =?iso-8859-1?Q?weQpyLriOIhU5094rPlwco70S67zcCquam4XyhTq0Mw8+MxNcbDK2UjyER?=
 =?iso-8859-1?Q?iESFwHKKg6oKd0Z8tMxY3Xg8PGjted1TzSA9dGe9U5hrJTnNJZfNPjhQRx?=
 =?iso-8859-1?Q?Pd19iam/gRTXaeC1TVpz3aRl7jiKTv61jpbuchL2r6nUOVU6fIveEWyghN?=
 =?iso-8859-1?Q?l1zhjbsAZ2YwPgFyYF5t1q4rslwBhBHdNtliTvYFMHuZlKySynMsWpkPiV?=
 =?iso-8859-1?Q?D1ur0+buy4lU/08Ao0lC+9fDuQZGUGuoBzAAt3ekPR6WQXTt4Iyg/O3WaZ?=
 =?iso-8859-1?Q?6ZUysEwYa0z10hvsIMEnAKFNrFLzgcj2415UgZKZ+XFTNTIFIIdlQFekCC?=
 =?iso-8859-1?Q?VT9ljHEKdoiVkeE7RwaH5Z15pfjpBvKZbanGTZnUAOWD/Vj9OT9UuxHVxR?=
 =?iso-8859-1?Q?AvWZIah1QrHZWaDBECejnfuFCht7pnZURMkXAXc3V0tu+YKJWJ7t9Jc2Xc?=
 =?iso-8859-1?Q?mA6MFyv2bkrLLwUcWJGV5+bPKk+7KuGNgi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3ce63a-6d60-4a39-9333-08dc195bccbe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2024 02:02:04.8370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yyt1PYDe3KXT1m0RJt1iRsYz9slJo2lt8Ug/74TwzNzZgSDQVTdZvRMvAPJ8u7gmnWUluggCGMpRoFxdiorVBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7785
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 20, 2024 at 01:14:52AM +0100, Paul Cercueil wrote:
> Hi Frank,
> 
> Le vendredi 19 janvier 2024 à 16:49 -0500, Frank Li a écrit :
> > On Wed, Jan 17, 2024 at 01:26:43PM +0100, Paul Cercueil wrote:
> > > Add a new 'sg_was_mapped' field to the struct usb_request. This
> > > field
> > > can be used to indicate that the scatterlist associated to the USB
> > > transfer has already been mapped into the DMA space, and it does
> > > not
> > > have to be done internally.
> > > 
> > > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > > ---
> > >  drivers/usb/gadget/udc/core.c | 7 ++++++-
> > >  include/linux/usb/gadget.h    | 2 ++
> > >  2 files changed, 8 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/gadget/udc/core.c
> > > b/drivers/usb/gadget/udc/core.c
> > > index d59f94464b87..9d4150124fdb 100644
> > > --- a/drivers/usb/gadget/udc/core.c
> > > +++ b/drivers/usb/gadget/udc/core.c
> > > @@ -903,6 +903,11 @@ int usb_gadget_map_request_by_dev(struct
> > > device *dev,
> > >  	if (req->length == 0)
> > >  		return 0;
> > >  
> > > +	if (req->sg_was_mapped) {
> > > +		req->num_mapped_sgs = req->num_sgs;
> > > +		return 0;
> > > +	}
> > > +
> > >  	if (req->num_sgs) {
> > >  		int     mapped;
> > >  
> > > @@ -948,7 +953,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_map_request);
> > >  void usb_gadget_unmap_request_by_dev(struct device *dev,
> > >  		struct usb_request *req, int is_in)
> > >  {
> > > -	if (req->length == 0)
> > > +	if (req->length == 0 || req->sg_was_mapped)
> > >  		return;
> > >  
> > >  	if (req->num_mapped_sgs) {
> > > diff --git a/include/linux/usb/gadget.h
> > > b/include/linux/usb/gadget.h
> > > index a771ccc038ac..c529e4e06997 100644
> > > --- a/include/linux/usb/gadget.h
> > > +++ b/include/linux/usb/gadget.h
> > > @@ -52,6 +52,7 @@ struct usb_ep;
> > >   * @short_not_ok: When reading data, makes short packets be
> > >   *     treated as errors (queue stops advancing till cleanup).
> > >   * @dma_mapped: Indicates if request has been mapped to DMA
> > > (internal)
> > > + * @sg_was_mapped: Set if the scatterlist has been mapped before
> > > the request
> > >   * @complete: Function called when request completes, so this
> > > request and
> > >   *	its buffer may be re-used.  The function will always be
> > > called with
> > >   *	interrupts disabled, and it must not sleep.
> > > @@ -111,6 +112,7 @@ struct usb_request {
> > >  	unsigned		zero:1;
> > >  	unsigned		short_not_ok:1;
> > >  	unsigned		dma_mapped:1;
> > > +	unsigned		sg_was_mapped:1;
> > 
> > why not use dma_mapped direclty?
> 
> Because of the unmap case. We want to know whether we should unmap or
> not.

I see, Thanks
Frank

> 
> > 
> > Frank
> 
> Cheers,
> -Paul
> 
> > 
> > >  
> > >  	void			(*complete)(struct usb_ep *ep,
> > >  					struct usb_request *req);
> > > -- 
> > > 2.43.0
> > > 
> 
