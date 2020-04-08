Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C321A3026
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6FB6EB71;
	Thu,  9 Apr 2020 07:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6986E0A6
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 09:56:34 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7E775C00BF;
 Wed,  8 Apr 2020 09:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586339794; bh=2WHbTkVEOFhnBVZEkX0pfr3Vmj1W0BKgM8GgqUlUZ5g=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=HeKYkVPYNFfITnO/elIdc1ZxFml+0824o4JiNVgLBoQjOLIzLSh7zODJK1u8P0Lmc
 c7v2L7KCL6pc3Mgo1AQpKwFT8KLp2kRzbou9IvbOhj+lpbIU4YXc5CLGaemx5lcNTs
 wZvkHAGyPMczETOAM6LyTHqF4Jhjh50GHHPB0dJswb7AybopyueWZVP2WG2rNCqoCI
 s2eJb06xT2PnAEq7AF8dG9ug056P7I2zRUqoUumY/8++CIOUKySjsjRDs7kCq1eWG+
 m1JQcAMXHtJ4RTaYJ3wfApfO6F6kPcLW8j08QVsysa766ByXpsewlkKMfandEOE5k+
 rq0GYzSDZ1yeg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id B0813A0067;
 Wed,  8 Apr 2020 09:56:29 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 8 Apr 2020 02:56:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 8 Apr 2020 02:56:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGfP30+ANGXRnlPPB6Y4j1rDhJJbxv8CrP4uYemZRESgomQyVvg/4Uxti0ubsrBjEiUVWkYw78YV0B7tBSCoxxqtuPvC6JzRsjPmEnOYTyyXnrGUsUXjJ2sTK2Xi5X6GFAhSyQimquHIwY3eZ+cR731s3kSWhGxYWEbxUcDYlWdx0PVx1NbWU26OsynPFIYEZ4/mOZlkcU194tOIZozu27+7mbW6mCZKquMFSrG1MBX98ZSShqteK9RtYrsPUPDS2NnIr1AkvXcr8pVzjL2rOBBG+YBfDCpYtKgzkOod+AGely+qzOhPVzV7ar1vqXTrTv9dQQabLuQECpHGzSSMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpqJRl6Z4qmlrjSi9Ws8WMV8welnpP5uutmeleZ0/dk=;
 b=eHBZYruRfIqZCElA955wtzmPVkAeeCmwMdTwNtY3SMjFeJ4EUBcAd5fNacavVHzeIlYPQNDqLZOud+8GB+cRila6x6AVl0sTN9B/zBZfd2hA3pVWAZf7K7Cb32om8ioFv3F1hxoq9xZZIGnsulRe35r0NbWnKTZR0JT/EHkbdMSD6UJ5WQIUqz85x0OumAVHA2lyLGba7hy0WQvRJnA0kRyvZiQJDtTgFCVBpyjL2nIbx7FFlqeMgAx8h+y2EfxRdcEYKKUKjG4xNGxoLYu7BUTSwhId68hR5eixrWbq+oPIu6hg/HbV6XElzQ1AGVu50hMr6lT6LlEsYZRumFbNdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpqJRl6Z4qmlrjSi9Ws8WMV8welnpP5uutmeleZ0/dk=;
 b=mSUYqbOfO0/23Qd8+a9GP4r2KseCAYQxfq48ov11Mpg0W85soaANolHqX0IjBGjDDuErwuFymye0UTI70NCt1Adq1EgPQ5wD0nlykfq86UosEcSmE7UiZotZI6lBh4Bkaby5A09/MY1ippoQeQhfTyxZvx5UJdeMj9Qku4JYlcI=
Received: from CH2PR12MB3782.namprd12.prod.outlook.com (2603:10b6:610:23::28)
 by CH2PR12MB3845.namprd12.prod.outlook.com (2603:10b6:610:29::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Wed, 8 Apr
 2020 09:56:26 +0000
Received: from CH2PR12MB3782.namprd12.prod.outlook.com
 ([fe80::98c8:5bfd:ae23:37cf]) by CH2PR12MB3782.namprd12.prod.outlook.com
 ([fe80::98c8:5bfd:ae23:37cf%7]) with mapi id 15.20.2878.022; Wed, 8 Apr 2020
 09:56:26 +0000
From: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH v2 2/4] drm: ipk: Add DRM driver for DesignWare IPK DSI
Thread-Topic: [PATCH v2 2/4] drm: ipk: Add DRM driver for DesignWare IPK DSI
Thread-Index: AQHWDBbUKpmAts4Nc0iZZCj3l9PlLKhtUK2AgAGuARA=
Date: Wed, 8 Apr 2020 09:56:25 +0000
Message-ID: <CH2PR12MB3782943CAAC3BE1B8B39FB48CBC00@CH2PR12MB3782.namprd12.prod.outlook.com>
References: <cover.1586174459.git.angelo.ribeiro@synopsys.com>
 <488ff0f31581967517607e6860ab520839e29635.1586174459.git.angelo.ribeiro@synopsys.com>
 <20200407081333.GI3456981@phenom.ffwll.local>
