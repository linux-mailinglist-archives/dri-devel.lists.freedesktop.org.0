Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EB761F4FD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CB310E324;
	Mon,  7 Nov 2022 14:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2064.outbound.protection.outlook.com [40.107.100.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1283910E1BE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 14:10:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7gVCAVxJ3jFgkewAuklxLNrEGuu0c1CEEHK64mpiBI0PZSxTerpMjCLrlPvCH0LF92DGBpjwlvUuuiYAOs855AZHoNPJ8lF7t+gyIpI2YKHrl/Mn/LMNE5hgdjitnrsbI8HluwzbLua9J0enJYWWnv4AfvluZ2vkHnjCrL9Y/DF5ZslrvyA/cwj4W1qx8GCMGDvfpyPPtHbAylK2TU9ibuMoVAB7Vv604hiCSB6rcaWCdVUt+wTm7nNUF37EV7lKTA9W8vgTGq9xONnJ76GKHvWLzio11TxB+u89KBpDkLb1RELSsPC/OcEYiIjfmlJ8oFaeLPZ0Mqp4RpoHr5k/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEZUAgh80j5fe/CSXGZoBMEgRWn92bmRpOpfLK95qLE=;
 b=ScMPccFQepM6PIEZiuWspu1cD1wfwZNm3jAnYFQif31iKXCbXpbNOiZB1GvdbXjTpMOxZLzWg2L4SXD/7uzMeqNyQOfzCyqFNwrYGLi9KW2Yk+1qsqXwqvnY+Lsqj5NdZu4mwmOz1cSVe3juXVVhma11iaVJiIcU7cny4WWbe1frfiVgMVSJjTHbDGr4JhM/KfxaaDSJ5LYfh7jfGpDc5v16ZmLmyiEEzz6tvJ/f5VMyicNAhTC6lGhEht/eV5VWsRUGc3uwFYYY3KUdDn7dA/Ei7B/xs5Ko+uu9o5xtcQjeEz9zMP6NbWIX89Kmomjh6oNdBc5nD50Dn53qjqhzfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEZUAgh80j5fe/CSXGZoBMEgRWn92bmRpOpfLK95qLE=;
 b=N8WuAgl1AGyxlpNcAJQ/EFVEq6OwhLq3Isqz6OnYbTT/p0LDJM46tzUZ6tupFA/m2tqhKGV0LAeiOJMOTwo3ZfFLUu3/04jZFSF5OkUr3K3mRq+3R1a4aS4ImmfbwMSeLrIewk0I/SsgVvJPhHm9TfdzrTEbDofhzUBzbKBsuYvMS6zVH4f73sZp69uJNQVKMaV06VnfKaSaqDoyksfob81KDg/H5f8WMAhr5y0rTh3doyrge7RHePTamP0blgGM+Cw4fNjavT4s6bT31AjRmreVH679QDwfk9LtUGM1wdP2tZuFser25tP/vYeE6AzTzDDPg3Aj8pkzOnGNTLPmGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH2PR12MB4293.namprd12.prod.outlook.com (2603:10b6:610:7e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 14:10:08 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 14:10:08 +0000
Date: Mon, 7 Nov 2022 10:10:07 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [RFC PATCH v2 1/3] drivers/accel: define kconfig and register a
 new major
Message-ID: <Y2kRvyR8VrZrO/1H@nvidia.com>
References: <20221102203405.1797491-1-ogabbay@kernel.org>
 <20221102203405.1797491-2-ogabbay@kernel.org>
 <Y2MMCIe5wND2XPqE@kroah.com>
 <CAFCwf13uLj=P6u6FAcY8M5qAXoaBdb+Ha-TYj0j2FAZnFAPFYg@mail.gmail.com>
 <CAFCwf12yRUG4593ozJMEwaaJBKyWqXTTCjef9O_fzWdQBxVrtw@mail.gmail.com>
 <Y2kAcCu4z2LUMN7u@nvidia.com>
 <CAFCwf10K-dTu455QfOK8i6thismY-FUN2Rws830EGiqOcGWFgA@mail.gmail.com>
 <Y2kDzPswkKyZyRpS@nvidia.com>
 <CAFCwf10A=-bj2nR8WasNxyQQ07D24Je04tzKxqv2X_XnA0BUSQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf10A=-bj2nR8WasNxyQQ07D24Je04tzKxqv2X_XnA0BUSQ@mail.gmail.com>
X-ClientProxiedBy: BL1PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:208:256::22) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH2PR12MB4293:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d379051-9c31-4b3a-a2fd-08dac0c9c6c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RZPXLqPQVqEU5cRfa/nh9PDWgmjb9YrSXoQbWKIkGw1st9K9L6Ugn2ox/a371pua3jAENRUKdNf/0x0cJrHFeqOO69/o6bTfgkMBj0x4hnZaYjJn2ayqN9s3962JtCaR6PpzVfh60mE2gMjPqUjtSv3Xk2GS4pMFqdYusvrSYQ7YSkCtoXl3lofwgteUoZl7YPBEBvxeNsk8z1hj9ojtPea5Ml2t/tNABKgE7Po6V4QcnjJ7ubJuN/k/M09e5wLu7bJzupLwWzoKW2jzADoSEOHBPsOO/WLd6kRk03ELd/1ArMyxaFrYLz2UoSC5ixof7tuYa9nVjtRrmzarDbD5rXrgafG9DG2AvLO+WZZP3XUqul/gQQcNHzvKyq7Z+As0CS+RaO19DeQ6DIYYQiN91xzHDMNIpUm6yoFjypyyixOlqSFpDG/Mbl2eFBve1uCs0oQEZgZmKyQCYPVS4JUoGtt5SPn5FNMtK31t1pFhCPFa8eDSuZVC0zqu/DXpzdfhgu0GMBi9gJMzOWJsGy5r07V4g+cOjzwMJ7ql3cWABYuZuPNC43ophK8EByU1ioyCpBJpNXMty4pVN7xwOaN7D+8Dzm9U1khCMPwPKCWCBRtCCw4M0OlA9lYt3N1pORPi+WHTDvaqElKL8yYHBu3ZQFmCtJRb0CnswGLhLrqZx1EsuXFU0hRpOpAvcQNO3r1vS3J8NChWqtucYruoKNfadA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199015)(83380400001)(186003)(38100700002)(7416002)(2906002)(86362001)(8936002)(5660300002)(41300700001)(478600001)(6486002)(2616005)(53546011)(6506007)(26005)(6512007)(66556008)(8676002)(66476007)(6916009)(316002)(66946007)(4326008)(54906003)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HSFWLMD865ZpUs4QTDiqUX6+PiXmRSWJDXheGHOMRnaZt/8zDEczgjqw3mfb?=
 =?us-ascii?Q?1mPQTWk2frqodzMvH8VyP8jj4pJlaBZfrNV1oQdG10C3pTeWxcP7/mMx81HY?=
 =?us-ascii?Q?ROLlxpo9KOjcyNhlsX2c5RpRG2i+NaNrL9iBh+rFJLyBrGTG7o2CeTR2pHKu?=
 =?us-ascii?Q?uS4cscwWXO4yPTlXuxB9aOUn3/6z9DxMxtuQSyNLYg06Aj1nbH1i5d20GAhM?=
 =?us-ascii?Q?eGO0CB/dfq86IFiDuH5zdjRvFlHAu0EdufH/2YoWK8xnH+/vwy4b6L903v36?=
 =?us-ascii?Q?prEtRep7pZtnxoH+SDt9ugUrUmojaI/gXg41tZoMYbrz/T5GKf55d7J2Dqht?=
 =?us-ascii?Q?/ejGMF58ckP3xnIR/Fv+gyMUqAKLFvv96RSgtsQlucrbBSPrpS1VeCPDfUsK?=
 =?us-ascii?Q?jVp8/ICa7EJ2sINid+H24HsEOLtm6OljURSWgu1fCDker6WzB8DEy0e4jRfz?=
 =?us-ascii?Q?OQ/SzyJKnNadRorpD100EGkIoxA7PkDgxBrxYnIgoIyIKWG9FJH02kIc+k8a?=
 =?us-ascii?Q?A0FEYZgrHwjMijwBS0AxssS7DTBxqku1B8Q+OwsPgm0Whb8FyX/VYD0CI4Wk?=
 =?us-ascii?Q?TmkpoJZ/2XHUucqU7TdDjy6K6TRFJL9H+f6CtklC++aO+XTvoRtIIYUIf4jp?=
 =?us-ascii?Q?W2l+jsJ1cqp0cxBvaPah8GBRGLJfk4nq53AnsL2rgGdB/IGergG2z88AYB6Z?=
 =?us-ascii?Q?zJpnMC1ZcmjbPaY9Lh5JqeKInd63sStIfqSa+hRgNKaR25gyyS90MbhghLhK?=
 =?us-ascii?Q?OA5c6WaNc5t23fJ3SxXlE1QWrRUF4JAqldB2dDH4dD4dw+HP+P43sjKX3oPf?=
 =?us-ascii?Q?znfPp0y6l8Br5xvJLET4SY5C4T8YK+F18+JzorpJbXNRq5P7EGEd0a50wxie?=
 =?us-ascii?Q?UBjLhY563Pv2DlQRyqkXuNyaxFarhSPwqU8UurUvBETJN1A1Hb5kBDRXxrX6?=
 =?us-ascii?Q?vk+p9SkCiFuAtnenA8TmUvgZo3wv/jeKyXJg01XnYk8M7m6Xw5KZBZPN4fmx?=
 =?us-ascii?Q?wJimm0l/svUl8JNW63uH5xfvMX6wfK4aORYtuEGXrCP8/YWBVSXzc+ktY5SM?=
 =?us-ascii?Q?Oe+aSTfWywT+MO31ZUuZMmMKew6MNoYYbNZAmmLrzP+lVdXjx8CUUszxQIQQ?=
 =?us-ascii?Q?n2KxAWHEtxGLDXDB3jkAtCF1+7RLaeOMuJN594Ps5wAlGJjjY6hQr7iFM5Pq?=
 =?us-ascii?Q?maj4kUFVTjLyFbyZobqsxojkwsc0pOO7zSYLES5BQq4QNqjB78vQ7tiJYJ8p?=
 =?us-ascii?Q?YGeS0eCIKmtrReK0N6m7JTcGT1d1IAgk0mR9Zcg1C0rOVW3TNo7nrJWgzB8R?=
 =?us-ascii?Q?a7o8O54nPeVMCkmdha6WgG9TPK+TXFfr34Tk8g+WC6OAKP7PPEuMGzojbeb+?=
 =?us-ascii?Q?CXpLdUjql6d6LQTfwAlp1CqoLi2Js1E2UsK5bAChS7patL/+maTlq8LHTho6?=
 =?us-ascii?Q?WN2Tc8KfIKGh5EINje9KlFFSucK/3G29zGd/jrwGhPG38FtdVxaNRzFaeAhK?=
 =?us-ascii?Q?B/Kgwh6biQBw5YCFudnr/6KrpmWes4L7gFp5gD5OoDMLpu4a5n8WWUYWnV6/?=
 =?us-ascii?Q?k7YTi53kbXHLhHpavuw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d379051-9c31-4b3a-a2fd-08dac0c9c6c2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 14:10:08.4137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+D31yd3dJMnsxmfSPDVft06CviDAroKvRRkrRZ+3gecCB56NA8KCui1B7AgD2YK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4293
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
Cc: dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, John Hubbard <jhubbard@nvidia.com>,
 stanislaw.gruszka@intel.com, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 04:02:01PM +0200, Oded Gabbay wrote:
> On Mon, Nov 7, 2022 at 3:10 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
> >
> > On Mon, Nov 07, 2022 at 03:01:08PM +0200, Oded Gabbay wrote:
> > > I don't agree with your statement that it should be "a layer over top of DRM".
> > > Anything on top of DRM is a device driver.
> > > Accel is not a device driver, it is a new type of drm minor / drm driver.
> >
> > Yeah, I still think this is not the right way, you are getting almost
> > nothing from DRM and making everything more complicated in the
> > process.
> >
> > > The only alternative imo to that is to abandon the idea of reusing
> > > drm, and just make an independant accel core code.
> >
> > Not quite really, layer it properly and librarize parts of DRM into
> > things accel can re-use so they are not intimately tied to the DRM
> > struct device notion.
> >
> > IMHO this is much better, because accel has very little need of DRM to
> > manage a struct device/cdev in the first place.
> >
> > Jason
> I'm not following. How can an accel device be a new type of drm_minor,
> if it doesn't have access to all its functions and members ?

"drm_minor" is not necessary anymore. Strictly managing minor numbers
lost its value years ago when /dev/ was reorganized. Just use
dynamic minors fully.

> How will accel device leverage, for example, the GEM code without
> being a drm_minor ?

Split GEM into a library so it doesn't require that.

> Librarizing parts of DRM sounds nice in theory but the reality is that
> everything there is interconnected, all the structures are
> interdependent.

Yes, the kernel is full of stuff that needs improving. Let's not take
shortcuts.

> I would have to re-write the entire DRM library to make such a thing
> work. I don't think this was the intention.

Not necessarily you, whoever someday needs GEM would have to do some
work.

> The current design makes the accel device an integral part of drm,
> with very minimal code duplication and without re-writing DRM.

And it smells bad, you can't even make it into a proper module. Who
knows what other problems will come.

Jason
