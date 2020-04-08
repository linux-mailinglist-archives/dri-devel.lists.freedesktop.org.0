Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CCC1A3021
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3F16EB6A;
	Thu,  9 Apr 2020 07:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B5E6EA9E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 16:22:22 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 741B040676;
 Wed,  8 Apr 2020 16:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586362942; bh=l9sBrvrvegRKI9SUcUF/EwgfFTINGmPIkIT0DDuwJCw=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=C1mvJ/tHmANfHFcqhGvEddkcsG5+fHSlnGMlOlXxRkG6g7ilfF2Tn+xXu7Iv36gf9
 LiRKDVRxfLyK8ZUYSmeajVMFnhhCxIsPxoIdJgLTjpOdgfCvVNIbfRrhq/OziET4ou
 soLfi+rxWTte6RlksAdo5Dl1I2QQEohN/1DpWHhiwsqSUI6gW1nWwDofVIYEEnHe/i
 FlrBmU1k0CDFSzu+Hit7EKgGcfJitZsTZnj/bZeR/vgyLzGjaXSnJ7FY9qSnT/Mc73
 AgVy+OQ+Cft1j9EJcPGOf+TlY+itgE87CYgFrAjWVdRy9OAlC/yFJ8KcyDCle8IpEe
 1aHYH+gx1zYvQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 10A12A006B;
 Wed,  8 Apr 2020 16:22:17 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 8 Apr 2020 09:22:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 8 Apr 2020 09:22:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2JWZWK/ovm6s9Jbyc72aRYGEEBBABlrb592fj/KvgrG5rGTjIZOJ17AuhMcjPRiK+eHoWbfeTECpc4x+sKEG+I7q3lAT55tUgQJGyVV4wFAS/gb3TFfaFvh4HBIvSEV59srrZ/P2gWY2RTaQ6S+gZggl/koODiIa26yD40zSuCe2006RSx8PhRYViRZDqZfUw70OyA8yJMP4pHLcKGwiTViZQSDpYwi9veQo+vcZgu3F67GZ02Ob5C/gSyqaZjk4y8vJfq1yLWJ7d5GRmmh6yEUt+AUF6SdxW5ru4OpXFFGcrjHxj3TNpx/cH09UnKL/Q5EQcCkuY1xAQGpe9D2zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqEyPD3Zuf5UDS0a4jJPqSwDkuUp9+ePd4R3LGkqm/A=;
 b=QMal0Y1+A++X659UxogEEMqhRH72brojgHFoQTs8H/VQFTMexGCNHHjxzwP53gPe3t3EcHHzVZUruUu5AZ1m3G+XS1K3r5wLsXjyiGcXWV3lgV2sfLbSsYluHQ0AsGWtwyyFPsSqtojaGW4V84Y4y0iYUlVdBLC+enoVjGmDoEOzcUnyHdhGa/aOiipxZ181sADchsgG5xxfuJnRtmPXiPZe87Bgu/K8mhFgo+SYXSaqxiY0guiOszZyiFrZnp0B2qvmZ+oJwjbMy6RqYgQXcOsm6ec/3YARe/UotaFctUAjfLDAjiCwlUGk/srQU7lPzeW5/+cNHo0iqSTqKDMEBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqEyPD3Zuf5UDS0a4jJPqSwDkuUp9+ePd4R3LGkqm/A=;
 b=PrXmRgO35/s0ktKBhP1Tn50X+lWxrnT5/vRiJzItRkxi6VmhxUy9Ve7RCAfF+qfFd5fRRq0UeKxR5zgek7lrn3AGYG3pj+1W5nWxEVVfR/MkZqO0Q8ZgZU5Tr5NalcY0srNxKRrRVGqDweNgkYH4C/Dk8uu2TmfI5jXH5CNEZSQ=
