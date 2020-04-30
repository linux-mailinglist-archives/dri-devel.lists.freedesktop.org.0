Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7CB1C0EC1
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51B56EC25;
	Fri,  1 May 2020 07:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C4A6E221
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 15:12:10 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6F6234013B;
 Thu, 30 Apr 2020 15:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1588259530; bh=WuoOmaDH385Xj2kE7ORpNPqN0fS75O/XMfm/UEPWP7A=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=boVhXtyLdEJzIMwbaddQxQ7GlTJfXWAl0jsJKKWbpbAio4QA1STgOHRI3MBX9T2Wp
 V+Y58GOWV6JIYFW07MZVpWxnylAl1cT+PTsfIwHxzddbeRMVHS/m4KtXs82OFVWbXF
 pk43ikX7QYEP0LM+u4NVdOvIbPbWWUJgOP0nIlPy5e23V6E0csinNOUssQfpY5U/LP
 zgGXMK63Bfqh1ZeSZmmhmGzLOp3/bDSZImJBAnm26jcY4m4h0soPrTJT8iyNAzense
 t3VX61+Fq0TRJl3tHp1oHxPfxCYJ09xomjhJyUnFKIPLIGvWqFHQezSDeh83Dpkw4p
 FqldVPCyh7+MA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 30C3AA0079;
 Thu, 30 Apr 2020 15:12:01 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 30 Apr 2020 08:12:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Thu, 30 Apr 2020 08:12:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3xlc2kHqE1iriB2k7sZwdnG+CIXxWsDm3ZDWf+c/B4qgpk1UHyNjHtwLnoIZJW7Xq8eTXHuQ9BqXL99E/0+riTxT+8RhHyEPsI9nA0XKgArBEHyCIIXBNNFNpw7Ohv7uVZKtYkf3HSZMCNz67tYsPMVMy5TxiugDkjtuZN6SwF73ENHq2oosBtp/yCORwlC+5vqv6okB75vXaXI0lqRfc2DLYbEU4KwqyLriPOlj+9fDAJOkhG+vT2C0LdJjdFW6o3QNPTEeIUaZXR3P5la1MTSW4jtZ9Q1BAckUUHmdrei6ms2ky/Wc1/8w447YDZHbKODEIabgDpVx9YVuTJwug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmiZqf/G4KZuxRhUz+AFu7gKwyb2X6TmXBlNKi+PxWc=;
 b=Z1n/TihRjZi40urInJQF1UcKEacylO/at/v7rvp9/3ZXlGtb3FBgfdcIwYgzA0Yi7/ObnEuLJndgpCSnifzHvLTf9hTCfPJ8I8i39EUiDG9Tt7hnHcLJQfoZtmZQQCnKINMFbgcUBo56tp1bvZWsnVGpU0kxaIYmd4QwfcW+yF5nBAXwhm/WyRfFAZecThiBIf+AJCt3y8xdyCQg7wLefB9Dpz0JOybv1++/+Scfzyv33KGknhD2zjWgQ9em07EL1BrGzEZTEKrGjbRg4CkrUIw3GYM2228+gAE5r36kpqyFkW48dBWj1DVnLnkd09LSNpDPznJ8gP75wGc99jukAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmiZqf/G4KZuxRhUz+AFu7gKwyb2X6TmXBlNKi+PxWc=;
 b=gPQM2KwEkEes22u7z+bflrijBE55pvovEU9JQ6RwjR8pSavxDRXJiECXRqySsnBVZi7Jhy5qpB+S6/cF/nY+ywtMU6VWqtengHf1q4quRk8swMrGESo6T/RF1VEfXiMPXwi2I6nKVuAt6ffO0VLrHbAwPIMPPRQJo5u01TQQ9as=
