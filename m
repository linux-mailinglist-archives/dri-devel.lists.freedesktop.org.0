Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16323346934
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 20:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A596E950;
	Tue, 23 Mar 2021 19:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C68A6E950;
 Tue, 23 Mar 2021 19:39:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eO9j5lNBomoKUvRzLPmAjEV+QxwXia5R6Q6R6LSuvfIwwbnDdp+FEr0dVNd4LDiymTQDu2rM6TdJD7QYOCetVSvapaE8UxAzXxMD3BTdMYnwY3/PGmsCAJXembLo6OogMiJFmwP5PLJM9JPx6iFZzuGUgNy/u/x/TMC1LkXkBwXn3kJrfwLqBZIDod6QhQjnCMsrLiO7m1YDO2Uy5EZ4zGeOaAKWq1Dq8Zjag6LzcZn5LsXb/nOVS0SBHnMfGdvQLzw5vdmlXYlYhuo6S6vKumAF/KuaVjNfrKcW7ybU/6Kwt5QOKG+raZHs3AE3g1i6xCx972uBt3H51fitGJ0/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QuqtdzETKQt/obdJUs2YSoDvSLO7gfmqEmNNAkwQhE=;
 b=GsdLAA4JMqBSKiWtljP+VqZqbaHAkF3WnTlC2VtSrPIStoPAiZARWhETYxftNHxC+msiM4PzEzwTs++PNKFOOP29zikvg9cTJWpRVq3K2HSBQgXnbka633MzeouB3UNNVqswbSE3QFObhrJfZa6Br3uaZ1JFuIo3ZI8XP8JiNx9gl1suQ2AoQS1dWA/G+1iz/hYC/iTlpB1bb4+KVhzwXuYpbkU7zZcOmeZt2pQUNsWRxxPZpfwluvtjhGQ6vnGDjHLw52x0/eXXLTW4yFqPcs+asJKyhBukqAeD1g0y2cmIDmqniqc4cK+inK+rn2ZCJ/0gF44J/ixTW8C8HqYMDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QuqtdzETKQt/obdJUs2YSoDvSLO7gfmqEmNNAkwQhE=;
 b=R2yJrZ/kHNSY4n2sCzxqb1YIkfAazZWeVYhAUKOy73JAjJTNf1Kd9jxS/oyyacRuFfmozky/ciutuh/omxpt6uDZv0qk4FArIsfr56+vdfbMTDk9R9MmIaGgtrokql+WW9HflmqjlEm42bSavL9nL+tvPljJw90JR57AwwhP+RslbtVczv2xA2oVM4I9zg9Ob3pFFYQjUYOc5iduRcZ4JAQPlVK8LX7YDWm41Pn6AaAfcDj7urJ6US1LvlL2/nM8OnlREDhpPKXDyi6PyO9hkPfDgSCTcMn2IBkY2Dqi5b/SydLiBDeMKhetThNRYyh+r4/gS04QMNqo2trloT7bvQ==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR1201MB2491.namprd12.prod.outlook.com (2603:10b6:3:eb::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 19:39:37 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 19:39:37 +0000
Date: Tue, 23 Mar 2021 16:39:36 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 15/18] vfio/gvt: Make DRM_I915_GVT depend on VFIO_MDEV
Message-ID: <20210323193936.GN2356281@nvidia.com>
References: <0-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
 <15-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
 <20210323192630.GM17735@lst.de>
