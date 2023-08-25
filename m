Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8A5788DD5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 19:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B73010E0F7;
	Fri, 25 Aug 2023 17:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2066.outbound.protection.outlook.com [40.107.212.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A8610E0F7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 17:29:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkgSZvODduQQC/hPaTv6w37lDTnoaowyQOf48lngkwFWbksMSZ0LkVHTHO3EIjJGmTIK7ZCyM7MMvqTyWfROdJM8CDwrnDxkH2KB4CcaM+yGoYlf2r/MmbHqgV4fe7k7UWRlqj71iIZY1TXizjIJTyRIZtNWLT4P2IEiBkEX/D/i6k9yYaTsZlWs18r5Zw0mFV1JZoArydyDN5eW++QbUtSdgXceLvvsSz9HbEVkSKi+9/M7C7aU2p4kezqJHG34pAcUzuKkqTHS6hbHL1tL2IDah36VMWEBbhGkczKP4lP4hdaKtOstImWlJM/UEyJMMDZsoRtTsHEZko6HMlRE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUceOTMQ1QU5NtR2J7HhCoVcyvDEJy7Uk212rxoTKCQ=;
 b=S9aOCG5iN09Ept8y4TPnHPcj6zHDn42UJNhy9IFiGHLsuWjUwKbPmd5NxiKZ/NwAxwc6VYZ/LkF8I45CM0TCVbYGj9HRvKOpwdqUVbQmfN00l6r7ejio+6nGtfRgHZXuTvqU3vUTPbgTezfk3eoHp5MMDjVyrSDZZXCC2z3Ww4NlH/op+UU8Wvw5/+S1s2R63M7SRrTCjS6tNiELMywyAeb4d2aPSiLYTdSdIPMFk+tJHHkBX4Sm68yvzNg6vjBhl2Zkf3YkvYDfmQcYKTqSLCEHJw76jFgfmE0xGkUszGK2/PHlOn1JBZIG3jeBJ+5fXi+4+1VFqNMMO3t6qdGI/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUceOTMQ1QU5NtR2J7HhCoVcyvDEJy7Uk212rxoTKCQ=;
 b=I4IPR0xSsp+mYzP54EENYYRfAk5URng40NfsfjvhzG5USfXhm6Xb8wmPwuGj+CHRqUGudVs7dp0i4QJOn+VHb3VGfTehTrxCg8Xr5jhG818s2xcYfsxuyEu6OZ9FjGQ/2DrIVU21F1k6ArHM5eFj8i1Z0B0b8ngu/Me219hwx/aeC/BgWTw1Y+Wr02EVo2slbSKAj94osmt2lS0GLi2NJwwY/P1oGnjl+jE7OMJh8xzhP546vSKA6EgIV5NqRTTTsFwnN+gzfB/QIilLtqtMxqG95NGmEInrD9RVpd8GZShbbQ7Il4cdVQ5VT1zKwIlDDtv6Bn/3f7DFmWDwnWGYAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB7788.namprd12.prod.outlook.com (2603:10b6:806:345::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 17:29:43 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.032; Fri, 25 Aug 2023
 17:29:43 +0000
Date: Fri, 25 Aug 2023 14:29:40 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 0/3] udmabuf: Add support for page migration out of
 movable zone or CMA
Message-ID: <ZOjlBGcj2VMP+ptd@nvidia.com>
References: <20230817064934.3424431-1-vivek.kasireddy@intel.com>
 <ZN42XjuXUyma5uE+@nvidia.com>
 <IA0PR11MB7185ABFBB06771B7646F8F50F81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZOSo2cuw1ashK3+Z@nvidia.com>
 <8afa35bb-c3ed-c939-46a4-a9a277b6d4e2@redhat.com>
 <IA0PR11MB7185B7B437E98F7F594D3E0EF81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <b35cd8f7-e7dd-e47b-112c-62ee84c92768@redhat.com>
 <ZOeh4x58eGel7WwI@nvidia.com>
 <20e38c1d-24e0-4705-6acb-87921962ccee@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20e38c1d-24e0-4705-6acb-87921962ccee@redhat.com>
X-ClientProxiedBy: SJ0PR05CA0209.namprd05.prod.outlook.com
 (2603:10b6:a03:330::34) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: 00c2748f-6cdf-4251-8b09-08dba590deb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: te45hAE9aggDuwcTFU9JQy8uZ+pObVERi8TSR4lCajCh0sy3e1bpj71PGJLKsVizlLkhVgARRWGo5j6VEZDQZ+0UnL0qT1i4T398o+q1dDH0zdXzPjAujOh05A1HQpBH5iAd64VMQtt47r7eaHlUStde/1C8qCTs78v0AvGmcUYVfdvLszCoOTFIRJKqIYVDgqa/o6c6C24B4N+3mhvKJp17/zf61/pEUurgmkzbtYgeKpvVQcc095gW74vEVN5B/YSqxfthcKHjewDuA3HMG+MKIsL74qR3QKndpMRJtoMPdXJ/mO574OK4MBM34H9cCyEgr8t6gNY3he6w0ukRS9O3eyt/tRdn8aoUCTc6rl/Edjkt+v40Mx4pwxsX5GYn5cxV4kujMHYBv4j78rN+Zl3HeD5eRu8ztNP8ywf2tVqOIDLjdh61xpYgC9QEiSUlB4srQoheIDIqR7781Vfa/HmjuE2PAnp67dFYzUEM+fMAjFxuW7Mh1Ktf4CCGLWSFSZ7nz3FXbM+mp8QpD4ySf6NIoBzUzVepnirvfn9C67PNrM8lZvKdMdCjuXhUjTsV0/VFkN+mbmEG+Lp6kdsAgf2DgFrKKQ+7xq21W59vldI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199024)(1800799009)(186009)(86362001)(38100700002)(558084003)(36756003)(478600001)(6486002)(5660300002)(2906002)(4326008)(316002)(54906003)(6916009)(8676002)(8936002)(6512007)(26005)(83380400001)(2616005)(66946007)(7416002)(66476007)(6506007)(41300700001)(66556008)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?APGUIXFmVx3z6w44zHmBHhHbkYw2NbI+XC8AfNPqEMZW0pQeOl2PURGnJ3yZ?=
 =?us-ascii?Q?N340tCzqZvhgUSPZMPciFjVehDmc3+F721lh41djpq6DVoYHlI5/ar9I55h2?=
 =?us-ascii?Q?X7UIiklAAG8EnR5YftoGMDiVMwJPaZ3xoz9EgypcaMo3GkX3ZWRsVy9Gs42j?=
 =?us-ascii?Q?xi4fwkMlzJrH0fqBmuU8x2AJWcDOqovMDIp3DdL9uFaJugbfmW9eeth/1rO5?=
 =?us-ascii?Q?J/nCLqt5cb/nMO6ipNXUiC9seWIjXySd0F2heK6J3zjXmbtOWSK/ljk7vcyH?=
 =?us-ascii?Q?lC8qjlmGkIXSJSzXja5KKln3xj7vd2g1HJEy0VMQXndcixx5jjnkSK/jkm0O?=
 =?us-ascii?Q?YKHsug4+k5F2bpwku7BK3yEIKTZ3tEQ2H57hbfAnZ5Afba/aurLLJ1PnNy8I?=
 =?us-ascii?Q?e4vvW2HDJHRrMN+tUKqJUXjxU9KtGL65Ml7T/DFWh+Q68xpDV/fklsSjB4AX?=
 =?us-ascii?Q?ck9ZGsTSAY+J2mHvYHNjRD/eWiiGVLa9mYyTirDcizOC8FkM+7HJHaQ2Q0kn?=
 =?us-ascii?Q?Z2hqOHF7O4SvEVjRNC8uLtqO3iVdqsJNe8pX0Z/XRiRjeMS/T7hW7AwnuByb?=
 =?us-ascii?Q?1Bbwfb0A9tzswUweM+9+jt94Vcv3vFaaOvwV643w79nY5GXBVALJSIeF5Uhv?=
 =?us-ascii?Q?BfYd2wAFaDF88PdXrlooxmIhxyO5EegeMpta3XqlEm87cqDDcTAkA1z5o40w?=
 =?us-ascii?Q?/USPu8RtTirPj1II1o/4UrsGg70RkYZ3fzbZkesI5sZw7RZ0HdLpa8N4VtRh?=
 =?us-ascii?Q?ctbSbKNyXMcUnWuHGR2RRt3fQK/gNMO1wdw4STAl915xqFPHd+Ngdy9mv/7T?=
 =?us-ascii?Q?HWxUXnlc7xW+cwaAvRp+konnwrCFqnR//g37BYtoBt8SaXEUeJkJDsHOAKsf?=
 =?us-ascii?Q?B5OJfa3l18agvnezh7xPtkQ4M7GaoGWeKtDshYOPRe68lMWDdcfmOy4qdo7b?=
 =?us-ascii?Q?+3T+nyUnEeRsqkUq6TBm0469peRDlEfyXT5IdmE36mST+obV35IFv802TUf2?=
 =?us-ascii?Q?pB+jCUa9419vPwBNLT+U1CK7ZIgs3rCgUApJO3m3rnEElAH4QXjZxvQoYHlM?=
 =?us-ascii?Q?zVuOSjua2GJPz2l67gFYEMokuEpN+EKNBaD10sdMFcQP/tucPjgM+eSk7Fvn?=
 =?us-ascii?Q?GirkfIbPB3ioSvRYeoB4eVweLjAdPel/zeqmcaPAjBj3D3uysDekzhwmvHPP?=
 =?us-ascii?Q?naVwpamJIEUnSXIB397ae4wrtS1JHnTymqNkO+YXBvfzVre347fH/FXg9xz8?=
 =?us-ascii?Q?+Kspf/2+Qwfzur0fndomHZYOmNgSO1L8ND/ST/KDGos03qvx0S6BtvU9w19a?=
 =?us-ascii?Q?fCX5cOKEPtw5TFD6kkzQVM/SR3G7oic4ES2YuRxBzZkb2dkbNb8BnkqysMNt?=
 =?us-ascii?Q?oJRBDvC2ehCtKIZKPzoEUeF2dhgdgGmu56NUrxjXU2O2a0YS9dE9hVfAXnwO?=
 =?us-ascii?Q?kQr28pwahS1cX7cGMXV2JRQVLPhiwH824is4KOe7V8neid3o3T0Xnmsoka/L?=
 =?us-ascii?Q?nnQlKgh0ruGlRIcD5hdwOZ/2MmNfQem8NB+V9pkhkAliiVK2b2/PTD+l0Do9?=
 =?us-ascii?Q?OYyzH6OUGIq3SxXxn+r5z9bFSlY4Eb1Lq89VHzto?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c2748f-6cdf-4251-8b09-08dba590deb9
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 17:29:43.5404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1u8dNYrz5AOu+yo0Kx75PjCKKTI7ghf/rrzt2fg6K5T7dcCq57jXNr+ruxI1i9cZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7788
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 "Chang, Junxiao" <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 08:33:09PM +0200, David Hildenbrand wrote:

> Sure, we can simply always fail when we detect ZONE_MOVABLE or MIGRATE_CMA.
> Maybe that keeps at least some use cases working.

That seems fairly reasonable

Jason

