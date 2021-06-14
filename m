Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B84083A7232
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 00:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8611289F8B;
	Mon, 14 Jun 2021 22:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E9D89F8B;
 Mon, 14 Jun 2021 22:43:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYEwP63ahiyBU0PF/ShkFa/wseyI/sYKdcE3eN/9xXu1NxMlVKimTJqtzTPj1/iIsYQb7E30ottLdGSYliwzZzHpSz+OpzAbOipGuH1uJe38qmH69jVv1Hq7acVHY7peURm1hawEHK+vofom+ebQwQrxTMf1I6C8K/N0olJWc7VH/EBVmwxdsnhGNomEdaAwqsD1wOOrjzwVb1cxSesm6eOkWaTFHLzIf7F9obhwHP9jq4/WUqL++5qLdVi25QwHMYMUEPDYBlRnE2MzBNl3HbwAbx/Fuk0JRIUaxaY4ZZPcmybe5EQraVS06zxcVLIEiPmnK4YMjNMUiBgn6GJIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzjBnJjgpYhyA3oDnyYY08XhT2AAzWICrTNboJTc1EA=;
 b=a81zQMQJafvSPyXN5RWLxC/iyDqiAlnZc07PlebsQan1JEpCif7rzLmCneYYbI1G2NIDUJTU9BsOiO7iclIOe9gFwGTUXGffBGv7NJF5ghiyLdHoNqEG36ZlS2oQFfwfwgrIx5zAc7VkxRBFPpzSBXz+lxtSlNAtzACdP0jDMptSLYStHNNr5shjjNkeM6yLHz9VQXvFfvKXhaGuSlFK5ZoD3+GnoSSDkfQiYeHqLokxV9K9NMNgSyka90RH1Ae1YM+vE9HDMS9NfYSfesMoByi9qFJGZfyiMeBleNuziMgxcLfwa93FDXLqFwpWniaFQhMVU2K8YRbKS5sYZ3UMkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzjBnJjgpYhyA3oDnyYY08XhT2AAzWICrTNboJTc1EA=;
 b=svWo3CR2W43AoxWhUfdTAZReNm6KICodpUOPfJgjDVzSxDv1bElJGQ9OxIGsQz/2tWyW78YweeTYCkPiCJz+qVTDWg6yATQ5Tq/G27nFU19PiWhjf4f6ClpTI8gkAY4o6U3z2jD8dlrNBRRKa7tP5OuyaZ/LMnnO0vYHJpj4sDfRTwYB9F8xdg4Xx58Z7ecn/p8GT4dNcQjw9lnS4MySQ+Jxo3YFjQlnS7e+LKnIHNbdkdgy+1AiPEnwtl/CCPkJzAWkDRi1ioPVtKIvoAWC0rnjk2q+eAYipMZrAW59r7M4fhfw3yxJp4n0o+uvtELL47jB+Pd2ML080GXM5Llphw==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5335.namprd12.prod.outlook.com (2603:10b6:208:317::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Mon, 14 Jun
 2021 22:43:02 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e%7]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 22:43:02 +0000
Date: Mon, 14 Jun 2021 19:43:01 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/10] driver core: Don't return EPROBE_DEFER to
 userspace during sysfs bind