Content-Disposition: inline
In-Reply-To: <20210323192630.GM17735@lst.de>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: MN2PR17CA0036.namprd17.prod.outlook.com
 (2603:10b6:208:15e::49) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 MN2PR17CA0036.namprd17.prod.outlook.com (2603:10b6:208:15e::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Tue, 23 Mar 2021 19:39:37 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lOmsK-001fDc-4V; Tue, 23 Mar 2021 16:39:36 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a2202c2-8a28-489c-5440-08d8ee3364d1
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2491:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2491341E638A0E7DA4BF39C6C2649@DM5PR1201MB2491.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CXYa9Z+ALtyyqqoRlGFa/OsA1upLOiqKMWc7OOoUmpit/UcaqAU2Dvb3vXCTdhI825T9LrDopqQr9P8u6dVnE0Pb6AbszmHSZtmZwYrAg6K7lET7NrR+PHVVG3snZdY0SUapQWtZ/nFD9cdGRWyK5U3YP3ee/moAQEGW0EyvApVShb5zWwdXFc8V+67aNr6w57TlxUox90cvmX1nQoTJToV/Qr2G+jpi4UIM2hdcqXOwEYpf2SgqYdPSJfzVapB4m/mc5rI9hZsRuIJKflqRUcwpn58yTqrUiHHooU+4chRYrU3WOCHz0CSToDiv3Srl//NUn97ZTVcT5OF1ad+15xBQ+wrZlkje5+41NfRvTlnzsh0s+xOFZEvOnE3EN5y5QnL9lK/KUhd6UKeY6c2++d739V6uSLWz16DsUDdcQ6XZi8F7fNfarpWypTDH59YlZ/4oJTjZ8giRJWKXsbHKrDjRWrIcUSWeYdDCtjD+u5S/ZwdfQaougvUymhnpQSINUVvWq2y8GrYJs+0lwFdaAThDLwDxij7N4BLPtcZIsUViqxnEBn4ERr8S6yj12C9GVP+Igcx8BpWPnZo1G2KDApWKuQdMe/dt2NB2wkaBCdw/3KslqSyYsGqRyRAoyTAjZcMCDKDY/Zbvy/e/zKtAtAzUjy3XtvWwnejHiBvBHhQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(4744005)(54906003)(36756003)(38100700001)(83380400001)(33656002)(478600001)(1076003)(6916009)(7416002)(107886003)(66556008)(316002)(8936002)(66476007)(2616005)(426003)(2906002)(26005)(8676002)(5660300002)(9746002)(4326008)(66946007)(9786002)(186003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RwalXZvO7zS1STxDk408nIt+nRcFQ8MYkiB1l540F5rvW3AmItoXwmpR9UXB?=
 =?us-ascii?Q?BxBbBFw7UMLfQ4NobPVZefNqBLU4eAuAGg9bRHU98EUqcYEE5bPz1ikc5XXc?=
 =?us-ascii?Q?OkAJbXo38w9ldgHO4yWaOvY2GUdj8BeO+ZR+XpOFe6eIXMT+MxQ6Vue6WDsv?=
 =?us-ascii?Q?gX9V5WfiUun2Xy28afaoLdxidsWX33wRehAXyo+5MMAwmsjqNcL8GKBKa9kV?=
 =?us-ascii?Q?/UAyoBIgFDUoKfDFt0z6Mh6+sZ4Fp6CC/lceJPYh8Nh5swpl5MsDMEvqIb24?=
 =?us-ascii?Q?5nysYnFVEc9DyVP1puQ+GzQGZwvUvPBPs29OiLjDIEovjOcGLmtmpWbvcSWP?=
 =?us-ascii?Q?06jD+yYujcdvCr67uO9pg+Qzzv2w8sM56jbTkEf1gH2RycjfJGQ/TOal6uHN?=
 =?us-ascii?Q?uFcOiO/0s+lp3xdYwmcE0rB9HQffi3/Wx58usN489dWYB7Xahj8BJs6fWUhz?=
 =?us-ascii?Q?LVHM/IkdnzA6dmdcEVUCiNZ7B4f1spG3IudVlZhvoSwm9dEhX0aKiDc2bYYy?=
 =?us-ascii?Q?I3zfVi4crM8cb0pjK4HlZrc+dXn1c+lmzR8PllVbiwaYege4WTrufmIDe9nc?=
 =?us-ascii?Q?bVuCE06XwdB2oueUVxndhcFNMH2u4KUfjA98E+A9zR3AgG2+CdB1OSxLA65u?=
 =?us-ascii?Q?+mNdQtHlgU9uFKEPEQq8jVI9L14RualBmdQ2Sp20qrr3HObzBMx2pKPfuZUt?=
 =?us-ascii?Q?rUdyt9qXN3UL6eC/Qmi6EZszPnT2K2CSQnHpttGhtP6GRxfM9JHhFrRnVZwR?=
 =?us-ascii?Q?kYWcHwnu2M7QWrO/KcpYiD8zbtzCYjMhLeiQoR4jRa2JGrCz1UQoIOjlv96m?=
 =?us-ascii?Q?YaQeRB8oXVJZ0cgHYJ5OSbVBKoPt2/ISUg/+peFREuVugt5NAX7wWkqVJ3EB?=
 =?us-ascii?Q?PjmaXM5cr/yMxJ7ABxMJNXprci+xZABu8W4vZC0j5RiPToLciuGjerFEV+jP?=
 =?us-ascii?Q?DZIzqLJ+sYTAzhq/x7oKOC0z8uJzlo3Ok0xeHVJk2YBTNnAvnSA4sAs8VNEL?=
 =?us-ascii?Q?JyfG28fawheLF1vnrcQoEN4hBh+mIH2Ys+6gQmfxcP5GhXxehKF1XNGneish?=
 =?us-ascii?Q?+bNjpFutOlgvblcMQtj8gNyI/tQRGOjK66CZnKl/U3/DH77CYGOOOciKhXSc?=
 =?us-ascii?Q?2tcAXJ6wHO264cqxwqA6y87ymdlgaTfds8p2HIcLt6QmOnPQ5nuubuagy4uf?=
 =?us-ascii?Q?1RlXvjwT3ligDk2aJtZRw4+wOe3niddcY+znqBbHjliXW+lNw2vpXC3rHg28?=
 =?us-ascii?Q?EatxB6kaJLz3h2BL1j4xUTskjzyBU4s7E+z+CnoHcs67N/R+CdR7DnKuXyHw?=
 =?us-ascii?Q?2PJvIsLlBcBGT3QB/F8I8W+D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2202c2-8a28-489c-5440-08d8ee3364d1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 19:39:37.6507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vALJNI6x8TvNp9Y+89GoHrHU+Owe8ICxr7wpV2c2e4mewSs5BZjPfk+n7bOvdgXy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2491
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 08:26:30PM +0100, Christoph Hellwig wrote:
> On Tue, Mar 23, 2021 at 02:55:32PM -0300, Jason Gunthorpe wrote:
> > Ideally all of this would be moved to kvmgt.c, but it is entangled with
> > the rest of the "generic" code in an odd way. Thus put in a kconfig
> > dependency so we don't get randconfig failures when the next patch creates
> > a link time dependency related to the use of MDEV_TYPE.
> 
> Ideally that weird struct intel_gvt_mpt would go away entirely.  But
> that is clearly out of scope for this patchset..

Yes.. Maybe someone from Intel will take that on, along with that
other note you had. Compared to all the others this driver is quite
twisty!

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
