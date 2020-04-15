Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2020C1AB8E5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 08:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6776EAD4;
	Thu, 16 Apr 2020 06:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A636E1D8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 12:03:04 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 52A3740545;
 Wed, 15 Apr 2020 12:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586952184; bh=a1BG2cRUDyJ7mHc/DBMCJ4LTepf4iXXifiXVLRm5DNk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=JFNfzqn5pbLOnvJKWMCkAF1XXNTVIhgUChRDgxZJyppcnomGl1zfRTfnfRBb/jk/z
 +FlS/rnHq8CfiVN3KEZoirk4qEzVjH2p1q41KdujEKjMdDgGZVMgi4EEfutlWujXUH
 yikubJc7PwXudy+G1rKDS9d8LWfF+9/ST8hVBsmvXouh9ldqj/rtYAibmEth0Wh6IO
 E8e5Cvv/dDE71q0AQBE9yw3WB3uHPTco9Tw6KrNeya122tR2PCy+XFm4Ce/aWwIuWe
 3OmeOlQn+aHSsz71eawJyU1GMk2E+hah60f9R0dzETX/z8qwYbGVj/clAowyMUsjZD
 b00r9zcap4upw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id D4C2AA008A;
 Wed, 15 Apr 2020 12:03:01 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 15 Apr 2020 05:02:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 15 Apr 2020 05:02:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hVvynnPFewqNWviWJSqoxJTgh6098kRSOAB265ukZQ71te2KsellRUB+y4DcqUkC8HnZQQnzs31qnQTuEqvZAY5oopDhK14w7iS1EHt33Ec+995J/lXFIZAct4OiBNamCpWitp2CIsDmOYIVXiIFWJXNJCxFrkWaojCVMYTJgrTo2woN6QgTYI/StJd+LpsyW1qrUP92EheeWkGHXnS9BsyM3SIK9XyqH/CPYyxVN8nlOFZbumZcGJ/dLzHT1nUPzE2nusFS2F1a5kKZELM8+RybtaU6aOjb5ah5FeNoVXxhATXgEsjtoTSeXFxsVGjknNVTuNvM47XzIs+Mqfqrmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7NiDeP1bxmdImgj2AsO9GPRHlRF0wzT5toGkwoMsCU=;
 b=PJCCr+JnOFSPg2DKRAsHJI7nDLtJ9H5fXWv8Vkb45eHbfw6zmrN1NCdH1oTc2wpmkv1+sZ+qE2DAE/WyptVnzdmPedFCZapsomidwm/Y9Ay+nuPMTvYt4ZSbY8wgTeUIQfv2rqcaRMhuN3jE5kC7MV1kb7EmkCj1kJFaE01t/K31sINPP1LEOO4UekRtyKndD0dHMwAF6CRLMvlCG6Fva064IV/l0lM0fi2upwZRMLydcHqeHLUohSA19wC7vQGjA+Z9WGdePJxSDkmE2SWZDgW/8aZLgumSemqUQv2D3lIVE+EVCpuKQj8ju1LLwK4U3lwgqizdKcIbNdMUlvvHvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7NiDeP1bxmdImgj2AsO9GPRHlRF0wzT5toGkwoMsCU=;
 b=U1SfVCGPQ+WUaUtP/pc3cJGCrBK0c4ZN4JYkHss169Rc+FzihBFlo16Zu29dk51pYeZZuj/4vFORIjzBuN99Y0BKgSiue/avTmF2gGTjrxjoqnEWsuqtm1Z8xJKhmJnorXBb8EqlTQeABMfb/yNYJHRbWwgeE/maKXNAzbOL+eQ=
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (2603:10b6:301:e::22)
 by MWHPR12MB1213.namprd12.prod.outlook.com (2603:10b6:300:f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.20; Wed, 15 Apr
 2020 12:02:48 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::a83f:1f42:67e9:dde6]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::a83f:1f42:67e9:dde6%4]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 12:02:48 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: RE: [PATCH 53/59] drm/arc: Move to drm/tiny
Thread-Topic: [PATCH 53/59] drm/arc: Move to drm/tiny
Thread-Index: AQHWEvlb5mSQq60T60WU0QolrVlsW6h57yoAgAAle+A=
Date: Wed, 15 Apr 2020 12:02:48 +0000
Message-ID: <MWHPR12MB14532DA5713E3B579ABFE1F4A1DB0@MWHPR12MB1453.namprd12.prod.outlook.com>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-54-daniel.vetter@ffwll.ch>
 <20200415094512.GA30444@ravnborg.org>