Message-ID: <20210614224301.GO1002214@nvidia.com>
References: <20210614150846.4111871-1-hch@lst.de>
 <20210614150846.4111871-5-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614150846.4111871-5-hch@lst.de>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: MN2PR16CA0029.namprd16.prod.outlook.com
 (2603:10b6:208:134::42) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 MN2PR16CA0029.namprd16.prod.outlook.com (2603:10b6:208:134::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Mon, 14 Jun 2021 22:43:02 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lsvIL-006wHi-Em; Mon, 14 Jun 2021 19:43:01 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2727cf1-2caf-49d5-16d2-08d92f85c46d
X-MS-TrafficTypeDiagnostic: BL1PR12MB5335:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5335EC72983E71C00E266CF1C2319@BL1PR12MB5335.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jcC13W/pwuWQ2eodOB3lekMDfCecV+8oPefbaKKKpQJ2rhNDEjBKsAncBis+R4pnguhyFl5Kfy3b8wsh8ZJtB0Fj9er2oQX5PqzxRkxY9ytmhC+crwuBE8FrZdQoPSsmBKwBckBmzANCVFZjlS6e6/nQmIYiydTRRzZ2dPXsjX4RLfBGTV3JGARcydEOspAWarZKKNdjTfjTK3Tz+8r81REnZyC21SEgovCXm+IJe8w4zft8p/hC8TWCsQHVPIJ5KxYP4MGBdS0ujWs03f5Oi+7HK9QnqOgRT7vJnliObqLpUksmcl32V6D49MSqYOLURNbopmd8K9EhM8HsLrU5vJTXVkAGPRQpUM0kR5IhDUi49HA0jPshAU+rKOlxwo/5T8PwbEir7UVmrEd778Bd+qUErSJ61TjVz+YQtTb2X0JlNVRmI+x+meze5pK9sRAxeDm/ARXZyhHL1cXIYth3CIAjlT6m1S5RX3K6szSqJq1vPXH9UzGe26pWz9XgZApMG/ocd1bOdf6FV7hgB48GOclw2+DVp5ST5VVmAX0g7WLDc7q6ARrCQoBZkfAYyLwOcgv2Xqv4T8DgzfD4EiNqDtfulTiIXLprQCDdMwkS940=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(186003)(2616005)(54906003)(66556008)(66946007)(38100700002)(8676002)(66476007)(426003)(9746002)(86362001)(5660300002)(478600001)(6916009)(7416002)(9786002)(316002)(8936002)(26005)(83380400001)(33656002)(4326008)(2906002)(36756003)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VBwY7q4oXK3uAw2kHfN7PcGRaQXsTN2TwxFTCKhMMXqshQN4YOSPQtaf6DAs?=
 =?us-ascii?Q?nP/2midPIjTYGwdQB0BZnStSBxfa9YQIeGXAfAG4JWhgGGOwEM5Iz5rmh7oh?=
 =?us-ascii?Q?f4HrCcXV5k02uAtYul8Ylwi/wsZIetE+kb1E3s16gB+asAZuNyG9UqbK2Jzk?=
 =?us-ascii?Q?S8Y9r9S+TjpEWpY8cEeJhiaa1LaECAAmyNEZyeChqXLD2F1yo51ESFMs4x/b?=
 =?us-ascii?Q?4W6iKg7Ktt9npyVPhPGdHpnjhbImWsLH6KG7Ds0MncoBizWDGE8+qtCfIwGD?=
 =?us-ascii?Q?vDAP2hhA1Nx4wvoez+HkeztD0ZaXFOYyCNyFZVcAqotN9DEG50+9gv4jfSm5?=
 =?us-ascii?Q?hPvoFLgNWcmR8xaVFdRO7GsDuUGachsDbrewd9bZBQcPkxCuBg0ZNy3ZwwK/?=
 =?us-ascii?Q?rtTkK89HIHi/ZVe8m6GnuB2MZpEpV3wjpW0fT/a4qqn3ignJfQenOsaNZPeW?=
 =?us-ascii?Q?dr9I2mgMGVEktpUQBjCuKWH+QXGj2IwBoZmwWZxPwPUH6DEx9M+SFfIf5Spo?=
 =?us-ascii?Q?r2xo3naLxooEUsoUF6I2D817a2dD767XC3dsOVTfky9sU9chbi31vJV2TGJ4?=
 =?us-ascii?Q?beh83/w0swN5dfiV1zeyFEBIep723ux/eb9DpGs24wpw6F0YKvXn6yarVQYQ?=
 =?us-ascii?Q?O55OaFC7E5sueimm9usOxMbP5kFnFg46DjN2rtjnOtLImLN3vfRqiH7soGld?=
 =?us-ascii?Q?GA/3ub5UHwvf/jFfemh11aM+MRQAwfd5VbEo+HAKeXLfAoPn20MugYvmM8+2?=
 =?us-ascii?Q?x25nW5MGSNYGfNPg1bSnwbA5fyKFtwoxUKLzkmd+ztbPbfMFNACgdhrwDm9e?=
 =?us-ascii?Q?hrcEMCoIW8id1G+B2i2vqhFnnzpoJ1JLfP/BV09SklG65KO46H+1QNS566Ks?=
 =?us-ascii?Q?P7a8RhBLiC2iU41exzvgGejQHoNL0CwpU+sqoTj16ebi0lzBf81Bt8QB4D4E?=
 =?us-ascii?Q?dJT/XQ/eox077RdSNvNEN+HLuWU3+QnQnhawXucy4yhaLN1UDkNVEnvpgKBL?=
 =?us-ascii?Q?R3VKneiZC8i8IOLQ4cP90Ee6u9XqPzPmfusm3zTJ5cvQ/6Tz1AjrVIRbmNgM?=
 =?us-ascii?Q?62ayQwwoWf5Q9x7hMwtSGdb7JjfwcqQmfzdgh5s1ZNvfJJ6qcd3dVyjFQbLy?=
 =?us-ascii?Q?RHrCNjk1ikfXpoed7Mo9mZkR01czbfGpyy5JWJtB1xCq2+/700K7KcQDjbFP?=
 =?us-ascii?Q?xGHDpaHxc9UlL+UR0gJh8esorcDkglnqxzjqph7k7QVyHxUesRoscBUXsArG?=
 =?us-ascii?Q?PM0iaMdTDCLd/abdS2/JQWBSfDQswho+hTLkOeXuHMW35hg3s2VDw0P5MZ48?=
 =?us-ascii?Q?kUFq4EWL/M0Hbi8bNygvgtLs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2727cf1-2caf-49d5-16d2-08d92f85c46d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 22:43:02.4724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ySwJT/HgXM62VSa20op3M+hHIzIqi56AwisqFqEUKDL94M+vi7NGZsPa82+tx49
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5335
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jason Herne <jjherne@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 14, 2021 at 05:08:40PM +0200, Christoph Hellwig wrote:

> @@ -679,8 +666,6 @@ static int really_probe(struct device *dev, struct device_driver *drv)
>  		dev->pm_domain->dismiss(dev);
>  	pm_runtime_reinit(dev);
>  	dev_pm_set_driver_flags(dev, 0);
> -	if (probe_ret == -EPROBE_DEFER)
> -		driver_deferred_probe_add_trigger(dev, local_trigger_count);
>  done:

I like the new arrangement - however I'm looking at the ordering
relative to this:

>  	atomic_dec(&probe_count);
>  	wake_up_all(&probe_waitqueue);

And wondering if the idea is that driver_deferred_probe_add_trigger()
is supposed to be enclosed by the atomic, so that the
device_block_probing() / wait_for_device_probe() sequence is actually
a fence against queuing new work?

Which is suggesting that the other driver_deferred_probe_add_trigger()
at the top of really_probe is already ordered wrong?

Although, if that is the idea the wait_for_device_probe() doesn't look
entirely sequenced right..

It looks easy enough to fix by moving the probe_count up:

> +static int driver_probe_device(struct device_driver *drv, struct device *dev)
> +{
> +	int trigger_count = atomic_read(&deferred_trigger_count);
> +	int ret;
> +
> +	ret = __driver_probe_device(drv, dev);
> +	if (ret == -EPROBE_DEFER || ret == EPROBE_DEFER) {
> +		driver_deferred_probe_add(dev);
> +
> +		/*
> +		 * Did a trigger occur while probing? Need to re-trigger if yes
> +		 */
> +		if (trigger_count != atomic_read(&deferred_trigger_count) &&
> +		    !defer_all_probes)
> +			driver_deferred_probe_trigger();
> +	}

into here?

I didn't see a reason why it couldn't enclose the pm stuff too..

Jason
