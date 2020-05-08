Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 955021CBF89
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 11:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B5F6E1C4;
	Sat,  9 May 2020 09:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB13989E43;
 Fri,  8 May 2020 13:56:24 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 34B9C404B8;
 Fri,  8 May 2020 13:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1588946184; bh=GXEEnW2RBq5YIf15fhg21ZPJXIdoplhu7AVc7Kice8o=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=CJErA8owqB8qqsNzse4DZa1S2De6nTN2hlnqDzEqkHh48ySyPO3qRLezRdP/iOxOd
 5i07mtRATgaW5QKejiPfgOsgC4oCBWNQUn4BuhWqIET429uESRBmgnnMyLlCh2C4IK
 QUf7J0iZ7Xu6spMOdQUE7eUawRN4oE9zuF68jcCKBSrucSon0ON8Foa34rYbwTKzQF
 OnxYoHYV3nO+gTzTARXWGPnnQ88m84+5JuH4uvS4/UXQrqNPA6yQg4wpukGCleQ+P7
 rj/wXggnbXSJt48o+INUlCW860+DJK3/zI/pMwvKip5lAfdI/XTD8dvK5wTmxntv4B
 jmGiY5p+u9RJQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 0D347A007F;
 Fri,  8 May 2020 13:56:20 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 8 May 2020 06:56:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Fri, 8 May 2020 06:56:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ma+Aj7v3Bb8N6VjTRzBVeYPwC477d2bLFq2qZahhbJDTFlqzwoSq2r0/e5K4D26z9ZXsUD2Wgj3iI6NVR9ENmsU3QQAbLn3YijDJ+TqH9/cgTQYaIT+wPKsQ3TSaPvodP+FbGwMpr923u1xuGglqR7576/azxpipuJ7jxl57kLYXPep/7G09/M6vc2+8/YsepbmsdEF9CNIwZkjyT+tF65bBlvHOPQVITiEvR5K+QTK0Kb6Wi1LZh2FgjF+Fhd81vC7Zj2Ev609jeZb2WG6epYUJAa6j4PikKy6zQLhwBkR25A45qQlRo5ed5z5Jf3nvBrdI26Lk5/mHQS5QaZdRvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXEEnW2RBq5YIf15fhg21ZPJXIdoplhu7AVc7Kice8o=;
 b=hS8JITKykVPjvjZFnXPGyROF+CnbhUo8P+CWElyPUMxYVuckUazVRRhGaA5aDkryUTL4w41HZn3JVFoATG+itXNWh1Co6ynUa4v5l0xrbvJZ44SePop9m8w8+GaqS7714gdZs3PlJyvaAS77DLKFjnGUpGAapsMzppgM2bk8k0bz9EyMZFpbceKHmwMTgPy8ruufpU0S7hUQBpJRR0up808LWnHOwbioGJmZgRqbw+49MPl9QbbWkuvHu/gIB6nVRo7qbSTmINPfcWd/+ZQckpdWB2s+owuXeG3zV6UIFiRjVkvykRbCnJpqZ6Vmq0aIiXqg6dgtr8LOvM4aTI8+1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXEEnW2RBq5YIf15fhg21ZPJXIdoplhu7AVc7Kice8o=;
 b=N8FrSyGJ94oaEUhc5p6k3Atm1WIoIT87aSGpsALlc5mv+L5+6xp6MjdIVFg9F0PjCF4EmVUOQuE4+1vuKrmJ6arjNQQvc5gyNHbPN4v1GzbYSQlvhx73V6+PEOgP3CuuCAdi7xui848SKQkzwUPnWK0ayF3Px+nFP2lJcDAtzf0=
Received: from CH2PR12MB3894.namprd12.prod.outlook.com (2603:10b6:610:2b::28)
 by CH2PR12MB4022.namprd12.prod.outlook.com (2603:10b6:610:22::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Fri, 8 May
 2020 13:56:16 +0000
Received: from CH2PR12MB3894.namprd12.prod.outlook.com
 ([fe80::51c9:234d:d411:ce71]) by CH2PR12MB3894.namprd12.prod.outlook.com
 ([fe80::51c9:234d:d411:ce71%6]) with mapi id 15.20.2958.033; Fri, 8 May 2020
 13:56:16 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH 53/59] drm/arc: Move to drm/tiny
Thread-Topic: [PATCH 53/59] drm/arc: Move to drm/tiny
Thread-Index: AQHWEvlb5mSQq60T60WU0QolrVlsW6h57yoAgAAle+CAAAXvgIAUjIQAgA+y2qA=
Date: Fri, 8 May 2020 13:56:16 +0000
Message-ID: <CH2PR12MB3894B40C6D71435D3E759A34A1A20@CH2PR12MB3894.namprd12.prod.outlook.com>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-54-daniel.vetter@ffwll.ch>
 <20200415094512.GA30444@ravnborg.org>
 <MWHPR12MB14532DA5713E3B579ABFE1F4A1DB0@MWHPR12MB1453.namprd12.prod.outlook.com>
 <CAKMK7uGDGgt8Cm_bFoyzeoP2CWyiUNdUwb7GL6Ohu3k0rP0p1w@mail.gmail.com>
 <20200428140842.GL3456981@phenom.ffwll.local>