Received: from CH2PR12MB3782.namprd12.prod.outlook.com (2603:10b6:610:23::28)
 by CH2PR12MB4327.namprd12.prod.outlook.com (2603:10b6:610:7d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Wed, 8 Apr
 2020 16:22:15 +0000
Received: from CH2PR12MB3782.namprd12.prod.outlook.com
 ([fe80::98c8:5bfd:ae23:37cf]) by CH2PR12MB3782.namprd12.prod.outlook.com
 ([fe80::98c8:5bfd:ae23:37cf%7]) with mapi id 15.20.2878.022; Wed, 8 Apr 2020
 16:22:15 +0000
From: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [PATCH v2 3/4] drm: ipk: Add extensions for DW MIPI DSI Host
 driver
Thread-Topic: [PATCH v2 3/4] drm: ipk: Add extensions for DW MIPI DSI Host
 driver
Thread-Index: AQHWDBbMvXG/yV0ow0quQOwBbF95eaht8kqAgAF258A=
Date: Wed, 8 Apr 2020 16:22:15 +0000
Message-ID: <CH2PR12MB37826C649EB8C3065722F032CBC00@CH2PR12MB3782.namprd12.prod.outlook.com>
References: <cover.1586174459.git.angelo.ribeiro@synopsys.com>
 <8b63a8390bbc0e81d01540648da7e6b03b8577fa.1586174459.git.angelo.ribeiro@synopsys.com>
 <20200407175159.GB6356@ravnborg.org>
In-Reply-To: <20200407175159.GB6356@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYW5nZWxvclxh?=
 =?us-ascii?Q?cHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJh?=
 =?us-ascii?Q?MjllMzViXG1zZ3NcbXNnLTE5YjZmODk4LTc5YjUtMTFlYS05ZDcwLWZjNzc3?=
 =?us-ascii?Q?NGVlZGMyZVxhbWUtdGVzdFwxOWI2Zjg5OS03OWI1LTExZWEtOWQ3MC1mYzc3?=
 =?us-ascii?Q?NzRlZWRjMmVib2R5LnR4dCIgc3o9IjMzMjAiIHQ9IjEzMjMwODM2NTMzMDI1?=
 =?us-ascii?Q?MjI3NyIgaD0ia0JrTWF4bURQanNRM1dxd0VVMUg2K2pNYjRrPSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBQlFKQUFE?=
 =?us-ascii?Q?MWdWTGN3UTNXQVMxbEcvL3lrQ1JzTFdVYi8vS1FKR3dPQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUhBQUFBQ2tDQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQVFBQkFBQUFveW5uNlFBQUFBQUFBQUFBQUFBQUFKNEFBQUJtQUdrQWJn?=
 =?us-ascii?Q?QmhBRzRBWXdCbEFGOEFjQUJzQUdFQWJnQnVBR2tBYmdCbkFGOEFkd0JoQUhR?=
 =?us-ascii?Q?QVpRQnlBRzBBWVFCeUFHc0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtBWHdC?=
 =?us-ascii?Q?d0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCbkFHWUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFB?=
 =?us-ascii?Q?QUFBQ2VBQUFBWmdCdkFIVUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFiZ0Js?=
 =?us-ascii?Q?QUhJQWN3QmZBSE1BWVFCdEFITUFkUUJ1QUdjQVh3QmpBRzhBYmdCbUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1BRzhB?=
 =?us-ascii?Q?ZFFCdUFHUUFjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWN3QmhB?=
 =?us-ascii?Q?RzBBY3dCMUFHNEFad0JmQUhJQVpRQnpBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFIa0FY?=
 =?us-ascii?Q?d0J3QUdFQWNnQjBBRzRBWlFCeUFITUFYd0J6QUcwQWFRQmpBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNB?=
 =?us-ascii?Q?QUFBQUFDZUFBQUFaZ0J2QUhVQWJnQmtBSElBZVFCZkFIQUFZUUJ5QUhRQWJn?=
 =?us-ascii?Q?QmxBSElBY3dCZkFITUFkQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCbUFH?=
 =?us-ascii?Q?OEFkUUJ1QUdRQWNnQjVBRjhBY0FCaEFISUFkQUJ1QUdVQWNnQnpBRjhBZEFC?=
 =?us-ascii?Q?ekFHMEFZd0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR1lBYndCMUFHNEFaQUJ5QUhr?=
 =?us-ascii?Q?QVh3QndBR0VBY2dCMEFHNEFaUUJ5QUhNQVh3QjFBRzBBWXdBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFB?=
 =?us-ascii?Q?Q0FBQUFBQUNlQUFBQVp3QjBBSE1BWHdCd0FISUFid0JrQUhVQVl3QjBBRjhB?=
 =?us-ascii?Q?ZEFCeUFHRUFhUUJ1QUdrQWJnQm5BQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJ6?=
 =?us-ascii?Q?QUdFQWJBQmxBSE1BWHdCaEFHTUFZd0J2QUhVQWJnQjBBRjhBY0FCc0FHRUFi?=
 =?us-ascii?Q?Z0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFITUFZUUJzQUdVQWN3QmZB?=
 =?us-ascii?Q?SEVBZFFCdkFIUUFaUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFB?=
 =?us-ascii?Q?QUFDQUFBQUFBQ2VBQUFBY3dCdUFIQUFjd0JmQUd3QWFRQmpBR1VBYmdCekFH?=
 =?us-ascii?Q?VUFYd0IwQUdVQWNnQnRBRjhBTVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFB?=
 =?us-ascii?Q?QnpBRzRBY0FCekFGOEFiQUJwQUdNQVpRQnVBSE1BWlFCZkFIUUFaUUJ5QUcw?=
 =?us-ascii?Q?QVh3QnpBSFFBZFFCa0FHVUFiZ0IwQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUhZQVp3QmZBR3NBWlFC?=
 =?us-ascii?Q?NUFIY0Fid0J5QUdRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFB?=
 =?us-ascii?Q?QUFBQUNBQUFBQUFBPSIvPjwvbWV0YT4=3D?=
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=angelor@synopsys.com; 
x-originating-ip: [95.136.124.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87c72ef6-a2d9-49da-4ae0-08d7dbd90062
x-ms-traffictypediagnostic: CH2PR12MB4327:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4327FCE0C1C59A8CE50AEE27CBC00@CH2PR12MB4327.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0367A50BB1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3782.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(396003)(376002)(346002)(39860400002)(136003)(316002)(186003)(2906002)(6506007)(54906003)(26005)(7696005)(71200400001)(8676002)(55016002)(9686003)(86362001)(107886003)(81166007)(4326008)(81156014)(52536014)(5660300002)(6916009)(8936002)(33656002)(478600001)(76116006)(66446008)(66946007)(66476007)(66556008)(64756008);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0jRsTazwNf210tGFYj9ztlumMo83wI81HfgALBhREtc583LyTnRcunPdoda50b+2jaX7OePIY0RO5MOjp9P4Wwj2V6YrRJomkVs10Re4RL2ZxILT2hJyzja7fQXfQn1ZfsARvPBlVi5VrNA9ld7mUup0prPYREvNNukwUaiJHuNi3Mpm3izVJGip0vIk4WYlp52Cieen0AADCHQO2/+5X0ShunaARqeUB0LanBD1n7u3atTpVafrcDU4rVinA4h1c/e8m4DUoC3kzMXNWieJtA3ks01/OE1usg+Eaag4EIV83HPSu++OFBDQ1w47sYpRZwNhqv+kig+GwWqwDkiJ++GSA2Lel5O7kknW4vgeBxZlsRfG2LO/O1p7ImCARMexQYpuma18nAtx8vS0zqVVAQZdMaMF5wmbe83+WrMRzAhO/OYWgPuzg1oR4pcbLKLL
x-ms-exchange-antispam-messagedata: ztahJxkxdK73meqkCZdmQXMuI9PyabA+sgwjkR5WYNdymaFeqKOc7IyVaOjAZUBPRMHL6UcdgKJqZILN0vls7MP2vrYWPcfYneyOTU72VbGWoxcK/Uf25LplJpzgjklpqGiB+vG5GizTAm1o2SxSFg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c72ef6-a2d9-49da-4ae0-08d7dbd90062
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2020 16:22:15.4803 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JpFdtwi70z1ODfXF17mPbyHuflaZHc2HQrSKy42bV2Na8ZUzD/PFFflc9Su07Y6wy4QtD5vO5tO55+8g1d+INw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4327
X-OriginatorOrg: synopsys.com
X-Mailman-Approved-At: Thu, 09 Apr 2020 07:33:24 +0000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Joao Pinto <Joao.Pinto@synopsys.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thanks for your revision 

Angelo

From: Sam Ravnborg <sam@ravnborg.org>
Date: Tue, Apr 07, 2020 at 18:51:59

> Hi Angelo.
> 
> One nit below.
> 
> 	Sam
> 
> On Mon, Apr 06, 2020 at 03:24:13PM +0200, Angelo Ribeiro wrote:
> > Add Synopsys DesignWare IPK specific extensions for Synopsys DesignWare
> > MIPI DSI Host driver.
> > 
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> > Cc: Joao Pinto <jpinto@synopsys.com>
> > Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> > ---
> >  drivers/gpu/drm/ipk/Kconfig           |   9 +
> >  drivers/gpu/drm/ipk/Makefile          |   2 +
> >  drivers/gpu/drm/ipk/dw-mipi-dsi-ipk.c | 556 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 567 insertions(+)
> >  create mode 100644 drivers/gpu/drm/ipk/dw-mipi-dsi-ipk.c
> > 
> > diff --git a/drivers/gpu/drm/ipk/Kconfig b/drivers/gpu/drm/ipk/Kconfig
> > index 1f87444..49819e5 100644
> > --- a/drivers/gpu/drm/ipk/Kconfig
> > +++ b/drivers/gpu/drm/ipk/Kconfig
> > @@ -11,3 +11,12 @@ config DRM_IPK
> >  	  Enable support for the Synopsys DesignWare DRM DSI.
> >  	  To compile this driver as a module, choose M here: the module
> >  	  will be called ipk-drm.
> > +
> > +config DRM_IPK_DSI
> > +	tristate "Synopsys DesignWare IPK specific extensions for MIPI DSI"
> > +	depends on DRM_IPK
> > +	select DRM_DW_MIPI_DSI
> > +	help
> > +	  Choose this option for Synopsys DesignWare IPK MIPI DSI support.
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called dw-mipi-dsi-ipk.
> > diff --git a/drivers/gpu/drm/ipk/Makefile b/drivers/gpu/drm/ipk/Makefile
> > index 51d2774..c80503f 100644
> > --- a/drivers/gpu/drm/ipk/Makefile
> > +++ b/drivers/gpu/drm/ipk/Makefile
> > @@ -4,3 +4,5 @@ ipk-drm-y := \
> >  	dw-vpg.o
> >  
> >  obj-$(CONFIG_DRM_IPK) += ipk-drm.o
> > +
> > +obj-$(CONFIG_DRM_IPK_DSI) += dw-mipi-dsi-ipk.o
> > diff --git a/drivers/gpu/drm/ipk/dw-mipi-dsi-ipk.c b/drivers/gpu/drm/ipk/dw-mipi-dsi-ipk.c
> > new file mode 100644
> > index 0000000..070eccb
> > --- /dev/null
> > +++ b/drivers/gpu/drm/ipk/dw-mipi-dsi-ipk.c
> > @@ -0,0 +1,556 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2019-2020 Synopsys, Inc. and/or its affiliates.
> > + * Synopsys DesignWare MIPI DSI solution driver
> > + *
> > + * Author: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> > + * Author: Luis Oliveira <luis.oliveira@synopsys.com>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/module.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/bridge/dw_mipi_dsi.h>
> > +#include <video/mipi_display.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_device.h>
> > +#include <drm/drm_print.h>
> Same rant as in previous mail about include file.
> 
> 
> Rest of the driver looked good while quickly browsing the code.
> 
> 	Sam


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
