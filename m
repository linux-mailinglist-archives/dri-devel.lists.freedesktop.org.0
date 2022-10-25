Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F4060CAB0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 13:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8950E10E04A;
	Tue, 25 Oct 2022 11:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8E710E04A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 11:15:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzFkEX9EvDKnol5BFxyqzIagO3y1586+pJWy5I5139/kZD4d1eYLGL7HSCYLgmDZ4xENp/PijTgUar7EpVmn23tZjcpFMMXfW9bAECnSuv2fo5F9n1GrkeIX33CGv+bins5mMt8Z/btUVQdKvJ8ovNz94g2C0/U1P/cDR+n5z4DNGdTam1p/D3b8qUyhtJb/75Bic9q2L1qwc6I40HIxZbtQ4otEqDIf9Qy8dBbn9TcgYkC/nw7a3jsnOqnUSrEy5Pz0F/QNFDaiRo2/OeugeYuBrqLCckaE0gWV9pIQ2NEHKV3za/TmzcWu8qWcN7YUs4eB0a8UrEx0h25ktN3V1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AxNLGCBw6eqRe4iZu7SFM5ub1eNn7QisVS+TiijpVs=;
 b=JhxeZMNQgSpGK5ibIf1Pn+dJhlJJbZ0pL/7y1GV7w2SfaMqVmxh3BDtXGOb9GghVznzlfxJzlvBAiiLqQJ0lIf5wi7rEYpCOMY6iR1ekBwXxhyM5M486o6ZSiqT/XxjPfkXj3laepmE7FKfRVgsGEe5Nc3tJ94cWrxp1KDH9iD3tHLyHDYCbunApclodK9mp3JrmAKx1sbe8aeYPtv2w7TqdRsV02rn8f3XfAE5Vcjq0ZvZHd5dlk+ModYEG95ue8u6HHx36vf2dU4+BS3rO3mWY/RMkNZaHk7mF3b/ctG/Pk8xEqySXCzTgfIJ0Kz9J/kO+FqWoNmRfYDf8FkGqjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AxNLGCBw6eqRe4iZu7SFM5ub1eNn7QisVS+TiijpVs=;
 b=crKIDlQ6uNanB2hIjiXBe5/DzDfgNHzoWOO0IbCOuR7riJNjKL5b2mrrt9gWkzr4tAEeVtO4Q7pGMAJqmR5oUv2eRVDSDOD6Q4cPtXa9dLoa8nN5gky/dQ83KJNzKGJXcc2+zBSAvnoauAJs1Pd0O0thcwwfqTmTTMJzVgkRASUIdoSqq51dSHz1EGOIwh/rMEy/n47Knfc2p+wowoec0nXqO0Quch0vo8/J23h7qfYmgl3TDIhEyRSo++P28hYV8SZGWHQK+BW+3+vljuGVDhSC+rp/9VnBzN0SQOJNX/gZQUiM2hnnT2PETOtqqxsAk+nSsst73bN10rlChR93qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5345.namprd12.prod.outlook.com (2603:10b6:610:d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Tue, 25 Oct
 2022 11:15:17 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 11:15:17 +0000
Date: Tue, 25 Oct 2022 08:15:16 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [RFC PATCH 0/3] new subsystem for compute accelerator devices
Message-ID: <Y1fFRIxRq+enLWyd@nvidia.com>
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <af4c71cb-be60-e354-ca4f-23e834aca6e1@suse.de>
 <CAFCwf12HDZvsr1TrRFQH9Vi26S-Xf9ULgxtBazme90Sj5AzhQQ@mail.gmail.com>
 <c22bd93e-8bd2-6865-711a-37aeadbca7f9@nvidia.com>
 <CAPM=9tyEqzQ09WcRtE1Zd3XjOaR9a2ms-vL-O5x2ong7iPF=4w@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9tyEqzQ09WcRtE1Zd3XjOaR9a2ms-vL-O5x2ong7iPF=4w@mail.gmail.com>
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5345:EE_
X-MS-Office365-Filtering-Correlation-Id: 885835b3-9427-4f7a-cba4-08dab67a3272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AdkhpVSLcnPdir78sK0Pv+GKs2W5f1DDZY4Aofp7HXo+NFIW7SWt9ED2JLcURPrY4rIcDfKfEpD/NueS7kaiaRaQohdbAkX12l4BZAZxxEzrs7SZPAWLJm3NbcIe10VJoO7NtUkUyVNVCGE815ljUDaBvJa9PrzmVab9ZjJCe1rYO/gfWic1aCxrg2qE8uN1ysmO9P1PtI08pb/W5PH+5ZJ8qrBrjFqpPKCpPnKt7OKkkvHeNeNHx/1PL2x5nx2jIXN+rZJoINr3w8qbDA5md5AhBN52yxp06wk8eefcmt51as8U181VTSNYjFiqwjcEZrUBkkHlEsYpoSzAP3Cvh1xpa5Ng7hv9V2vElWsW3ky6m8VShyUoO6yQjqC1krsBSRGcoqnRsqrQI1PM7dPhmjo9RNqvPr31Pg2aRhtzxMLp6/F602OLoxdyjfKI0d+PhNZuBFZqZyhygh2JQdgxA2FoVFxZEN2my5L7H8OhtCuFcY9CHa8BvsNviKNlUeZoWitDUi8aBshrUvlKSCNonu9XkoSpMOsHCPemLPNdvrwIhlsJVI5TxZWbxDqM5xodAKnnUdSiQ3UEWHIGiMZpOeXq9GGsyWU5zqM2Trpi9xOH8Do/2mbMpZLSStWB4Rux6b21WkRiUZiqJJ5N/iPvIbRDHA4ImIhbxeuQvXeB56/GB1nqKLwR2s9taSH0xS9Qk7ZeIZ3TJ2GU/H4Wo6mUwinwimkAAIuqRWlbYaEoFdIgH6KBypkTwWvzFNTztLdI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199015)(86362001)(54906003)(478600001)(6486002)(6916009)(316002)(38100700002)(7416002)(5660300002)(41300700001)(66556008)(8676002)(66946007)(4326008)(6512007)(26005)(36756003)(2906002)(2616005)(186003)(8936002)(6506007)(66476007)(4744005)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nwwg54+PEtjKnU72kp5xVP5/qxNfJdm0WDCRLOnTZxLAW1dMql8scT/65jag?=
 =?us-ascii?Q?pJ3YMyILoCMOX97H3N0q9jODgl1INB7UzASuttdvWxSr0+ONozGSF4xkUWyp?=
 =?us-ascii?Q?81Su/kTCLR3KYcjJIQRZtoERiqRvO9qCIz+ZuyA3i8/fPY5TxgcZMWSJwHMN?=
 =?us-ascii?Q?QWoTJa8aCTK+v7gRucdxtyG0bN1sthk1euLyGI5Px7bomYZxLspvnLGWk2rz?=
 =?us-ascii?Q?0fGK6LKUUPfjnn0riKNtBGz1g2bx04HkHJyPNE7VZJsDrwVpUJBuBzkQEQPi?=
 =?us-ascii?Q?tUc4kI8818Mx+KUSns98BiRkilZwvEJFJifqdKtdZTgn6iWx1YJ9Y/OIs6UF?=
 =?us-ascii?Q?YaV+xRHvVjE+gIbprxl7VfODOBD7EOl+OZHJD6Rrag4bGAwXs9A6sETuMtwQ?=
 =?us-ascii?Q?qlTn6slsBV/VYVJcoaP6hSJjx1GIjQbgnxdqzB59cV1fx6crMVo7YhZdwPL2?=
 =?us-ascii?Q?0UPx2661L1fmNX5+F7LBwiMTMXjFrd0IHutDc6WFLLoflm/CjjyJo5gM4689?=
 =?us-ascii?Q?9bRIdHETtoi6uyYAtn4NArsawVIAbxj2n8RgK94QXGE77XHhYNgCtxmd8rMY?=
 =?us-ascii?Q?yZzq46y9Xs5GKmZmrzVFjfsRwa4KLNdFjjMZTJnXhRofK6UmRRELsPB55gi5?=
 =?us-ascii?Q?wKrNBqh29BNcC/xfmVEQCQj36UeNP/VDO7wVJ8tfmgf05UTfDgnkInsJoJPe?=
 =?us-ascii?Q?9keiAHlvFoqWevDuISJJQGsgCbYv81BEXshnYM4dJwbyMXL/myWpZ+mfkUtr?=
 =?us-ascii?Q?RFEqgjNRwpx1mD329ULkCeVUtQ3bz0dxDppdaNXHA/ZcjzbrHeNtkhoW9tYC?=
 =?us-ascii?Q?ybzyXQsf95sjINh3K8aiff3kx88M0nU3aHr0q8rkDPl/EkcOGibo94h/H+bq?=
 =?us-ascii?Q?VbJM+3NHBecMIAFUBMyHkxQK+3MCa/dCqSUPMOwqND1iviE/Q02PMbCz4U2a?=
 =?us-ascii?Q?3oaXsIQnTnleS1/XVLKol2g0s/wpf1QfLNvZT48E6CJ87FsKdE5hWjGYVr2Y?=
 =?us-ascii?Q?Dtwag1/oyRyb6hVVp6EDb4FPNPxHQubLe00Y2xh2+d1n/QQDyL9Dalvn8CJN?=
 =?us-ascii?Q?Aay7vpDxUDaA3utpNZpy5yju0pd/WPBcg40xJ9nxvvmaMs5hc/BfoLUQKBV3?=
 =?us-ascii?Q?k0dFFrYw1GuTohoD7W52+oG4gAJUpxinuk9lCGvDxajGr8FTNajYQAYf+MMV?=
 =?us-ascii?Q?KinVs7Sp8tc7ovpHGfYg8x8ItWHhz+PmfM4embBjCWtL/4LTFSJBFGoXvCyK?=
 =?us-ascii?Q?samcl2rlaZ9uOEtMC2bYQY7m+aoQPWDAQie0WQMYoV17fgkTPpLO2sXC5JGF?=
 =?us-ascii?Q?FMXUwYBJImRVwoh+ZpqrS+ey9YV/Kx0IvWFOO3pXrUsoecuzmo7jrxW2KMYJ?=
 =?us-ascii?Q?TKXSgVh56yOPzqAN68693M1WsA2SGELfSlXoGyH5seupSEvIKzGN/zUaMw/y?=
 =?us-ascii?Q?YiaX4dSAoiSHhal/vrwBTnP3a74cHP2ya+VkL2T7uiawAlNrFLaInJqyuajx?=
 =?us-ascii?Q?u4l42S7dREK/tZ7QMHSsKxBNTufE6bUirhdALYFGAOWV2lLnLI0cPbHdRQmG?=
 =?us-ascii?Q?R2Tv8j5w0UZxxQRSZQg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 885835b3-9427-4f7a-cba4-08dab67a3272
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 11:15:17.6870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfCNMwBWqqxKXyIw7PFFNLWYaGW91+uomkDO9ktZ6IRWeHc4e5aP6eXpQ6tPXO1n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5345
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jiho Chu <jiho.chu@samsung.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, Oded Gabbay <ogabbay@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Kevin Hilman <khilman@baylibre.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 25, 2022 at 12:27:11PM +1000, Dave Airlie wrote:

> The userspace for those is normally bespoke like ROCm, which uses
> amdkfd, and amdkfd doesn't operate like most device files from what I
> know, so I'm not sure we'd want it to operate as an accel device.

I intensely dislike this direction that drivers will create their own
char devs buried inside their device driver with no support or
supervision.

We've been here before with RDMA and it is just a complete mess.

Whatever special non-drm stuff amdkfd need to do should be supported
through the new subsystem, in a proper maintainable way.

Jason