Received: from CH2PR12MB3782.namprd12.prod.outlook.com (2603:10b6:610:23::28)
 by CH2PR12MB3943.namprd12.prod.outlook.com (2603:10b6:610:2d::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Thu, 30 Apr
 2020 15:11:59 +0000
Received: from CH2PR12MB3782.namprd12.prod.outlook.com
 ([fe80::c8ba:1b80:f234:e1c2]) by CH2PR12MB3782.namprd12.prod.outlook.com
 ([fe80::c8ba:1b80:f234:e1c2%2]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 15:11:59 +0000
From: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
To: Daniel Vetter <daniel@ffwll.ch>, Adrian Ratiu <adrian.ratiu@collabora.com>
Subject: RE: [PATCH v7 4/8] drm: imx: Add i.MX 6 MIPI DSI host platform driver
Thread-Topic: [PATCH v7 4/8] drm: imx: Add i.MX 6 MIPI DSI host platform driver
Thread-Index: AQHWF/hHmRH7W3MKo0WMruBLgG/ar6iEVNaAgApOWwCAAE2OAIACzjiAgAASMnA=
Date: Thu, 30 Apr 2020 15:11:59 +0000
Message-ID: <CH2PR12MB37825DDA6314C68488FC10C8CBAA0@CH2PR12MB3782.namprd12.prod.outlook.com>
References: <20200421161610.1501827-1-adrian.ratiu@collabora.com>
 <20200421161610.1501827-5-adrian.ratiu@collabora.com>
 <20200422010727.GM5983@pendragon.ideasonboard.com>
 <20200428143030.GN3456981@phenom.ffwll.local> <87pnbrig2z.fsf@collabora.com>
 <20200430135841.GE10381@phenom.ffwll.local>
In-Reply-To: <20200430135841.GE10381@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYW5nZWxvclxh?=
 =?us-ascii?Q?cHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJh?=
 =?us-ascii?Q?MjllMzViXG1zZ3NcbXNnLWVkNzgzYjIyLThhZjQtMTFlYS05ZDczLWZjNzc3?=
 =?us-ascii?Q?NGVlZGMyZVxhbWUtdGVzdFxlZDc4M2IyNC04YWY0LTExZWEtOWQ3My1mYzc3?=
 =?us-ascii?Q?NzRlZWRjMmVib2R5LnR4dCIgc3o9IjI0MDM5IiB0PSIxMzIzMjczMzExNTkx?=
 =?us-ascii?Q?MjM4OTUiIGg9Ii9ScDBmcHI4cXZGZnV4LyttNUZrQ0JUYzRIQT0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUJRSkFB?=
 =?us-ascii?Q?QzNwOUN2QVIvV0FSb2dtbW5DQnlCZEdpQ2FhY0lISUYwT0FBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQUNrQ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBSGFXeU5BQUFBQUFBQUFBQUFBQUFBSjRBQUFCbUFHa0Fi?=
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
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [95.136.124.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66ecbeef-8489-4c72-e4cd-08d7ed18d43c
x-ms-traffictypediagnostic: CH2PR12MB3943:
x-microsoft-antispam-prvs: <CH2PR12MB3943339AF2672EBA931D1B1ECBAA0@CH2PR12MB3943.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0389EDA07F
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3782.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(376002)(396003)(39860400002)(136003)(346002)(7696005)(83080400001)(9686003)(54906003)(52536014)(55016002)(110136005)(316002)(966005)(2906002)(4326008)(8676002)(71200400001)(33656002)(478600001)(76116006)(6506007)(30864003)(7416002)(86362001)(8936002)(66476007)(64756008)(5660300002)(66446008)(66946007)(66556008)(186003)(26005)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R64OjMM7TnWG916TyYOq0rUsUwgDAVNaKn3eXqvH2RQv1+nD7j0A2/dt5Y4LfE3LRGpjUWz6/1VQgulPPT61uDIG+s0I8dYIhlSjhjYh+2xTZDR2CWUiL3M8PT9855yPcYMglFmdjc60+uWnpgYaeKYEmxRJ7MyUlKODdStYigQhrdICIhVmUk1mRTOlM/ggtBcThnqhao9BcKsQ+2O+lo7k2NPvJzoOqybEU1BNq8okdDXKXDyvmwGatAyINwABA3gturM5Yh9rnRppJ3dOncsTPNysEbRaHtLo+WvqLJfe3QgbJvjnNl/g86Ze95AIIbuKYN9PNdx77QyDBswpGShUlQ3tbmpVInt+Q7PDb9OGAPnJdOscNs28C7I2nhWzgFMqfjScnhHPmJ3awUBzXADD2t4di0E1V4EV4Rl6OXml75b9vlg6tYCo+ZfKar/P58iElKWK8RQtBEeK1k96uf0TWoO0g9B4QZzBocmekKzZj/wIGHAMjSxL6+7GSvl58b//BkhJ6YiGATrz5KzlSw==
x-ms-exchange-antispam-messagedata: rJNrWaSgO/ShMdnbtxFNSoqRALSCsz5OUE4z46k5Pvwka4qJKACaLG01Bl9zhPHC3yOYaNAFk/8EsOCgoisLYNxIJiOUarIZdxVptpubEwOp6xjLUfZi+FYR7K8ebAxmscpXsMDWOXVfnDFp/7+PQauWHYsJz1Sc3FlXjKjTAlZbR377mHtEKJZ43UCgtV/Fsto/R8NTvACHyhRGkxtIe2eG26d0QCfdZ1QkC9AQrFQbs/3UveKx+emmhVH4TZxXDNVc2iLgl9bp4QO2FI6UYzDSGpxhahCqpOBMuI+UtRdll3aBKonk5PNE4Bm+lJACCo3HqANYZQ5GRlDuMokQ4MbUZdjBeptKtUqnYW574uzZknYg8hC+/RChNyGoC9VWOI7Cbin4sUnOxDi1Q8j7AdSdcJWmRpX0wIdAVME1JUTn3YsB0InQX1yP7pr441U5tuvps2p95tgR+YG5Ua8PxbV6sthUpGX6GeYttAyOu1fVtdLnzYpxvl8PfnN0CdqG3UNYBhE+jXeUimsDVd8BX6WCtuMk+knxIB1ZKI83/kHEMQsFxQVx+nLnkXsSq5UV//oDwSJ6YRmMoSRvJOwLCei+qmXiTA+K291wPGiM5RiVFzR4Sqx4exgTQmIMG5q9ZAQ2b8eIwMXgevonJ4uhJ27D03URLnslJCpuP/OpwWQQSbe/m598X9kZesVJYjHDvSpP/WDjafowtDJsvqNBznW3ey1L9qf7ZmyKs4T6ruLVe7YZpuKxhcip0+FeRa89hrG9AkRwA5nRjj1zKp2OYQ/bO0WQdfORUnSWOCozf0k=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ecbeef-8489-4c72-e4cd-08d7ed18d43c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2020 15:11:59.0873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GkG+4EdIi1F4QG1rHxEXz3R4nhKBd3IWsDX6tpcYWjQD+3FoObFclb9wLKQ/lrb40MDpdyithR6RkgQWtqT4Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3943
X-OriginatorOrg: synopsys.com
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
 Jernej Skrabec <jernej.skrabec@siol.net>, Adrian Pop <pop.adrian61@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Martyn Welch <martyn.welch@collabora.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, Apr 30, 2020 at 14:58:41

> On Tue, Apr 28, 2020 at 10:08:04PM +0300, Adrian Ratiu wrote:
> > Hi Daniel,
> > 
> > On Tue, 28 Apr 2020, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Wed, Apr 22, 2020 at 04:07:27AM +0300, Laurent Pinchart wrote:
> > > > Hi Adrian,  On Tue, Apr 21, 2020 at 07:16:06PM +0300, Adrian Ratiu
> > > > wrote: > This adds support for the Synopsis DesignWare MIPI DSI
> > > > v1.01 > host controller which is embedded in i.MX 6 SoCs.   Based on
> > > > > following patches, but updated/extended to work with existing >
> > > > support found in the kernel:  - drm: imx: Support Synopsys >
> > > > DesignWare MIPI DSI host controller >   Signed-off-by: Liu Ying
> > > > <Ying.Liu@freescale.com> >  Cc: Fabio Estevam <festevam@gmail.com>
> > > > Cc: Enric Balletbo > Serra <eballetbo@gmail.com> Reviewed-by: Emil
> > > > Velikov > <emil.velikov@collabora.com> Tested-by: Adrian Pop >
> > > > <pop.adrian61@gmail.com> Tested-by: Arnaud Ferraris >
> > > > <arnaud.ferraris@collabora.com> Signed-off-by: Sjoerd Simons >
> > > > <sjoerd.simons@collabora.com> Signed-off-by: Martyn Welch >
> > > > <martyn.welch@collabora.com> Signed-off-by: Adrian Ratiu >
> > > > <adrian.ratiu@collabora.com> --- Changes since v6: >   - Replaced
> > > > custom noop encoder with the simple drm encoder >   (Enric) - Added
> > > > CONFIG_DRM_IMX6_MIPI_DSI depends on >   CONFIG_OF (Enric) - Dropped
> > > > imx_mipi_dsi_register() because >   now it only creates the dummy
> > > > encoder which can easily be >   done directly in imx_dsi_bind() >
> > > > Changes since v5: >   - Reword to remove unrelated device tree patch
> > > > mention >   (Fabio) - Move pllref_clk enable/disable to bind/unbind
> > > > >   (Ezequiel) - Fix freescale.com -> nxp.com email addresses >
> > > > (Fabio) - Also added myself as module author (Fabio) - Use >
> > > > DRM_DEV_* macros for consistency, print more error msg >  Changes
> > > > since v4: >   - Split off driver-specific configuration of phy
> > > > timings >   due to new upstream API.  - Move regmap infrastructure >
> > > > logic to separate commit (Ezequiel) - Move dsi v1.01 layout >
> > > > addition to a separate commit (Ezequiel) - Minor warnings >   and
> > > > driver name fixes >  Changes since v3: >   - Renamed platform driver
> > > > to reflect it's i.MX6 >   only. (Fabio) >  Changes since v2: >   -
> > > > Fixed commit tags. (Emil) >  Changes since v1: >   - Moved register
> > > > definitions & regmap initialization into >   bridge module. Platform
> > > > drivers get the regmap via >   plat_data after calling the bridge
> > > > probe. (Emil) > --- >  drivers/gpu/drm/imx/Kconfig            |   8
> > > > + >  drivers/gpu/drm/imx/Makefile           |   1 + >
> > > > drivers/gpu/drm/imx/dw_mipi_dsi-imx6.c | 391 >
> > > > +++++++++++++++++++++++++ 3 files changed, 400 insertions(+) >
> > > > create mode 100644 drivers/gpu/drm/imx/dw_mipi_dsi-imx6.c >  diff
> > > > --git a/drivers/gpu/drm/imx/Kconfig > b/drivers/gpu/drm/imx/Kconfig
> > > > index > 207bf7409dfba..0dffc72df7922 100644 --- >
> > > > a/drivers/gpu/drm/imx/Kconfig +++ > b/drivers/gpu/drm/imx/Kconfig @@
> > > > -39,3 +39,11 @@ config > DRM_IMX_HDMI >  	depends on DRM_IMX help
> > > > Choose this if you want to use >  HDMI on i.MX6. > + +config
> > > > DRM_IMX6_MIPI_DSI +	tristate "Freescale i.MX6 > DRM MIPI DSI"
> > > > +	select DRM_DW_MIPI_DSI +	depends on > DRM_IMX +	depends on OF
> > > > +	help +	  Choose this if you want > to use MIPI DSI on i.MX6.  diff
> > > > --git > a/drivers/gpu/drm/imx/Makefile
> > > > b/drivers/gpu/drm/imx/Makefile > index 21cdcc2faabc8..9a7843c593478
> > > > 100644 --- > a/drivers/gpu/drm/imx/Makefile +++ >
> > > > b/drivers/gpu/drm/imx/Makefile @@ -9,3 +9,4 @@ >
> > > > obj-$(CONFIG_DRM_IMX_TVE) += imx-tve.o >  obj-$(CONFIG_DRM_IMX_LDB)
> > > > += imx-ldb.o >  obj-$(CONFIG_DRM_IMX_HDMI) += dw_hdmi-imx.o >
> > > > +obj-$(CONFIG_DRM_IMX6_MIPI_DSI) += dw_mipi_dsi-imx6.o diff > --git
> > > > a/drivers/gpu/drm/imx/dw_mipi_dsi-imx6.c >
> > > > b/drivers/gpu/drm/imx/dw_mipi_dsi-imx6.c new file mode 100644 >
> > > > index 0000000000000..f8a0a4fe16e21 --- /dev/null +++ >
> > > > b/drivers/gpu/drm/imx/dw_mipi_dsi-imx6.c @@ -0,0 +1,391 @@ > +//
> > > > SPDX-License-Identifier: GPL-2.0+ +/* + * i.MX6 drm > driver - MIPI
> > > > DSI Host Controller + * + * Copyright (C) > 2011-2015 Freescale
> > > > Semiconductor, Inc.  + * Copyright (C) > 2019-2020 Collabora, Ltd.
> > > > + */ + +#include <linux/clk.h> > +#include <linux/component.h>
> > > > +#include <linux/mfd/syscon.h> > +#include
> > > > <linux/mfd/syscon/imx6q-iomuxc-gpr.h> +#include > <linux/module.h>
> > > > +#include <linux/of_device.h> +#include > <linux/regmap.h> +#include
> > > > <linux/videodev2.h> +#include > <drm/bridge/dw_mipi_dsi.h> +#include
> > > > <drm/drm_crtc_helper.h> > +#include <drm/drm_mipi_dsi.h> +#include
> > > > <drm/drm_of.h> > +#include <drm/drm_print.h> + +#include "imx-drm.h"
> > > > + > +#define DSI_PWR_UP			0x04 +#define > RESET				0 +#define
> > > > POWERUP > BIT(0) + +#define DSI_PHY_IF_CTRL			0x5c > +#define
> > > > PHY_IF_CTRL_RESET		0x0 + +#define > DSI_PHY_TST_CTRL0		0x64 +#define
> > > > PHY_TESTCLK > BIT(1) +#define PHY_UNTESTCLK			0 +#define >
> > > > PHY_TESTCLR			BIT(0) +#define > PHY_UNTESTCLR			0 + +#define >
> > > > DSI_PHY_TST_CTRL1		0x68 +#define PHY_TESTEN > BIT(16) +#define
> > > > PHY_UNTESTEN			0 +#define > PHY_TESTDOUT(n)			(((n) & 0xff) << 8) >
> > > > +#define PHY_TESTDIN(n)			(((n) & 0xff) << > 0) + +struct
> > > > imx_mipi_dsi { +	struct drm_encoder > encoder; +	struct device *dev;
> > > > +	struct regmap *mux_sel; + > struct dw_mipi_dsi *mipi_dsi; +	struct
> > > > clk *pllref_clk; + > +	void __iomem *base; +	unsigned int lane_mbps;
> > > > +}; + > +struct dphy_pll_testdin_map { +	unsigned int max_mbps; + >
> > > > u8 testdin; +}; + +/* The table is based on 27MHz DPHY pll >
> > > > reference clock. */ +static const struct dphy_pll_testdin_map >
> > > > dptdin_map[] = { +	{160, 0x04}, {180, 0x24}, {200, 0x44}, > {210,
> > > > 0x06}, +	{240, 0x26}, {250, 0x46}, {270, 0x08}, > {300, 0x28},
> > > > +	{330, 0x48}, {360, 0x2a}, {400, 0x4a}, > {450, 0x0c}, +	{500,
> > > > 0x2c}, {550, 0x0e}, {600, 0x2e}, > {650, 0x10}, +	{700, 0x30}, {750,
> > > > 0x12}, {800, 0x32}, > {850, 0x14}, +	{900, 0x34}, {950, 0x54},
> > > > {1000, 0x74} +}; > + +static inline struct imx_mipi_dsi
> > > > *enc_to_dsi(struct > drm_encoder *enc) +{ +	return container_of(enc,
> > > > struct > imx_mipi_dsi, encoder); +} + +static void >
> > > > imx_mipi_dsi_set_ipu_di_mux(struct imx_mipi_dsi *dsi, int > ipu_di)
> > > > +{ +	regmap_update_bits(dsi->mux_sel, > IOMUXC_GPR3, + >
> > > > IMX6Q_GPR3_MIPI_MUX_CTL_MASK, +			   ipu_di > <<
> > > > IMX6Q_GPR3_MIPI_MUX_CTL_SHIFT); +} + +static bool >
> > > > imx_mipi_dsi_encoder_mode_fixup(struct drm_encoder *encoder, >
> > > > +					    const struct > drm_display_mode *mode, + > struct
> > > > drm_display_mode *adj_mode) +{ +	return true; +} + > +static int
> > > > imx_mipi_dsi_encoder_atomic_check(struct > drm_encoder *encoder, + >
> > > > struct drm_crtc_state *crtc_state, + > struct drm_connector_state
> > > > *conn) +{ +	struct > imx_crtc_state *imx_crtc_state = >
> > > > to_imx_crtc_state(crtc_state); + +	/* The following values > are
> > > > taken from dw_hdmi_imx_atomic_check */ + >
> > > > imx_crtc_state->bus_format = MEDIA_BUS_FMT_RGB888_1X24; + >
> > > > imx_crtc_state->di_hsync_pin = 2; + > imx_crtc_state->di_vsync_pin =
> > > > 3; + +	return 0; +}  No encoder functions please. This should be a
> > > > bridge driver, the encoder should be created by the i.MX display
> > > > controller driver itself. As that would require quite a bit of
> > > > refactoring I'm OK having an encoder here for the meantime, but it
> > > > should be a dummy one, without any operation.
> > > 
> > > +1 on this, came to say the same. This seems to duplicate the dw-hdmi
> > > design, where the code organization is a bit a mess, with some parts in
> > > drm/bridge, and some parts in each drm_device driver. Plus drm_encoder
> > > in there on top.
> > > 
> > > If we want to continue with the drm_bridge abstraction for these kind of
> > > drivers then imo we need:
> > > 
> > > - to make drm_bridge the actual abstraction, no leaking back&forth
> > > between   the bridge chip and the overall drm_device side of things.
> > > 
> > > - move _all_ dw-mipi-dsi related code into drm/bridge
> > > 
> > > - for the platform specific binding stuff I think drm/bridge/dw-mipi-dsi
> > > directory, which contains the main driver, plus a file each   for the
> > > imx/stm/whatever platform bindings sounds like a   reasonable layout.
> > > 
> > > If that doesn't work, then I think dw-mipi-dsi isn't really a bridge
> > > driver with clear encapsulation, but instead should be structured as a
> > > helper library to implement a drm_encoder. And no drm_bridge.
> > > 
> > > And yes the exact same problem exists with dw-hdmi. That's the reason
> > > why I've started to look into these, it's not really a code pattern we
> > > should repeat imo.
> > 
> > The code structure you propose should be doable and I was actually thinking
> > of something like it when writing the cover letter for v8 of this series,
> > about how to consolidate the Synopsis DW MIPI DSI logic at the same time
> > while consolidating the rest of imx drivers to unify their simple encoder
> > management.
> > 
> > Thank you for fleshing it out! It's very helpful :)
> > 
> > BTW have you seen what I did with the bridge in v8 for the imx6 driver?  [1]
> > 
> > What I'd like to avoid is feature creep in this patch series which is about
> > adding the imx6 driver, because I think moving the logic and refactoring all
> > the drivers is a separate issue and already this series is big and
> > increasing.
> > 
> > So would you be ok with merging the imx6 mipi dsi driver with its
> > dw-mipi-dsi regamp rework and doing the refactoring to consolidate all the
> > bridge logic in a separate patch series which also includes moving the
> > rockchip and stm encoder logic to a drm_bridge?
> > 
> > Or would you like me to do this consolidation rework in advance just for the
> > new imx6 mipi-dsi driver in this series and tackle the rest of drivers in a
> > separate patch series?
> 
> Yeah I think that rework is going to be a lot of work. Generally as long
> as we have agreement about the long-term direction, then I think in-tree
> refactoring leads to best results. So if other bridge people (I've just
> jumped in here) agree, then we're good to go.
> 
> I think best way to document the agreement is to type up a patch for
> Documentation/gpu/todo.rst with the full plan, with some details. And then
> get acks from bridge maintainers. I think Laurent, Sam and Boris
> Brezillion are most active right now with shaping the drm_bridge future.
> 
> Cheers, Daniel
> 

Hi Adrian,

Indeed the driver is getting quite messy, if it goes ahead I 
would be available to help on this driver rework.

I think that also the inclusion of a phy driver could help
in making this driver more clear since most of the code that
each vender has it's phy related.

Thanks,
Angelo

> > 
> > @Laurent, do you also have suggestions how to proceed?
> > 
> > [1] https://urldefense.com/v3/__https://lore.kernel.org/linux-arm-kernel/20200427081952.3536741-1-adrian.ratiu@collabora.com/__;!!A4F2R9G_pg!NhBPZGbhUKJY_mrt-2Ft_ja04W8XPqZ8P3-wntQomu30weMxgQfUEXZgnyJXUb7A$ 
> > 
> > Thank you,
> > Adrian
> > 
> > > 
> > > Cheers, Daniel
> > > 
> > > > 
> > > > > +
> > > > > +static void imx_mipi_dsi_encoder_commit(struct drm_encoder *encoder)
> > > > > +{
> > > > > +	struct imx_mipi_dsi *dsi = enc_to_dsi(encoder);
> > > > > +	int mux = drm_of_encoder_active_port_id(dsi->dev->of_node, encoder);
> > > > > +
> > > > > +	imx_mipi_dsi_set_ipu_di_mux(dsi, mux);
> > > > > +}
> > > > > +
> > > > > +static void imx_mipi_dsi_encoder_disable(struct drm_encoder *encoder)
> > > > > +{
> > > > > +}
> > > > > +
> > > > > +static const struct drm_encoder_helper_funcs imx_mipi_dsi_encoder_helpers = {
> > > > > +	.mode_fixup = imx_mipi_dsi_encoder_mode_fixup,
> > > > > +	.commit = imx_mipi_dsi_encoder_commit,
> > > > > +	.disable = imx_mipi_dsi_encoder_disable,
> > > > > +	.atomic_check = imx_mipi_dsi_encoder_atomic_check,
> > > > > +};
> > > > > +
> > > > > +static enum drm_mode_status imx_mipi_dsi_mode_valid(void *priv_data,
> > > > > +					const struct drm_display_mode *mode)
> > > > > +{
> > > > > +	/*
> > > > > +	 * The VID_PKT_SIZE field in the DSI_VID_PKT_CFG
> > > > > +	 * register is 11-bit.
> > > > > +	 */
> > > > > +	if (mode->hdisplay > 0x7ff)
> > > > > +		return MODE_BAD_HVALUE;
> > > > > +
> > > > > +	/*
> > > > > +	 * The V_ACTIVE_LINES field in the DSI_VTIMING_CFG
> > > > > +	 * register is 11-bit.
> > > > > +	 */
> > > > > +	if (mode->vdisplay > 0x7ff)
> > > > > +		return MODE_BAD_VVALUE;
> > > > > +
> > > > > +	return MODE_OK;
> > > > > +}
> > > > > +
> > > > > +
> > > > > +static unsigned int max_mbps_to_testdin(unsigned int max_mbps)
> > > > > +{
> > > > > +	unsigned int i;
> > > > > +
> > > > > +	for (i = 0; i < ARRAY_SIZE(dptdin_map); i++)
> > > > > +		if (dptdin_map[i].max_mbps == max_mbps)
> > > > > +			return dptdin_map[i].testdin;
> > > > > +
> > > > > +	return -EINVAL;
> > > > > +}
> > > > > +
> > > > > +static inline void dsi_write(struct imx_mipi_dsi *dsi, u32 reg, u32 val)
> > > > > +{
> > > > > +	writel(val, dsi->base + reg);
> > > > > +}
> > > > > +
> > > > > +static int imx_mipi_dsi_phy_init(void *priv_data)
> > > > > +{
> > > > > +	struct imx_mipi_dsi *dsi = priv_data;
> > > > > +	int testdin;
> > > > > +
> > > > > +	testdin = max_mbps_to_testdin(dsi->lane_mbps);
> > > > > +	if (testdin < 0) {
> > > > > +		DRM_DEV_ERROR(dsi->dev,
> > > > > +			      "failed to get testdin for %dmbps lane clock\n",
> > > > > +			      dsi->lane_mbps);
> > > > > +		return testdin;
> > > > > +	}
> > > > > +
> > > > > +	dsi_write(dsi, DSI_PHY_IF_CTRL, PHY_IF_CTRL_RESET);
> > > > > +	dsi_write(dsi, DSI_PWR_UP, POWERUP);
> > > > > +
> > > > > +	dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_UNTESTCLK | PHY_UNTESTCLR);
> > > > > +	dsi_write(dsi, DSI_PHY_TST_CTRL1, PHY_TESTEN | PHY_TESTDOUT(0) |
> > > > > +		  PHY_TESTDIN(0x44));
> > > > > +	dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_TESTCLK | PHY_UNTESTCLR);
> > > > > +	dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_UNTESTCLK | PHY_UNTESTCLR);
> > > > > +	dsi_write(dsi, DSI_PHY_TST_CTRL1, PHY_UNTESTEN | PHY_TESTDOUT(0) |
> > > > > +		  PHY_TESTDIN(testdin));
> > > > > +	dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_TESTCLK | PHY_UNTESTCLR);
> > > > > +	dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_UNTESTCLK | PHY_UNTESTCLR);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static int imx_mipi_dsi_get_lane_mbps(void *priv_data,
> > > > > +				      const struct drm_display_mode *mode,
> > > > > +				      unsigned long mode_flags, u32 lanes,
> > > > > +				      u32 format, unsigned int *lane_mbps)
> > > > > +{
> > > > > +	struct imx_mipi_dsi *dsi = priv_data;
> > > > > +	int bpp;
> > > > > +	unsigned int i, target_mbps, mpclk;
> > > > > +	unsigned long pllref;
> > > > > +
> > > > > +	bpp = mipi_dsi_pixel_format_to_bpp(format);
> > > > > +	if (bpp < 0) {
> > > > > +		DRM_DEV_ERROR(dsi->dev, "failed to get bpp for format %d: %d\n",
> > > > > +			      format, bpp);
> > > > > +		return bpp;
> > > > > +	}
> > > > > +
> > > > > +	pllref = clk_get_rate(dsi->pllref_clk);
> > > > > +	if (pllref != 27000000)
> > > > > +		DRM_WARN("DSI pllref_clk not set to 27Mhz\n");
> > > > > +
> > > > > +	mpclk = DIV_ROUND_UP(mode->clock, MSEC_PER_SEC);
> > > > > +	if (mpclk) {
> > > > > +		/* take 1/0.7 blanking overhead into consideration */
> > > > > +		target_mbps = (mpclk * (bpp / lanes) * 10) / 7;
> > > > > +	} else {
> > > > > +		DRM_DEV_ERROR(dsi->dev, "use default 1Gbps DPHY pll clock\n");
> > > > > +		target_mbps = 1000;
> > > > > +	}
> > > > > +
> > > > > +	DRM_DEV_DEBUG(dsi->dev, "target pllref_clk frequency is %uMbps\n",
> > > > > +		      target_mbps);
> > > > > +
> > > > > +	for (i = 0; i < ARRAY_SIZE(dptdin_map); i++) {
> > > > > +		if (target_mbps < dptdin_map[i].max_mbps) {
> > > > > +			*lane_mbps = dptdin_map[i].max_mbps;
> > > > > +			dsi->lane_mbps = *lane_mbps;
> > > > > +			DRM_DEV_DEBUG(dsi->dev,
> > > > > +				      "real pllref_clk frequency is %uMbps\n",
> > > > > +				      *lane_mbps);
> > > > > +			return 0;
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	DRM_DEV_ERROR(dsi->dev, "DPHY clock frequency %uMbps is out of range\n",
> > > > > +		      target_mbps);
> > > > > +
> > > > > +	return -EINVAL;
> > > > > +}
> > > > > +
> > > > > +static int
> > > > > +dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
> > > > > +			   struct dw_mipi_dsi_dphy_timing *timing)
> > > > > +{
> > > > > +	timing->clk_hs2lp = 0x40;
> > > > > +	timing->clk_lp2hs = 0x40;
> > > > > +	timing->data_hs2lp = 0x40;
> > > > > +	timing->data_lp2hs = 0x40;
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static const struct dw_mipi_dsi_phy_ops dw_mipi_dsi_imx6_phy_ops = {
> > > > > +	.init = imx_mipi_dsi_phy_init,
> > > > > +	.get_lane_mbps = imx_mipi_dsi_get_lane_mbps,
> > > > > +	.get_timing = dw_mipi_dsi_phy_get_timing,
> > > > > +};
> > > > > +
> > > > > +static struct dw_mipi_dsi_plat_data imx6q_mipi_dsi_drv_data = {
> > > > > +	.max_data_lanes = 2,
> > > > > +	.mode_valid = imx_mipi_dsi_mode_valid,
> > > > > +	.phy_ops = &dw_mipi_dsi_imx6_phy_ops,
> > > > > +};
> > > > > +
> > > > > +static const struct of_device_id imx_dsi_dt_ids[] = {
> > > > > +	{
> > > > > +		.compatible = "fsl,imx6q-mipi-dsi",
> > > > > +		.data = &imx6q_mipi_dsi_drv_data,
> > > > > +	},
> > > > > +	{ /* sentinel */ }
> > > > > +};
> > > > > +MODULE_DEVICE_TABLE(of, imx_dsi_dt_ids);
> > > > > +
> > > > > +static int imx_mipi_dsi_bind(struct device *dev, struct device *master,
> > > > > +			     void *data)
> > > > > +{
> > > > > +	struct imx_mipi_dsi *dsi = dev_get_drvdata(dev);
> > > > > +	struct drm_device *drm = data;
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = clk_prepare_enable(dsi->pllref_clk);
> > > > > +	if (ret) {
> > > > > +		DRM_DEV_ERROR(dev, "Failed to enable pllref_clk: %d\n", ret);
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	ret = imx_drm_create_encoder(drm, &dsi->encoder, dsi->dev->of_node);
> > > > > +	if (ret) {
> > > > > +		DRM_DEV_ERROR(dsi->dev, "failed to create drm encoder\n");
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	drm_encoder_helper_add(&dsi->encoder, &imx_mipi_dsi_encoder_helpers);
> > > > > +
> > > > > +	ret = dw_mipi_dsi_bind(dsi->mipi_dsi, &dsi->encoder);
> > > > > +	if (ret) {
> > > > > +		DRM_DEV_ERROR(dev, "Failed to bind: %d\n", ret);
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static void imx_mipi_dsi_unbind(struct device *dev, struct device *master,
> > > > > +				void *data)
> > > > > +{
> > > > > +	struct imx_mipi_dsi *dsi = dev_get_drvdata(dev);
> > > > > +
> > > > > +	dw_mipi_dsi_unbind(dsi->mipi_dsi);
> > > > > +
> > > > > +	clk_disable_unprepare(dsi->pllref_clk);
> > > > > +}
> > > > > +
> > > > > +static const struct component_ops imx_mipi_dsi_ops = {
> > > > > +	.bind	= imx_mipi_dsi_bind,
> > > > > +	.unbind	= imx_mipi_dsi_unbind,
> > > > > +};
> > > > > +
> > > > > +static int imx_mipi_dsi_probe(struct platform_device *pdev)
> > > > > +{
> > > > > +	struct device *dev = &pdev->dev;
> > > > > +	const struct of_device_id *of_id = of_match_device(imx_dsi_dt_ids, dev);
> > > > > +	struct dw_mipi_dsi_plat_data *pdata = (struct dw_mipi_dsi_plat_data *) of_id->data;
> > > > > +	struct imx_mipi_dsi *dsi;
> > > > > +	struct resource *res;
> > > > > +	int ret;
> > > > > +
> > > > > +	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> > > > > +	if (!dsi)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	dsi->dev = dev;
> > > > > +
> > > > > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > > +	dsi->base = devm_ioremap_resource(dev, res);
> > > > > +	if (IS_ERR(dsi->base)) {
> > > > > +		ret = PTR_ERR(dsi->base);
> > > > > +		DRM_DEV_ERROR(dev, "Unable to get dsi registers: %d\n", ret);
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	dsi->pllref_clk = devm_clk_get(dev, "ref");
> > > > > +	if (IS_ERR(dsi->pllref_clk)) {
> > > > > +		ret = PTR_ERR(dsi->pllref_clk);
> > > > > +		DRM_DEV_ERROR(dev, "Unable to get pllref_clk: %d\n", ret);
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	dsi->mux_sel = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,gpr");
> > > > > +	if (IS_ERR(dsi->mux_sel)) {
> > > > > +		ret = PTR_ERR(dsi->mux_sel);
> > > > > +		DRM_DEV_ERROR(dev, "Failed to get GPR regmap: %d\n", ret);
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	dev_set_drvdata(dev, dsi);
> > > > > +
> > > > > +	imx6q_mipi_dsi_drv_data.base = dsi->base;
> > > > > +	imx6q_mipi_dsi_drv_data.priv_data = dsi;
> > > > > +
> > > > > +	dsi->mipi_dsi = dw_mipi_dsi_probe(pdev, pdata);
> > > > > +	if (IS_ERR(dsi->mipi_dsi)) {
> > > > > +		ret = PTR_ERR(dsi->mipi_dsi);
> > > > > +		DRM_DEV_ERROR(dev, "Failed to probe DW DSI host: %d\n", ret);
> > > > > +		goto err_clkdisable;
> > > > > +	}
> > > > > +
> > > > > +	return component_add(&pdev->dev, &imx_mipi_dsi_ops);
> > > > > +
> > > > > +err_clkdisable:
> > > > > +	clk_disable_unprepare(dsi->pllref_clk);
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +static int imx_mipi_dsi_remove(struct platform_device *pdev)
> > > > > +{
> > > > > +	component_del(&pdev->dev, &imx_mipi_dsi_ops);
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static struct platform_driver imx_mipi_dsi_driver = {
> > > > > +	.probe		= imx_mipi_dsi_probe,
> > > > > +	.remove		= imx_mipi_dsi_remove,
> > > > > +	.driver		= {
> > > > > +		.of_match_table = imx_dsi_dt_ids,
> > > > > +		.name	= "dw-mipi-dsi-imx6",
> > > > > +	},
> > > > > +};
> > > > > +module_platform_driver(imx_mipi_dsi_driver);
> > > > > +
> > > > > +MODULE_DESCRIPTION("i.MX6 MIPI DSI host controller driver");
> > > > > +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> > > > > +MODULE_AUTHOR("Adrian Ratiu <adrian.ratiu@collabora.com>");
> > > > > +MODULE_LICENSE("GPL");
> > > > > -- > 2.26.0
> > > > >
> > > > 
> > > > -- 
> > > > Regards,
> > > > 
> > > > Laurent Pinchart
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://urldefense.com/v3/__https://lists.freedesktop.org/mailman/listinfo/dri-devel__;!!A4F2R9G_pg!NhBPZGbhUKJY_mrt-2Ft_ja04W8XPqZ8P3-wntQomu30weMxgQfUEXZgn99IbZV5$ 
> > > 
> > > -- 
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > https://urldefense.com/v3/__http://blog.ffwll.ch__;!!A4F2R9G_pg!NhBPZGbhUKJY_mrt-2Ft_ja04W8XPqZ8P3-wntQomu30weMxgQfUEXZgn_FrwlWk$ 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://urldefense.com/v3/__http://blog.ffwll.ch__;!!A4F2R9G_pg!NhBPZGbhUKJY_mrt-2Ft_ja04W8XPqZ8P3-wntQomu30weMxgQfUEXZgn_FrwlWk$ 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://urldefense.com/v3/__https://lists.freedesktop.org/mailman/listinfo/dri-devel__;!!A4F2R9G_pg!NhBPZGbhUKJY_mrt-2Ft_ja04W8XPqZ8P3-wntQomu30weMxgQfUEXZgn99IbZV5$ 


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