In-Reply-To: <20200415094512.GA30444@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWJyb2RraW5c?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy0wNDZhYTYzZi03ZjExLTExZWEtODAzYi04OGIx?=
 =?us-ascii?Q?MTFjZGUyMTdcYW1lLXRlc3RcMDQ2YWE2NDEtN2YxMS0xMWVhLTgwM2ItODhi?=
 =?us-ascii?Q?MTExY2RlMjE3Ym9keS50eHQiIHN6PSIyMTIwIiB0PSIxMzIzMTQyNTc2NjM2?=
 =?us-ascii?Q?NTUyNjIiIGg9Im5XblNqMktESDVGSmhKZGVwM3JlcWRHT0RJdz0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUJRSkFB?=
 =?us-ascii?Q?QmUvY0xHSFJQV0FmcXlNVitMaHo2WitySXhYNHVIUHBrT0FBQUFBQUFBQUFB?=
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
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abrodkin@synopsys.com; 
x-originating-ip: [188.243.7.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe3fb8e7-42cf-4af0-54cf-08d7e134ea67
x-ms-traffictypediagnostic: MWHPR12MB1213:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB121306ED115CC8B8F552C9D8A1DB0@MWHPR12MB1213.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1453.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39860400002)(376002)(136003)(346002)(366004)(396003)(966005)(2906002)(478600001)(53546011)(6506007)(71200400001)(9686003)(4326008)(55016002)(186003)(26005)(8936002)(5660300002)(66946007)(316002)(81156014)(8676002)(54906003)(76116006)(7696005)(52536014)(6916009)(86362001)(64756008)(66476007)(66556008)(33656002)(66446008);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fxfcamuU6Pg2OpV3FxvE0ldXMb5FCWl1PlqY9Y/XIeC3jkNnV6lYV2+ZX/SEmMCFiB3WvPZFfwFCHNdTQx6+fd+Wm46ntt4kL4c95K9S/v1pTEJ8EXh4EeAawGz/kaLUtymft4ChK3LuKVQICssElJciTdCDuPFHPsoTanE0VRvhJUjJX0Mp1i0CmdDuGjl88iSZGKBpxE9ZN5ODT8YnoMbr/FggTFvmFLZNdZb6dazt3bizaG/lq2ixih+GmBUxIpiovayij+UxIJSHDJtGrAsyFH3RBiKfP1QOaAWQP69o3uBWS/9hh3V6Idv6r3jWKAY7R/XKPg00dRFo3nRCG9JAbXGCU2BAKQ+J3iElv+fGgSoWbkzA2I5AJUdseGkVAIvWsMZLhdcAEGjGjsybqtP6nGqoHyG2cI0tM0+LvEy3X3gk09p6QlKuqVw/m/z1JozAKRa8ZQzNt3zXnir5F/s5F7e9U+nbqoxn34tQCl4=
x-ms-exchange-antispam-messagedata: 03lqNxlS4Y6OeWUAURcl/1ErHbnTVmnGxJex6xhR7u+O7L5KeHC7JFZ9BNOmvAEFFXLR7sJnM7ZHYUO+kMvNddTvE4Vz7VXHHdnBQi8rMhy6deNmxeUK06OBJEuK4rHGDaFc5Ii7yIut1sE77jAe0A==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3fb8e7-42cf-4af0-54cf-08d7e134ea67
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 12:02:48.0745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fVSAUPBEQLmIs/yrDMQu+ClpeIlj1WsviIsq2+YX7jqM4Y5bbAeYinyerpudnod/5KnISC+/UPiWTTjZVSMxlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1213
X-OriginatorOrg: synopsys.com
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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

> -----Original Message-----
> From: Sam Ravnborg <sam@ravnborg.org>
> Sent: Wednesday, April 15, 2020 12:45 PM
> To: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>; Alexey Brodkin
> <abrodkin@synopsys.com>; DRI Development <dri-devel@lists.freedesktop.org>; Daniel Vetter
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny
> 
> Hi Daniel.
> On Wed, Apr 15, 2020 at 09:40:28AM +0200, Daniel Vetter wrote:
> > Because it is.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Alexey Brodkin <abrodkin@synopsys.com>
> > ---
> >  MAINTAINERS                                         |  2 +-
> >  drivers/gpu/drm/Kconfig                             |  2 --
> >  drivers/gpu/drm/Makefile                            |  1 -
> >  drivers/gpu/drm/arc/Kconfig                         | 10 ----------
> >  drivers/gpu/drm/arc/Makefile                        |  3 ---
> >  drivers/gpu/drm/tiny/Kconfig                        | 10 ++++++++++
> >  drivers/gpu/drm/tiny/Makefile                       |  1 +
> >  drivers/gpu/drm/{arc/arcpgu_drv.c => tiny/arcpgu.c} |  0
> >  8 files changed, 12 insertions(+), 17 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/arc/Kconfig
> >  delete mode 100644 drivers/gpu/drm/arc/Makefile
> >  rename drivers/gpu/drm/{arc/arcpgu_drv.c => tiny/arcpgu.c} (100%)
> 
> We have "DRM: ARC: add HDMI 2.0 TX encoder support" which
> adds another platform driver to drm/arc/
> This speaks against the move to tiny IMO

Indeed that's an interesting question, see v3 series here:
https://lists.freedesktop.org/archives/dri-devel/2020-April/262352.html

BTW should I pull that series in my tree and send you a pull-request
or that kind of change needs to go through another tree?

Also I'd like to test the change we discuss here to make sure stuff
still works. Once we do that I'll send an update. Any hint on
when that change needs to be acked/nacked?

-Alexey 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
