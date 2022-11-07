Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA2561F407
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 14:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D074910E054;
	Mon,  7 Nov 2022 13:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C302510E054
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 13:10:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2bqnGOotXERKUtRCgBVi+Mz1+di9uWGwt/FQ7qC4R3I/cT/ZNLI8R0fnGSefQFVOwQk01SKC055Pajyy59yWg77QzdRC8urIRC2+kSvD+6NileQqK95FTKkeujtyNg4kvzq6G0xGQFvwF3rQ7WY5zxhc9m2yJAZRS60Iwcx5mEXQgRP08s7AAEaA46jVvIUVW6FdtS5EpXHMx0qhC0Ju0tChLvAiuCzZPw7L2093WHc5G2/PGEErOGiYKU3/uFkZR4U3V7rBLVyWesCJBESINEQZwtm9+W2HGjzEjvzFQAgOxO6KKYgnJNPCjF1gEgPEC+Y53NxyFLSKCOPhNiMmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqKqjz6TvoIf6pNrM9HS5lAEf/wnj+3mO/SkHcn291w=;
 b=eyFYHsg1e5DVUov+yIOpB3xCovgBODWw73dyStuqfwVHKE7q7Js2EKkEFUkClEiXFDwlSBwhotzIH0xGMNpisZJrsVq6Qk8wH0g/11SlQSCgEdh+f+nMjsAQDF19Mrc4sm66/7YHJG0wJXVa8BZfD+qrFWIdI4473uVe0BxSv11xico4kQcBjxLNjDTiyIJaEypxk+YhnnhSFz5aAPdbSmBrkPLOr22sicj1XeDIsJiHjFZqKtUm2SaYc+xCPH38T4ZCr7bQ+nchgbgfl179u86WkfHrf0veLbGU1MolOjPKPj+zg3J6MIPrtHd1GU8yIHUV3Shf38FZy333v7KGWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqKqjz6TvoIf6pNrM9HS5lAEf/wnj+3mO/SkHcn291w=;
 b=hs9cl1mnRgRuB7dmM7fyzkJaaaPcxthwi0UfyWE0J24cRGmF7daUHzsOU6XvtnZelNe1wEfiQB0n7HcS7GKHBjwI2mufTetvvCElMyJl+IMgbMrs4lrfG9G5vMLIiDPsK+J3CvdGk/PRG6rnEztPnktSzLN7bad54WKwlGXYgofF/qfRVMnRjDuActQQGvod3ICbG+iae0ZpDXXv/jAj3s0BiKC6ACsafjcT0g6Vsk6ycyDoD9wx5YBpeo1xx1qyCNtmo5ex6D3rE2cmBeu6UxETQF53L/bGNY7Ne1BbYhDEo4JCDqJMNzzvvecSZcEW5z/FjIAiKuzuSbvSJ5n7oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5899.namprd12.prod.outlook.com (2603:10b6:208:397::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Mon, 7 Nov
 2022 13:10:37 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 13:10:37 +0000
Date: Mon, 7 Nov 2022 09:10:36 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [RFC PATCH v2 1/3] drivers/accel: define kconfig and register a
 new major
Message-ID: <Y2kDzPswkKyZyRpS@nvidia.com>
References: <20221102203405.1797491-1-ogabbay@kernel.org>
 <20221102203405.1797491-2-ogabbay@kernel.org>
 <Y2MMCIe5wND2XPqE@kroah.com>
 <CAFCwf13uLj=P6u6FAcY8M5qAXoaBdb+Ha-TYj0j2FAZnFAPFYg@mail.gmail.com>
 <CAFCwf12yRUG4593ozJMEwaaJBKyWqXTTCjef9O_fzWdQBxVrtw@mail.gmail.com>
 <Y2kAcCu4z2LUMN7u@nvidia.com>
 <CAFCwf10K-dTu455QfOK8i6thismY-FUN2Rws830EGiqOcGWFgA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf10K-dTu455QfOK8i6thismY-FUN2Rws830EGiqOcGWFgA@mail.gmail.com>
X-ClientProxiedBy: MN2PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:208:160::35) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a7c7b5c-bbf5-4d32-de09-08dac0c1766c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 30v1+qG0w0fg8ItlvweheFgATMARAClNIbtaiXDlWvcJeniieKAwQX/Z7KunxEjupTNf+OgheQ9t/4RYKCV+WSWCm1ToHAk9CaGtmwK2uhQFnsxSCEwi3sneNU/upX6DPfeBP9RvhOrsZlg7/kdnSQve5lJrBItBmJ8xg9LYC/i1EtVwEptZSVbQy0NZK2G1iy9LSnKtH5T3WLdqL06PIIH/2+WgQpXEyhN2i2KEGtmSmAhhuS6KYNIfh7DrXkViS+fUh/EG3k7zXQkNTAIKDgow51GBMYIypgg24NWnQUS4gSNPZqY48UQpj+fTdX+U8jRdXsgn08VTPG6D06rpf6TMgNVX58YBDp9bLJ5tWU+j5lqC8EHosRFdD4mEhDld/EtJuvYkml8UQrDSvLaChOF8m3oodKntZkcDoLoD5/jPIkI6nGri6K+slAuGq1lnZ8Kk/rSdqoVnWLrNteABkK67VrTAQZ/btlpkGD6lIoVW0F36dvP/pXK8WReLgtuvz7I4Yw0JqSPeRjhBKm3pclOWUA3mwsTQslCQ3pJIRK30kU1kN+tHagyeJNPj15g9oUeYynE6A7pQuqSqWr08sRGqI3tylX3QM5h4e7QHLHVzGXV2ffOYjA1XsMdJOlaPE1w7Ov9TWtSx3sRp2x9u12j/Po2hi7zmIhYt4zGTSf2OxaR9LLzOIVsB6oYgcekUMD8+76gpn/Z5Ag4DcZJtZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199015)(4744005)(186003)(66476007)(7416002)(6916009)(54906003)(8936002)(36756003)(316002)(5660300002)(41300700001)(6506007)(8676002)(4326008)(66556008)(66946007)(83380400001)(26005)(2906002)(6512007)(2616005)(6486002)(478600001)(86362001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZO0Y1LtClZqf/Jj8n37kfcnL5PODN7NRzf9GufEzZaBTHbeYaOfMNlfgvMfC?=
 =?us-ascii?Q?E2BikF3l4wDrr3nsXFPyYEtMlPj3yjp9Tx4+QzjAGBBblAdhnt8H3g47brsN?=
 =?us-ascii?Q?jpQl7sTzRKdxHwKUrc2Fht9HdL3xG7Y+PvNSIFZAThtXiWWsbaUyZX3d9hGx?=
 =?us-ascii?Q?qKo0jVgtTAvneDW9JcelaHRhpwPOyLKVEeSPE0ssoi2sm3+FsmIPZ53y9Hqi?=
 =?us-ascii?Q?4K7IlvTlF0nAYzeQt+ZWgysioM446C7azFaWyxeZZPVodetZmI4Wy2MljyHf?=
 =?us-ascii?Q?ugcXI25L4jgzprgefwokC/gov7dvuIf5FSYMH2PTwaEBgHsHE+6Rjk1V08WV?=
 =?us-ascii?Q?PploRNeJAwGbv0Ml0RW7TsD9+Nl9Fg3/2g8geSga/S96iEE7eA7mu7J1WGXK?=
 =?us-ascii?Q?5qtm4dm4X/UyeNIP9tJRFkBIk8BowtMnDCji2P9gGYesbYJIz2TGf6u7+wty?=
 =?us-ascii?Q?lafND9jf77QFIxRGDjzDJt6QTiZh/PBLAgp+/20MWA/VqNjO1uPcYPbZ0pvw?=
 =?us-ascii?Q?iJWQzGk1lGkMk9vUmMB9LcsSICSG2WtB5lGsnOvCAKAMPulSCWBPkLjfXNIw?=
 =?us-ascii?Q?pvusL9sjhVUJ7UzN7kwGVCvEecTkmHnNMja9pPhNk+5jEy7peAzCEXIJsRuh?=
 =?us-ascii?Q?lpiOsMNtErWuJPnAkp+fTPyB3BaFPdXbN8UGCUGhbKqgmUqw87hpbGYwVve4?=
 =?us-ascii?Q?qdCcD7B0ILVmeJAQFcGerb+8owt5ezlSgexgMY7zSgjn68aJxD6aLhQjV9Te?=
 =?us-ascii?Q?QctMvPzEJZ6c4gmzww1FcaEb7Sl5d4dz+pSurbm71kytyKFkwsCjB+r9Psjg?=
 =?us-ascii?Q?m/HTalYaRUq2Mw3PcgCzlqAHSqN+aax5xEgmNwKF/aVdRH/L9qLlV0bjrL4U?=
 =?us-ascii?Q?4Nqed0Do1LVVKX8NNqzxkpbSeseC+/nf6gR6D9WLtJUFh9kdTwrwAQK0hR3u?=
 =?us-ascii?Q?NHQMlL7xaCweKhtpvsqF2giUjyMBqktyI1AvV0WmUvoJC+cH7uagBlIHzmOj?=
 =?us-ascii?Q?35IkE3woHdLHqX78YZ1zWXXsfrgFM46UjCI4nCIfV8yXiShHzqEgCZE57PzM?=
 =?us-ascii?Q?Ouqx+4V1X5Cxg7ereK1Tta3fFbZjGtfHl5m7dmqauGLQODsv+lbcub7zC31W?=
 =?us-ascii?Q?h2K8fJ4Jsxr4rNbrjA1OMHZFPvjnt9hE8sMC36YiA2MIPjfijSLRjGVdOHuL?=
 =?us-ascii?Q?2yxL4Wxj1dJG4CqNSqCnlR+v+2HFjBxqwm1TZbP8raAsJMVZNjqrWKpD34LM?=
 =?us-ascii?Q?NU0DCXV0MiM0BfxIsRP5wvs9TGODjU9Idl8wvHjQBMwWDpKPxVvshfyakG+G?=
 =?us-ascii?Q?zu2N9SNKO8t729418rw5L25VbHR9WjlqeFtTeWMRHe+mlDC4cD1sf9DPDLX+?=
 =?us-ascii?Q?nx8bo/um5Gf4nIL93QcOzvyMCH7DliU/FbGoIGKaYB+nUwa0a/r59WOsAyxg?=
 =?us-ascii?Q?pJpoJz+n3glNQ5L6nyrlhaLrtVe1PMDYDBVnUObqj+tr7Hsx0fTYsVL4WAED?=
 =?us-ascii?Q?dDpTrO0xSlf0D8UYb8nLiDI8Vl++sd443cqDzHQ2jEqNx42s2quIhhsPJKR1?=
 =?us-ascii?Q?DwLU7RG+Bx9OtTljPso=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7c7b5c-bbf5-4d32-de09-08dac0c1766c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 13:10:37.6757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gfFOii9Xqs7sykpBsFA7ywoCoGIjaxVGipfNPT2x0VsATY4AV6Svp3azNiXuIaf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5899
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

On Mon, Nov 07, 2022 at 03:01:08PM +0200, Oded Gabbay wrote:
> I don't agree with your statement that it should be "a layer over top of DRM".
> Anything on top of DRM is a device driver.
> Accel is not a device driver, it is a new type of drm minor / drm driver.

Yeah, I still think this is not the right way, you are getting almost
nothing from DRM and making everything more complicated in the
process.

> The only alternative imo to that is to abandon the idea of reusing
> drm, and just make an independant accel core code.

Not quite really, layer it properly and librarize parts of DRM into
things accel can re-use so they are not intimately tied to the DRM
struct device notion.

IMHO this is much better, because accel has very little need of DRM to
manage a struct device/cdev in the first place.

Jason