In-Reply-To: <20200428140842.GL3456981@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWJyb2RraW5c?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy1hZGE5MmQ5Yy05MTMzLTExZWEtODA0MC04OGIx?=
 =?us-ascii?Q?MTFjZGUyMTdcYW1lLXRlc3RcYWRhOTJkOWUtOTEzMy0xMWVhLTgwNDAtODhi?=
 =?us-ascii?Q?MTExY2RlMjE3Ym9keS50eHQiIHN6PSIxMjc3IiB0PSIxMzIzMzQxOTc3NDEz?=
 =?us-ascii?Q?NjcyMjIiIGg9ImZndXRVMG1uTEtibEVKaytQY3hWMEovT3pIMD0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUJRSkFB?=
 =?us-ascii?Q?QzJyd0p3UUNYV0FWN0pRc05odGIydlhzbEN3MkcxdmE4T0FBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQUNrQ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBRGVCS0lRQUFBQUFBQUFBQUFBQUFBSjRBQUFCbUFHa0Fi?=
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
x-dg-rorf: true
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [46.47.223.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 664ec7e7-944c-4ae2-a91f-08d7f35793cc
x-ms-traffictypediagnostic: CH2PR12MB4022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4022FBDDBD10CC203A118B36A1A20@CH2PR12MB4022.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 039735BC4E
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tWDyPnc/2cclardDl3QIF6r2kV+4JYg0nkVZHwI0LXun0rQ4C8m4O8gEVjWxFwAkB40uy9gy2C9b6nAyMYmnx4viyqEmxysisRKQOMDxh8veioPJz38Og2g6uHJkx6xJZ1dDzpjQ47SLUHnMqvR3tqSURXMGcaQImX7/sc/TqRw49pLUMhl8v6JxjhMQcouLZRRqiwwj86D3orQlq5PvJ4SNUswFD7II1/QGcY2z7PBKfwVxu8XpZOb2GNnwVVu1F2N0CtekTc2cSA6VOFuKHeQYwSLgT2FZPGcILyq36U7PU08+Yyc/y1lkDf4OS/DfilM1ISXuQSiHS7D0RYmEIgj3+XY4+9I89pA6UR9U0NLqpAAhX7r2YPEIe4Itte5fMR+yB1qDysl/qyrFLxhT74JPKbOul3y4SWqH+lsFaHul7onuHFnWi/fS+KPL8VsgEcq1Cth55sYG+H4way2zfy4ZZvvuQTrizKMni59FFHaRiPLBbYQRrz7nvqC1W4yYGnlMmAjhKPUmrKEhBeWZJQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3894.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(366004)(396003)(39860400002)(136003)(33430700001)(33440700001)(9686003)(6916009)(2906002)(26005)(55016002)(7696005)(186003)(54906003)(33656002)(8936002)(8676002)(52536014)(71200400001)(316002)(5660300002)(86362001)(66556008)(83310400001)(478600001)(83320400001)(76116006)(83290400001)(83280400001)(66476007)(64756008)(66946007)(4326008)(6506007)(66446008)(83300400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: BOW0a56GjazoM5sZLHb7z67ajMyfLdqtGHPnx8fexdQA2qlTxrhhnOU+6in8I/tqvqFWG3nmwf8+oek1wgxGqR+d+Eszm8XySkKB0pHHb0WknHJLOZ/IclSw1YTkV6dmwLT1/ustBoV1jwJfopgkCc8T1JoJo/jLNbl+uT8dfUhV9oVx0RPl9OBeiWDT1OsSXc/dviRAq4s+AmrHAYHU3mUt111lRVniAJPUyByica1d+h4qlI53iR9oQT2X6bUK+w1pnxi7+tzwcpVhw9qsh+Sy4JMouF2EyKi8ToeeFPe9UPXe5CSuwsYIPYTgteGkW1VXjH+GytjIRNcTs+W2JKwGEyfXMvlS7M65nH7AFvjA/Ju/6214GkZTiFYYYSuPRqWLwC7daBx5a51KtqmHinIpbAryqZGIdurfcsjWjJjL9BBhoeRaSs6wuhmcY1O1AbzOunbP3djjM3aT84mHX0CdgtQTzDxr7FX/nOoZyPE=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 664ec7e7-944c-4ae2-a91f-08d7f35793cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2020 13:56:16.2173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hgdvfzzXUpzFAx+B2Ex0GEZdwZBGy6nRvNHFxb9lheQ/EYIjoL1BndDoUfx4kc6HPGFoOwNlXlqyAKOMwbi9aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4022
X-OriginatorOrg: synopsys.com
X-Mailman-Approved-At: Sat, 09 May 2020 09:04:57 +0000
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
Cc: Sam  Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 DRI  Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

> > Looking at this patch series, feels a bit like hand-rolling of bridge
> > code, badly. We should get away from that.
> >
> > Once you have that I think the end result is tiny enough that it can
> > stay, bridges intergrate quite well into simple display pipe drivers.
> >
> > > BTW should I pull that series in my tree and send you a pull-request
> > > or that kind of change needs to go through another tree?
> > >
> > > Also I'd like to test the change we discuss here to make sure stuff
> > > still works. Once we do that I'll send an update. Any hint on
> > > when that change needs to be acked/nacked?
> >
> > Simplest is if this can all land through drm-misc, is arc not
> > maintained in there? And there's plenty of time for testing, I'm just
> > slowly crawling through the tree to get everything polished and
> > cleaned up in this area.
> 
> Any updates on testing this pile here? First patch landed now, and I've
> started to push driver patches. So would be good to get this sorted out
> too.

Sorry we're in the middle of 2 long weekends so missed this one.
I guess we'll be able to test it in a week or two from now.

Is that OK?

-Alexey


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