In-Reply-To: <20200407081333.GI3456981@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYW5nZWxvclxh?=
 =?us-ascii?Q?cHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJh?=
 =?us-ascii?Q?MjllMzViXG1zZ3NcbXNnLTMxY2U1NWI3LTc5N2YtMTFlYS05ZDcwLWZjNzc3?=
 =?us-ascii?Q?NGVlZGMyZVxhbWUtdGVzdFwzMWNlNTViOS03OTdmLTExZWEtOWQ3MC1mYzc3?=
 =?us-ascii?Q?NzRlZWRjMmVib2R5LnR4dCIgc3o9IjMxMzg5IiB0PSIxMzIzMDgxMzM4MDE3?=
 =?us-ascii?Q?ODQ0NzUiIGg9IkdEUzN4RGRvYjdneHVGYUNRM2d6UVMwWG44bz0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUJRSkFB?=
 =?us-ascii?Q?Q2JkQ2IwaXczV0FjNTBlai9YSDhOU3puUjZQOWNmdzFJT0FBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQUNrQ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBb3lubjZRQUFBQUFBQUFBQUFBQUFBSjRBQUFCbUFHa0Fi?=
 =?us-ascii?Q?Z0JoQUc0QVl3QmxBRjhBY0FCc0FHRUFiZ0J1QUdrQWJnQm5BRjhBZHdCaEFI?=
 =?us-ascii?Q?UUFaUUJ5QUcwQVlRQnlBR3NBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR1lBYndCMUFHNEFaQUJ5QUhrQVh3?=
 =?us-ascii?Q?QndBR0VBY2dCMEFHNEFaUUJ5QUhNQVh3Qm5BR1lBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVpnQnZBSFVBYmdCa0FISUFlUUJmQUhBQVlRQnlBSFFBYmdC?=
 =?us-ascii?Q?bEFISUFjd0JmQUhNQVlRQnRBSE1BZFFCdUFHY0FYd0JqQUc4QWJnQm1BQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJtQUc4?=
 =?us-ascii?Q?QWRRQnVBR1FBY2dCNUFGOEFjQUJoQUhJQWRBQnVBR1VBY2dCekFGOEFjd0Jo?=
 =?us-ascii?Q?QUcwQWN3QjFBRzRBWndCZkFISUFaUUJ6QUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtB?=
 =?us-ascii?Q?WHdCd0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCekFHMEFhUUJqQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFD?=
 =?us-ascii?Q?QUFBQUFBQ2VBQUFBWmdCdkFIVUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFi?=
 =?us-ascii?Q?Z0JsQUhJQWN3QmZBSE1BZEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1B?=
 =?us-ascii?Q?RzhBZFFCdUFHUUFjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWRB?=
 =?us-ascii?Q?QnpBRzBBWXdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFI?=
 =?us-ascii?Q?a0FYd0J3QUdFQWNnQjBBRzRBWlFCeUFITUFYd0IxQUcwQVl3QUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFB?=
 =?us-ascii?Q?QUNBQUFBQUFDZUFBQUFad0IwQUhNQVh3QndBSElBYndCa0FIVUFZd0IwQUY4?=
 =?us-ascii?Q?QWRBQnlBR0VBYVFCdUFHa0FiZ0JuQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFC?=
 =?us-ascii?Q?ekFHRUFiQUJsQUhNQVh3QmhBR01BWXdCdkFIVUFiZ0IwQUY4QWNBQnNBR0VB?=
 =?us-ascii?Q?YmdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBSE1BWVFCc0FHVUFjd0Jm?=
 =?us-ascii?Q?QUhFQWRRQnZBSFFBWlFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFB?=
 =?us-ascii?Q?QUFBQ0FBQUFBQUNlQUFBQWN3QnVBSEFBY3dCZkFHd0FhUUJqQUdVQWJnQnpB?=
 =?us-ascii?Q?R1VBWHdCMEFHVUFjZ0J0QUY4QU1RQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFB?=
 =?us-ascii?Q?QUJ6QUc0QWNBQnpBRjhBYkFCcEFHTUFaUUJ1QUhNQVpRQmZBSFFBWlFCeUFH?=
 =?us-ascii?Q?MEFYd0J6QUhRQWRRQmtBR1VBYmdCMEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFIWUFad0JmQUdzQVpR?=
 =?us-ascii?Q?QjVBSGNBYndCeUFHUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFB?=
 =?us-ascii?Q?QUFBQUFDQUFBQUFBQT0iLz48L21ldGE+?=
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=angelor@synopsys.com; 
x-originating-ip: [95.136.124.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8cc4c05c-672a-4893-dffc-08d7dba31a51
x-ms-traffictypediagnostic: CH2PR12MB3845:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB384533AA0F1421672006CE47CBC00@CH2PR12MB3845.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9;
x-forefront-prvs: 0367A50BB1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3782.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(376002)(39850400004)(136003)(346002)(366004)(66476007)(64756008)(4326008)(66446008)(8676002)(81156014)(2906002)(107886003)(54906003)(66556008)(30864003)(81166007)(8936002)(55016002)(9686003)(7696005)(66946007)(76116006)(316002)(478600001)(6916009)(186003)(6506007)(71200400001)(966005)(52536014)(33656002)(86362001)(5660300002)(26005)(579004)(559001);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V7ZrNtB8E5Io5bIO8hgWS1lH4WgnX61FL8qZj1cXuv+49wZMSm7I42cJQsKeUnEOV8gtFJ5bEpGsscpQm9N22/ymQzLa8z9PaLD5MfRQFiGtWyDDoG5Ox3fKJAbAipOzthR3niBA6xJds48Y+sJv6i4EQDZzyrySHe/Xu7dkn6pGLlHX1hwwPEXSnjtBM4Fcn8zwL08fcLF1HRXzyZmwpnAKUkGqbOuR6EQW9W16fu0cQ/HE38+waUrdYK+ZWuDifMujD7Eejw0OSQLQFYLcy7EmCy1gAVPJOgj5gSy6JhWnCwLsWxQfHHype9ZmCzZLZt0yLh0NHs/papaeo1oq61IKhhW0AR75Z9ZVNDNk6yDACg+KkzKe1cCcuGItc68tvzX7Zx0JkmWCSU2QS8N/6BdGR8UbesFWihvjlVJy7t5SubsrWLzHos//zSR0An5YHVGPqVL3I5AV/c9IwySw9GMNWyvgCKDTJXAEEfeL7YurysinzkpMynTqvrLvi2EGf1duDeJ/pNf98ib6JDEQ7Q==
x-ms-exchange-antispam-messagedata: aWLW62r7mluddiUDvSq77Z5riT76DKFSljl7oRKvQErJ0x9CF5lrWstNlIyW3J+CBGCf1hsfraUtkCMSJC8ZLp/OwNLAhM7l4UHbpzPxdVnyQ6oMx10YUpOuoPMQvFZ9MKFj1naZ2zfnqBHwQeQCfw==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc4c05c-672a-4893-dffc-08d7dba31a51
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2020 09:56:25.7983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K+iPUdv2haH22X5Q51em7Zlc5h9164mE7easKtQhpaNUSSDNrSsMSlpmt4uuTCHY695ZBzwNdYk1xGEcGRm3dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3845
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

Hi Daniel,

From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, Apr 07, 2020 at 09:13:33

> On Mon, Apr 06, 2020 at 03:24:12PM +0200, Angelo Ribeiro wrote:
> > Add support for Synopsys DesignWare VPG (Video Pattern Generator) and
> > DRM driver for Synopsys DesignWare DSI Host IPK solution.
> > 
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> > Cc: Joao Pinto <jpinto@synopsys.com>
> > Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> > ---
> >  drivers/gpu/drm/Kconfig      |   2 +
> >  drivers/gpu/drm/Makefile     |   1 +
> >  drivers/gpu/drm/ipk/Kconfig  |  13 +
> >  drivers/gpu/drm/ipk/Makefile |   6 +
> >  drivers/gpu/drm/ipk/dw-drv.c | 189 +++++++++++++++
> >  drivers/gpu/drm/ipk/dw-ipk.h |  30 +++
> >  drivers/gpu/drm/ipk/dw-vpg.c | 559 +++++++++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/ipk/dw-vpg.h |  55 +++++
> >  8 files changed, 855 insertions(+)
> >  create mode 100644 drivers/gpu/drm/ipk/Kconfig
> >  create mode 100644 drivers/gpu/drm/ipk/Makefile
> >  create mode 100644 drivers/gpu/drm/ipk/dw-drv.c
> >  create mode 100644 drivers/gpu/drm/ipk/dw-ipk.h
> >  create mode 100644 drivers/gpu/drm/ipk/dw-vpg.c
> >  create mode 100644 drivers/gpu/drm/ipk/dw-vpg.h
> > 
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 4359497..29ea1d1 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -388,6 +388,8 @@ source "drivers/gpu/drm/mcde/Kconfig"
> >  
> >  source "drivers/gpu/drm/tidss/Kconfig"
> >  
> > +source "drivers/gpu/drm/ipk/Kconfig"
> > +
> >  # Keep legacy drivers last
> >  
> >  menuconfig DRM_LEGACY
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 183c600..5bcc1c1 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -125,3 +125,4 @@ obj-$(CONFIG_DRM_PANFROST) += panfrost/
> >  obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
> >  obj-$(CONFIG_DRM_MCDE) += mcde/
> >  obj-$(CONFIG_DRM_TIDSS) += tidss/
> > +obj-$(CONFIG_DRM_IPK) += ipk/
> > diff --git a/drivers/gpu/drm/ipk/Kconfig b/drivers/gpu/drm/ipk/Kconfig
> > new file mode 100644
> > index 0000000..1f87444
> > --- /dev/null
> > +++ b/drivers/gpu/drm/ipk/Kconfig
> > @@ -0,0 +1,13 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +config DRM_IPK
> > +	tristate "DRM Support for Synopsys DesignWare IPK DSI"
> > +	depends on DRM
> > +	select DRM_KMS_HELPER
> > +	select DRM_GEM_CMA_HELPER
> > +	select DRM_KMS_CMA_HELPER
> > +	select DRM_PANEL_BRIDGE
> > +	select VIDEOMODE_HELPERS
> > +	help
> > +	  Enable support for the Synopsys DesignWare DRM DSI.
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called ipk-drm.
> > diff --git a/drivers/gpu/drm/ipk/Makefile b/drivers/gpu/drm/ipk/Makefile
> > new file mode 100644
> > index 0000000..51d2774
> > --- /dev/null
> > +++ b/drivers/gpu/drm/ipk/Makefile
> > @@ -0,0 +1,6 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +ipk-drm-y := \
> > +	dw-drv.o \
> > +	dw-vpg.o
> > +
> > +obj-$(CONFIG_DRM_IPK) += ipk-drm.o
> > diff --git a/drivers/gpu/drm/ipk/dw-drv.c b/drivers/gpu/drm/ipk/dw-drv.c
> > new file mode 100644
> > index 0000000..6205f1c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/ipk/dw-drv.c
> > @@ -0,0 +1,189 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2019-2020 Synopsys, Inc. and/or its affiliates.
> > + * Synopsys DesignWare MIPI DSI DRM driver
> > + *
> > + * Author: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> > + */
> > +
> > +#include <linux/component.h>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/clk.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_fb_cma_helper.h>
> > +#include <drm/drm_fb_helper.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_gem_framebuffer_helper.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +#include "dw-ipk.h"
> > +#include "dw-vpg.h"
> > +
> > +static const struct drm_mode_config_funcs dw_ipk_drm_modecfg_funcs = {
> > +	.fb_create = drm_gem_fb_create_with_dirty,
> > +	.atomic_check = drm_atomic_helper_check,
> > +	.atomic_commit = drm_atomic_helper_commit,
> > +};
> > +
> > +static int dw_ipk_load(struct drm_device *drm)
> > +{
> > +	int ret;
> > +
> > +	drm_mode_config_init(drm);
> > +
> > +	drm->mode_config.min_width = 0;
> > +	drm->mode_config.min_height = 0;
> > +
> > +	/* To handle orientation */
> > +	drm->mode_config.max_width = 2048;
> > +	drm->mode_config.max_height = 2048;
> > +
> > +	drm->mode_config.funcs = &dw_ipk_drm_modecfg_funcs;
> > +
> > +	/* TODO
> > +	 * Optional framebuffer memory resources allocation
> > +	 */
> > +
> > +	ret = vpg_load(drm);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Calls all the crtc's, encoder's and connector's reset */
> > +	drm_mode_config_reset(drm);
> > +
> > +	/* Initialize and enable output polling */
> > +	drm_kms_helper_poll_init(drm);
> > +
> > +	return ret;
> > +}
> > +
> > +static void dw_ipk_unload(struct drm_device *drm)
> > +{
> > +	DRM_DEBUG_DRIVER("\n");
> > +
> > +	drm_kms_helper_poll_fini(drm);
> > +	vpg_unload(drm);
> > +}
> > +
> > +DEFINE_DRM_GEM_CMA_FOPS(ipk_drm_driver_fops);
> > +
> > +static int ipk_gem_cma_dumb_create(struct drm_file *file,
> > +				   struct drm_device *dev,
> > +				   struct drm_mode_create_dumb *args)
> > +{
> > +	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
> > +	int err;
> > +
> > +	/*
> > +	 * In order to optimize data transfer, pitch is aligned on
> > +	 * 128 bytes, height is aligned on 4 bytes
> > +	 */
> > +	args->pitch = roundup(min_pitch, 128);
> > +	args->height = roundup(args->height, 4);
> > +
> > +	err = drm_gem_cma_dumb_create_internal(file, dev, args);
> > +	if (err < 0)
> > +		drm_err(dev, "dumb_create failed %d\n", err);
> > +
> > +	return err;
> > +}
> > +
> > +static struct drm_driver dw_ipk_drm_driver = {
> > +	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
> > +	.name = "dw_ipk",
> > +	.desc = "DW IPK DSI Host Controller",
> > +	.date = "20190725",
> > +	.major = 1,
> > +	.minor = 0,
> > +	.patchlevel = 0,
> > +	.fops = &ipk_drm_driver_fops,
> > +	.dumb_create = ipk_gem_cma_dumb_create,
> > +	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> > +	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> > +	.gem_free_object_unlocked = drm_gem_cma_free_object,
> > +	.gem_vm_ops = &drm_gem_cma_vm_ops,
> > +	.gem_prime_export = drm_gem_prime_export,
> > +	.gem_prime_import = drm_gem_prime_import,
> > +	.gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
> > +	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> > +	.gem_prime_vmap = drm_gem_cma_prime_vmap,
> > +	.gem_prime_vunmap = drm_gem_cma_prime_vunmap,
> > +	.gem_prime_mmap = drm_gem_cma_prime_mmap,
> > +};
> > +
> > +static int dw_ipk_drm_platform_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct drm_device *drm;
> > +	struct ipk_device *ipk;
> > +	int ret;
> > +
> > +	DRM_DEBUG_DRIVER("\n");
> > +
> > +	ipk = kzalloc(sizeof(*ipk), GFP_KERNEL);
> > +	if (!ipk)
> > +		return -ENOMEM;
> > +
> > +	ipk->platform = pdev;
> > +	drm = &ipk->drm;
> > +
> > +	ret = drm_dev_init(&ipk->drm, &dw_ipk_drm_driver, dev);
> > +	if (ret) {
> > +		kfree(ipk);
> > +		return ret;
> > +	}
> 
> I'm reworking this right now, you're missing a call to
> drmm_add_final_kfree here. But I think even better would be to rebase on
> top of my patch here:
> 
> https://urldefense.proofpoint.com/v2/url?u=https-3A__patchwork.freedesktop.org_patch_359897_&d=DwIBAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=-1lJkMi2j8IE8jpsNWO99o9zJFwyv1Mbjj3vJBR__i0&m=knxu5BXoiypjzq6gobgbIqbrpnkIlWKYlpnGtKMLvnw&s=sUMf2MJZh_cU3VOmu_TXUwCftlGMtMzkJgkPTExhq8I&e= 
> 
> Which would allow you to drop a bunch of code from your load/unload code.
> See that patch series for a lot of example conversions. I plan to land
> that patch pretty soon in drm-misc-next so shouldn't hold up merging your
> driver.
> -Daniel

Thank you for the revision, I will do it.

> 
> > +
> > +	platform_set_drvdata(pdev, drm);
> > +
> > +	ret = dw_ipk_load(drm);
> > +	if (ret)
> > +		goto err_put;
> > +
> > +	ret = drm_dev_register(drm, 0);
> > +	if (ret)
> > +		goto err_put;
> > +
> > +	drm_fbdev_generic_setup(drm, 24);
> > +
> > +	return ret;
> > +
> > +err_put:
> > +	drm_dev_put(drm);
> > +	return ret;
> > +}
> > +
> > +static int dw_ipk_drm_platform_remove(struct platform_device *pdev)
> > +{
> > +	struct drm_device *drm = platform_get_drvdata(pdev);
> > +
> > +	drm_dev_unregister(drm);
> > +	dw_ipk_unload(drm);
> > +	drm_dev_put(drm);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id dw_ipk_dt_ids[] = {
> > +	{.compatible = "snps,dw-ipk-vpg"},
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, dw_ipk_dt_ids);
> > +
> > +static struct platform_driver dw_ipk_drm_platform_driver = {
> > +	.probe = dw_ipk_drm_platform_probe,
> > +	.remove = dw_ipk_drm_platform_remove,
> > +	.driver = {
> > +		.name = "dw-ipk-drm",
> > +		.of_match_table = dw_ipk_dt_ids,
> > +	},
> > +};
> > +
> > +module_platform_driver(dw_ipk_drm_platform_driver);
> > +
> > +MODULE_DESCRIPTION("Synopsys DesignWare IPK DRM driver");
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_AUTHOR("Angelo Ribeiro <angelo.ribeiro@synopsys.com>");
> > diff --git a/drivers/gpu/drm/ipk/dw-ipk.h b/drivers/gpu/drm/ipk/dw-ipk.h
> > new file mode 100644
> > index 0000000..4abb6dd
> > --- /dev/null
> > +++ b/drivers/gpu/drm/ipk/dw-ipk.h
> > @@ -0,0 +1,30 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2019-2020 Synopsys, Inc. and/or its affiliates.
> > + * Synopsys DesignWare MIPI DSI Controller
> > + */
> > +
> > +#ifndef _DW_IPK_H
> > +#define _DW_IPK_H
> > +
> > +#include "drm/drm_device.h"
> > +#include <drm/bridge/dw_mipi_dsi.h>
> > +
> > +struct ipk_pipeline {
> > +	struct drm_framebuffer	*fb;
> > +	struct drm_crtc		crtc;
> > +	struct drm_plane	*plane;
> > +	struct drm_bridge	*bridge;
> > +};
> > +
> > +struct ipk_device {
> > +	struct drm_device drm;
> > +	struct platform_device *platform;
> > +	struct ipk_pipeline pipeline;
> > +	struct vpg_device *vpg;
> > +};
> > +
> > +#define drm_device_to_ipk_device(target) \
> > +	container_of(target, struct ipk_device, drm)
> > +
> > +#endif /* _DW_IPK_H */
> > diff --git a/drivers/gpu/drm/ipk/dw-vpg.c b/drivers/gpu/drm/ipk/dw-vpg.c
> > new file mode 100644
> > index 0000000..feb3e90
> > --- /dev/null
> > +++ b/drivers/gpu/drm/ipk/dw-vpg.c
> > @@ -0,0 +1,559 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2019-2020 Synopsys, Inc. and/or its affiliates.
> > + * Synopsys DesignWare MIPI DSI controller
> > + *
> > + * Author: Angelo Ribeiro <angelor@synopsys.com>
> > + * Author: Luis Oliveira <luis.oliveira@synopsys.com>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/component.h>
> > +#include <linux/delay.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/module.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/reset.h>
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_device.h>
> > +#include <drm/drm_fb_cma_helper.h>
> > +#include <drm/drm_fourcc.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_vblank.h>
> > +#include <linux/platform_data/simplefb.h>
> > +#include <video/videomode.h>
> > +
> > +#include "dw-ipk.h"
> > +#include "dw-vpg.h"
> > +
> > +#define NB_CRTC 1
> > +#define CRTC_MASK GENMASK(NB_CRTC - 1, 0)
> > +#define MAX_ENDPOINTS 1
> > +
> > +struct vpg_device {
> > +	void __iomem *base;
> > +	void __iomem *base_mmcm;
> > +};
> > +
> > +enum vpg_pixel_fmt {
> > +	VIF_COLOR_CODE_16BIT_CONFIG1 = 0,
> > +	VIF_COLOR_CODE_16BIT_CONFIG2,
> > +	VIF_COLOR_CODE_16BIT_CONFIG3,
> > +	VIF_COLOR_CODE_18BIT_CONFIG1,
> > +	VIF_COLOR_CODE_18BIT_CONFIG2,
> > +	VIF_COLOR_CODE_24BIT,
> > +	VIF_COLOR_CODE_MAX
> > +};
> > +
> > +static enum vpg_pixel_fmt to_vpg_pixel_format(u32 drm_fmt)
> > +{
> > +	enum vpg_pixel_fmt pf;
> > +
> > +	switch (drm_fmt) {
> > +	case DRM_FORMAT_RGB888:
> > +		pf = VIF_COLOR_CODE_24BIT;
> > +		break;
> > +	case DRM_FORMAT_RGB565:
> > +		pf = VIF_COLOR_CODE_16BIT_CONFIG1;
> > +		break;
> > +	default:
> > +		pf = VIF_COLOR_CODE_MAX;
> > +		break;
> > +	}
> > +	return pf;
> > +}
> > +
> > +static struct simplefb_format supported_formats[] = {
> > +	{"r5g6b5", 16, {11, 5}, {5, 6}, {0, 5}, {0, 0}, DRM_FORMAT_RGB565},
> > +	{"r8g8b8", 24, {16, 8}, {8, 8}, {0, 8}, {0, 0}, DRM_FORMAT_RGB888},
> > +	{"x8r8g8b8", 32, {16, 8}, {8, 8}, {0, 8}, {0, 0}, DRM_FORMAT_XRGB8888},
> > +};
> > +
> > +static const u64 vpg_format_modifiers[] = {
> > +	DRM_FORMAT_MOD_LINEAR,
> > +	DRM_FORMAT_MOD_INVALID
> > +};
> > +
> > +static const struct drm_encoder_funcs ipk_encoder_funcs = {
> > +	.destroy = drm_encoder_cleanup,
> > +};
> > +
> > +static int ipk_encoder_init(struct drm_device *drm,
> > +			    struct drm_bridge *bridge)
> > +{
> > +	struct ipk_device *ipk = drm_device_to_ipk_device(drm);
> > +	struct drm_encoder *encoder;
> > +	int ret;
> > +
> > +	encoder = devm_kzalloc(drm->dev, sizeof(*encoder), GFP_KERNEL);
> > +	if (!encoder)
> > +		return -ENOMEM;
> > +
> > +	/* Only one CRTC can be attached in IPK_DSI */
> > +	encoder->possible_crtcs = CRTC_MASK;
> > +	encoder->possible_clones = 0;
> > +
> > +	ret = drm_encoder_init(drm, encoder, &ipk_encoder_funcs,
> > +			       DRM_MODE_ENCODER_DPI, NULL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
> > +	if (ret)
> > +		goto err_attach;
> > +
> > +	/* Add to the internal struct */
> > +	ipk->pipeline.bridge = bridge;
> > +
> > +	DRM_DEBUG_DRIVER("Num of connectors = %d\n",
> > +			 drm->mode_config.num_connector);
> > +	DRM_DEBUG_DRIVER("Bridge encoder:%d created\n", encoder->base.id);
> > +
> > +	return ret;
> > +
> > +err_attach:
> > +	drm_encoder_cleanup(encoder);
> > +	return ret;
> > +}
> > +
> > +/*
> > + * CRTC
> > + */
> > +static u32 vpg_read(struct vpg_device *dev, u32 reg)
> > +{
> > +	return readl(dev->base + reg);
> > +}
> > +
> > +static void vpg_write(struct vpg_device *dev, u32 reg, u32 val)
> > +{
> > +	writel(val, dev->base + reg);
> > +}
> > +
> > +static void vpg_write_part(struct vpg_device *dev, u32 reg,
> > +			   u32 val, u8 shift, u8 width)
> > +{
> > +	u32 mask = (1 << width) - 1;
> > +
> > +	vpg_write(dev, reg, (vpg_read(dev, reg) &
> > +		  ~(mask << shift)) | ((val & mask) << shift));
> > +}
> > +
> > +static u32 mmcm_read(struct vpg_device *dev, u32 reg)
> > +{
> > +	return readl(dev->base_mmcm + reg);
> > +}
> > +
> > +static void mmcm_write(struct vpg_device *dev, u32 reg, u32 value)
> > +{
> > +	writel(value, dev->base_mmcm + reg);
> > +}
> > +
> > +static void mmcm_configure(struct vpg_device *vpg, struct videomode *v_mode)
> > +{
> > +	int div,  mul, cur_freq, cur_deviat, temp;
> > +	int out_freq = v_mode->pixelclock / 1000;
> > +	int in_freq = 100000;
> > +	int deviat = 1000;	/* Deviation from desired master clock */
> > +	int best_div = 0;	/* Divider for PLL */
> > +	int best_mul = 0;	/* Multiplier for PLL */
> > +
> > +	DRM_DEBUG_DRIVER("out_freq = %d\n", out_freq);
> > +
> > +	for (div = 1; div < 150 && deviat > 50; div++) {
> > +		for (mul = 1; mul <= 10 && deviat > 50; mul++) {
> > +			cur_freq = in_freq * mul / div;
> > +			cur_deviat = abs(out_freq - cur_freq);
> > +			if (cur_deviat < deviat) {
> > +				best_div = div;
> > +				best_mul = mul;
> > +				deviat = cur_deviat;
> > +			}
> > +		}
> > +	}
> > +
> > +	DRM_DEBUG_DRIVER("deviat = %d\n best_div = %d\n best_mul = %d\n",
> > +			 deviat, best_div, best_mul);
> > +
> > +	temp = mmcm_read(vpg, DW_MMCM_CLKOUT0_REG_1) & DW_MMCM_MASK;
> > +	mmcm_write(vpg, DW_MMCM_CLKOUT0_REG_1, temp | (best_div << 6) |
> > +		   best_div);
> > +
> > +	temp = mmcm_read(vpg, DW_MMCM_CLKFBOUT_REG_1) & DW_MMCM_MASK;
> > +	mmcm_write(vpg, DW_MMCM_CLKFBOUT_REG_1, temp | (best_mul << 6) |
> > +		   best_mul);
> > +}
> > +
> > +static void vpg_set_fps(struct vpg_device *vpg,
> > +			const struct drm_display_mode *mode)
> > +{
> > +	/* IF_Freq is in KHz */
> > +	u32 line_time = (1000 * DW_VPG_FREQ) / (mode->vrefresh * mode->vtotal);
> > +
> > +	vpg_write(vpg, DW_VPG_LINE_TIME, line_time);
> > +}
> > +
> > +static void vpg_select_pattern(struct vpg_device *vpg, unsigned int value)
> > +{
> > +	vpg_write(vpg, DW_VPG_TESTMODE, value);
> > +}
> > +
> > +static void vpg_vertical_set(struct vpg_device *vpg, struct videomode *v_mode)
> > +{
> > +	vpg_write_part(vpg, DW_VPG_CANVAS, v_mode->vactive, 16, 16);
> > +	vpg_write_part(vpg, DW_VPG_VBP_VFP_VSA, v_mode->vsync_len, 0, 8);
> > +	vpg_write_part(vpg, DW_VPG_VBP_VFP_VSA, v_mode->vback_porch, 20, 12);
> > +	vpg_write_part(vpg, DW_VPG_VBP_VFP_VSA, v_mode->vfront_porch, 8, 11);
> > +}
> > +
> > +static void vpg_horizontal_set(struct vpg_device *vpg, struct videomode *v_mode)
> > +{
> > +	vpg_write_part(vpg, DW_VPG_CANVAS, v_mode->hactive, 0, 16);
> > +	vpg_write_part(vpg, DW_VPG_HBP_HSA, v_mode->hsync_len, 0, 16);
> > +	vpg_write_part(vpg, DW_VPG_HBP_HSA, v_mode->hback_porch, 16, 16);
> > +}
> > +
> > +static ssize_t show_pattern(struct device *dev,
> > +			    struct device_attribute *attr, char *buf)
> > +{
> > +	struct drm_device *drm = dev_get_drvdata(dev);
> > +	struct ipk_device *ipk = drm_device_to_ipk_device(drm);
> > +	struct vpg_device *vpg = ipk->vpg;
> > +
> > +	return sprintf(buf, "%d\n", vpg_read(vpg, DW_VPG_TESTMODE));
> > +}
> > +
> > +static ssize_t store_pattern(struct device *dev, struct device_attribute *attr,
> > +			     const char *buf, size_t count)
> > +{
> > +	struct drm_device *drm = dev_get_drvdata(dev);
> > +	struct ipk_device *ipk = drm_device_to_ipk_device(drm);
> > +	struct vpg_device *vpg = ipk->vpg;
> > +	long pattern;
> > +	int ret;
> > +
> > +	ret = kstrtol(buf, 0, &pattern);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	vpg_select_pattern(vpg, pattern);
> > +
> > +	return count;
> > +}
> > +
> > +static struct kobj_attribute vpg_pattern = __ATTR(pattern, 0660,
> > +						  (void *)show_pattern,
> > +						  (void *)store_pattern);
> > +
> > +static struct attribute *vpg_attr[] = {
> > +	&vpg_pattern.attr,
> > +	NULL,
> > +};
> > +
> > +static const struct attribute_group vpg_attr_group = {
> > +	.attrs = vpg_attr,
> > +};
> > +
> > +static void vpg_crtc_mode_set_nofb(struct drm_crtc *crtc)
> > +{
> > +	struct ipk_device *ipk = drm_device_to_ipk_device(crtc->dev);
> > +	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
> > +	struct vpg_device *vpg = ipk->vpg;
> > +	struct videomode v_mode;
> > +
> > +	DRM_DEBUG_DRIVER("\n");
> > +
> > +	drm_display_mode_to_videomode(mode, &v_mode);
> > +
> > +	DRM_DEBUG_DRIVER("CRTC:%d mode:%s\n", crtc->base.id, mode->name);
> > +	DRM_DEBUG_DRIVER("Video mode: %dx%d", v_mode.hactive, v_mode.vactive);
> > +	DRM_DEBUG_DRIVER(" hfp %d hbp %d hsl %d vfp %d vbp %d vsl %d\n",
> > +			 v_mode.hfront_porch, v_mode.hback_porch,
> > +			 v_mode.hsync_len, v_mode.vfront_porch,
> > +			 v_mode.vback_porch, v_mode.vsync_len);
> > +
> > +	mmcm_configure(vpg, &v_mode);
> > +
> > +	vpg_write(vpg, DW_VPG_SEL_DATA, 0x01);
> > +	vpg_write(vpg, DW_VPG_SEL_DATA, 0x03);
> > +
> > +	vpg_horizontal_set(vpg, &v_mode);
> > +
> > +	vpg_vertical_set(vpg, &v_mode);
> > +
> > +	vpg_set_fps(vpg, mode);
> > +
> > +	vpg_select_pattern(vpg, 0);
> > +}
> > +
> > +static void vpg_crtc_atomic_begin(struct drm_crtc *crtc,
> > +				  struct drm_crtc_state *state)
> > +{
> > +	struct drm_pending_vblank_event *event = crtc->state->event;
> > +
> > +	if (event) {
> > +		crtc->state->event = NULL;
> > +		spin_lock_irq(&crtc->dev->event_lock);
> > +		drm_crtc_send_vblank_event(crtc, event);
> > +		spin_unlock_irq(&crtc->dev->event_lock);
> > +	}
> > +}
> > +
> > +static struct drm_crtc_helper_funcs vpg_crtc_helper_funcs = {
> > +	.mode_set_nofb = vpg_crtc_mode_set_nofb,
> > +	.atomic_begin = vpg_crtc_atomic_begin,
> > +};
> > +
> > +static int vpg_crtc_late_register(struct drm_crtc *crtc)
> > +{
> > +	struct ipk_device *ipk = drm_device_to_ipk_device(crtc->dev);
> > +	struct platform_device *pdev = ipk->platform;
> > +	int ret;
> > +
> > +	ret = sysfs_create_group(&pdev->dev.kobj, &vpg_attr_group);
> > +	if (ret)
> > +		drm_err(crtc->dev, "Failed to create sysfs entries");
> > +
> > +	return ret;
> > +}
> > +
> > +static void vpg_crtc_early_unregister(struct drm_crtc *crtc)
> > +{
> > +	struct ipk_device *ipk = drm_device_to_ipk_device(crtc->dev);
> > +	struct platform_device *pdev = ipk->platform;
> > +
> > +	sysfs_remove_group(&pdev->dev.kobj, &vpg_attr_group);
> > +}
> > +
> > +static const struct drm_crtc_funcs vpg_crtc_funcs = {
> > +	.reset = drm_atomic_helper_crtc_reset,
> > +	.destroy = drm_crtc_cleanup,
> > +	.set_config = drm_atomic_helper_set_config,
> > +	.page_flip = drm_atomic_helper_page_flip,
> > +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> > +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> > +	.late_register =  vpg_crtc_late_register,
> > +	.early_unregister = vpg_crtc_early_unregister
> > +};
> > +
> > +/*
> > + * Plane
> > + */
> > +static void vpg_plane_atomic_update(struct drm_plane *plane,
> > +				    struct drm_plane_state *old_state)
> > +{
> > +	struct ipk_device *ipk = drm_device_to_ipk_device(plane->dev);
> > +	struct drm_plane_state *state = plane->state;
> > +	struct drm_framebuffer *fb = state->fb;
> > +	struct vpg_device *vpg = ipk->vpg;
> > +	enum vpg_pixel_fmt pixel_format;
> > +
> > +	pixel_format = to_vpg_pixel_format(fb->format->format);
> > +
> > +	vpg_write(vpg, DW_VPG_DPICOLORMODE, pixel_format);
> > +}
> > +
> > +static void vpg_plane_atomic_disable(struct drm_plane *plane,
> > +				     struct drm_plane_state *oldstate)
> > +{
> > +	DRM_DEBUG_DRIVER("\n");
> > +}
> > +
> > +static const struct drm_plane_helper_funcs vpg_plane_helper_funcs = {
> > +	.atomic_update = vpg_plane_atomic_update,
> > +	.atomic_disable = vpg_plane_atomic_disable,
> > +};
> > +
> > +static const struct drm_plane_funcs vpg_plane_funcs = {
> > +	.update_plane = drm_atomic_helper_update_plane,
> > +	.disable_plane = drm_atomic_helper_disable_plane,
> > +	.destroy = drm_plane_cleanup,
> > +	.reset = drm_atomic_helper_plane_reset,
> > +	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
> > +	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> > +};
> > +
> > +static void vpg_plane_destroy_all(struct drm_device *drm)
> > +{
> > +	struct drm_plane *plane, *plane_temp;
> > +
> > +	list_for_each_entry_safe(plane, plane_temp,
> > +				 &drm->mode_config.plane_list, head)
> > +		drm_plane_cleanup(plane);
> > +}
> > +
> > +static int vpg_crtc_init(struct drm_device *drm, struct drm_crtc *crtc)
> > +{
> > +	u32 formats[ARRAY_SIZE(supported_formats)], i;
> > +	const u64 *modifiers = vpg_format_modifiers;
> > +	unsigned long possible_crtcs = CRTC_MASK;
> > +	struct device *drm_dev = drm->dev;
> > +	struct drm_plane *plane;
> > +	int ret;
> > +
> > +	plane = devm_kzalloc(drm_dev, sizeof(*plane), GFP_KERNEL);
> > +	if (!plane)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(supported_formats); i++)
> > +		formats[i] = supported_formats[i].fourcc;
> > +
> > +	ret = drm_universal_plane_init(drm, plane, possible_crtcs,
> > +				       &vpg_plane_funcs, formats,
> > +				       ARRAY_SIZE(formats), modifiers,
> > +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> > +	if (ret)
> > +		goto cleanup_planes;
> > +
> > +	drm_plane_helper_add(plane, &vpg_plane_helper_funcs);
> > +
> > +	DRM_DEBUG_DRIVER("plane:%d created\n", plane->base.id);
> > +
> > +	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL,
> > +					&vpg_crtc_funcs, "DSI-VPG");
> > +	if (ret) {
> > +		DRM_DEBUG_DRIVER("Failed initialize CRTC\n");
> > +		goto cleanup_crtc;
> > +	}
> > +
> > +	drm_crtc_helper_add(crtc, &vpg_crtc_helper_funcs);
> > +
> > +	DRM_DEBUG_DRIVER("CRTC:%d created\n", crtc->base.id);
> > +
> > +	return ret;
> > +
> > +cleanup_crtc:
> > +	drm_crtc_cleanup(crtc);
> > +cleanup_planes:
> > +	vpg_plane_destroy_all(drm);
> > +	return ret;
> > +}
> > +
> > +int vpg_load(struct drm_device *drm)
> > +{
> > +	struct ipk_device *ipk = drm_device_to_ipk_device(drm);
> > +	struct drm_bridge *bridge[MAX_ENDPOINTS] = {NULL};
> > +	struct drm_panel *panel[MAX_ENDPOINTS] = {NULL};
> > +	struct platform_device *pdev = ipk->platform;
> > +	struct device_node *np = drm->dev->of_node;
> > +	int ret, i, endpoint_not_ready = -ENODEV;
> > +	struct reset_control *vpg_rst, *mmcm_rst;
> > +	struct device *dev = drm->dev;
> > +	struct vpg_device *vpg;
> > +	struct drm_crtc *crtc;
> > +	struct resource *res;
> > +
> > +	DRM_DEBUG_DRIVER("\n");
> > +
> > +	vpg = devm_kzalloc(&pdev->dev, sizeof(*vpg), GFP_KERNEL);
> > +	if (!vpg)
> > +		return -ENOMEM;
> > +
> > +	ipk->vpg = vpg;
> > +
> > +	/* Get endpoints if any */
> > +	for (i = 0; i < MAX_ENDPOINTS; i++) {
> > +		ret = drm_of_find_panel_or_bridge(np, 0, i, &panel[i],
> > +						  &bridge[i]);
> > +		if (ret == -EPROBE_DEFER)
> > +			return ret;
> > +		else if (!ret)
> > +			endpoint_not_ready = 0;
> > +	}
> > +
> > +	if (endpoint_not_ready)
> > +		return endpoint_not_ready;
> > +
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "vpg");
> > +	vpg->base = devm_ioremap_resource(dev, res);
> > +	if (IS_ERR(vpg->base)) {
> > +		drm_err(drm, "Unable to get VPG registers\n");
> > +		ret = PTR_ERR(vpg->base);
> > +		goto err;
> > +	}
> > +
> > +	vpg_rst = devm_reset_control_get_optional_exclusive(dev, "vpg");
> > +	if (IS_ERR(vpg_rst)) {
> > +		ret = PTR_ERR(vpg_rst);
> > +		if (ret != -EPROBE_DEFER)
> > +			drm_err(drm, "Unable to get reset control: %d\n", ret);
> > +		goto err;
> > +	}
> > +
> > +	if (vpg_rst) {
> > +		reset_control_assert(vpg_rst);
> > +		usleep_range(10, 20);
> > +		reset_control_deassert(vpg_rst);
> > +	}
> > +
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mmcm");
> > +	vpg->base_mmcm = devm_ioremap_resource(dev, res);
> > +	if (IS_ERR(vpg->base)) {
> > +		ret = PTR_ERR(vpg->base);
> > +		goto err;
> > +	}
> > +
> > +	mmcm_rst = devm_reset_control_get_optional_exclusive(dev, "mmcm");
> > +	if (IS_ERR(mmcm_rst)) {
> > +		ret = PTR_ERR(mmcm_rst);
> > +		if (ret != -EPROBE_DEFER)
> > +			drm_err(drm, "Unable to get reset control: %d\n", ret);
> > +		goto err;
> > +	}
> > +
> > +	if (mmcm_rst) {
> > +		reset_control_assert(mmcm_rst);
> > +		usleep_range(10, 20);
> > +		reset_control_deassert(mmcm_rst);
> > +	}
> > +
> > +	/* Add endpoints panels or bridges if any */
> > +	for (i = 0; i < MAX_ENDPOINTS; i++) {
> > +		if (panel[i]) {
> > +			bridge[i] = drm_panel_bridge_add_typed(panel[i],
> > +							DRM_MODE_CONNECTOR_DSI);
> > +			if (IS_ERR(bridge[i])) {
> > +				ret = PTR_ERR(bridge[i]);
> > +				goto err;
> > +			}
> > +		}
> > +
> > +		if (bridge[i]) {
> > +			ret = ipk_encoder_init(drm, bridge[i]);
> > +			if (ret)
> > +				goto err;
> > +		}
> > +	}
> > +
> > +	crtc = devm_kzalloc(dev, sizeof(*crtc), GFP_KERNEL);
> > +	if (!crtc) {
> > +		ret = -ENOMEM;
> > +		goto err;
> > +	}
> > +
> > +	ret = vpg_crtc_init(drm, crtc);
> > +	if (ret)
> > +		goto err;
> > +
> > +	return ret;
> > +
> > +err:
> > +	for (i = 0; i < MAX_ENDPOINTS; i++)
> > +		drm_panel_bridge_remove(bridge[i]);
> > +
> > +	return ret;
> > +}
> > +
> > +void vpg_unload(struct drm_device *drm)
> > +{
> > +	int i;
> > +
> > +	DRM_DEBUG_DRIVER("\n");
> > +	for (i = 0; i < MAX_ENDPOINTS; i++)
> > +		drm_of_panel_bridge_remove(drm->dev->of_node, 0, i);
> > +}
> > diff --git a/drivers/gpu/drm/ipk/dw-vpg.h b/drivers/gpu/drm/ipk/dw-vpg.h
> > new file mode 100644
> > index 0000000..869ccc4
> > --- /dev/null
> > +++ b/drivers/gpu/drm/ipk/dw-vpg.h
> > @@ -0,0 +1,55 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2019-2020 Synopsys, Inc. and/or its affiliates.
> > + * Synopsys DesignWare VPG
> > + */
> > +
> > +#ifndef _VPG_H_
> > +#define _VPG_H_
> > +
> > +#define DW_VPG_PANX				0x00
> > +#define DW_VPG_PANY				0x04
> > +#define DW_VPG_PHASE_SEL			0x08
> > +#define DW_VPG_SEL_DATA				0x0C
> > +#define DW_VPG_SWAP_BAY				0x10
> > +#define DW_VPG_TESTMODE				0x14
> > +#define DW_VPG_ZOOM_OUT				0x18
> > +#define DW_VPG_EDPICTRL				0x1C
> > +#define DW_VPG_CANVAS				0x20
> > +#define DW_VPG_HBP_HSA				0x24
> > +#define DW_VPG_LINE_TIME			0x28
> > +#define DW_VPG_VBP_VFP_VSA			0x2C
> > +#define DW_VPG_DPICOLORMODE			0x30
> > +#define DW_VPG_VERSION				0x34
> > +#define DW_VPG_EXTRNAL_EDPI			0x38
> > +#define DW_VPG_PVO_CEAVID			0x3C
> > +#define DW_VPG_PAN_VALID			0x40
> > +#define DW_VPG_TECONTROL			0x44
> > +#define DW_VPG_IMAGE_START_POSITION_X		0x4C
> > +#define DW_VPG_IMAGE_START_POSITION_Y		0x50
> > +#define DW_VPG_IMAGE_Y				0x54
> > +#define DW_VPG_IMAGE_WORD_COUNT			0x58
> > +#define DW_VPG_IMAGE_DATA_TYPE			0x5C
> > +#define DW_VPG_LINE_PIXS_CNT			0x60
> > +#define DW_VPG_FRAME_LINES_CNT			0x64
> > +
> > +#define DW_MMCM_MASK				0x1000
> > +#define DW_MMCM_CLKOUT0_REG_1			0x20
> > +#define DW_MMCM_CLKOUT0_REG_2			0x24
> > +#define DW_MMCM_CLKFBOUT_REG_1			0x50
> > +#define DW_MMCM_CLKFBOUT_REG_2			0x54
> > +#define DW_MMCM_POWER_REG			0xA0
> > +
> > +#define DW_VPG_ZOOM_OUT_STEP	1
> > +#define DW_VPG_PAN_STEP	40
> > +#define DW_VPG_FREQ	25000	/* [KHz] */
> > +#define DW_VPG_V_FRONT_PORCH	2
> > +#define DW_VPG_V_BACK_PORCH	2
> > +#define DW_VPG_V_SYNC	2
> > +#define SCREEN_SIZE_X	800
> > +#define SCREEN_SIZE_Y	480
> > +
> > +int vpg_load(struct drm_device *ddev);
> > +void vpg_unload(struct drm_device *ddev);
> > +
> > +#endif /* _VPG_H_ */
> > -- 
> > 2.7.4
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://urldefense.proofpoint.com/v2/url?u=http-3A__blog.ffwll.ch&d=DwIBAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=-1lJkMi2j8IE8jpsNWO99o9zJFwyv1Mbjj3vJBR__i0&m=knxu5BXoiypjzq6gobgbIqbrpnkIlWKYlpnGtKMLvnw&s=obntSCr3Ev8khEsp1VLKqczn-yc69G5IuHbSBcRS24k&e= 

Thanks,
Angelo Ribeiro


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
