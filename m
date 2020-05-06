Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 603A11C8319
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 09:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E936E93E;
	Thu,  7 May 2020 07:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF6F89BF6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 07:50:35 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4030B439C8;
 Wed,  6 May 2020 07:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1588751435; bh=9x9+swrBKLXXWFOc9qd7COZYa3dThq3U4qCJsLiEriI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=H4Rg3YndDelkQYvIzT8C/Qa1Qrp7m7yppZXYMWcftkF1ALXwxs6RpT36ZM+8DFmT2
 vv3YyVsmHvFeUD7fEpv/kG3as8IxWxgUEdCfUZ1agPeWA4RR4t2knrALNaARc41Bqh
 ihRHcN10rAJU3Gs8+Rv/4pO3+1KEiPbugHGs1mpFSKxYJIhuu2CycHXbFVx+zur5Bj
 ugd1uBeM14opLWk3tutDIDB9ij1PxUBjh+8xjqPNiLJCQdWeeLFRq33RZySGb14f7t
 J5H1jRVTYb1248XCsPifZA5i64mgjqKqdQTBCC2HLfMKXExaKFb4luGnps5AwyErMT
 ukAE7uopyI5mQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id B552FA0072;
 Wed,  6 May 2020 07:50:30 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 6 May 2020 00:50:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Wed, 6 May 2020 00:50:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvQT2DETU3gDa+/3LH5EKU7vvk9WRULD0nqG8r7n5rHGAgPgi5riAXpaEs2WLOLodj0p4GWTYPGZETAmV0Jd00xApxZoKHHt5H9f/mAhS845unKYGYQBDBgvGaAK+QoOZCzmyrZgbZ4OqcDWAXsjJNZoelu/S7qBDk74frDwGDi0i3Lt8X8IMaywWywdV3VbirP/Wp95L9WsgN15P4BjfYYQqd7MJkT7uJtlINXw5pe5tw7AZd1E9Eag2KvAR56hgMiAAqvkJj+r6sQ5/twkQltI490fbP2xD4keCsmmy4JDxqV8ibx6X6ybYwNP4gcl0HXPbKCV2pRf1zh3NOvrEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5ZzI3oy4cPfZTepzUf+Lp3PttpdxyAK4CTtOAxYucY=;
 b=BlkfMB4vKc162zMCfIRmChHBHBwS80Cynub/9kQhG0J+GH+Gvtb6MPR+HbVcKHMxNuDEZgyp7Vi0b82Jf09hRAbL/hUUOqJOzWYM3gnMR1f5aUOrXKUOI/xZ+lqY5/C+q3FCLlUxhowg3AAEikh2L1s1gbxzlcGeR6fT4FqBPOAv0hRtQDOZM1KAQnrdSx7B4Ge7e3T1612sYEz/EImYrerCIOfDq8EDn4bpQHr5B7jMjnw4Jgc+JdnuhFD3W+Mok1Pxpo7CdkkG1+HK9qeLVtgcfcmsOlXuXnw3i1U5uCma7qv+uudcPNngSWtRnFL51KPC7VULi2wBNuCEDC2xDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5ZzI3oy4cPfZTepzUf+Lp3PttpdxyAK4CTtOAxYucY=;
 b=dWTUDH7/nUejpA8eqwzg2GpLB/7GUONz7EGdy54bPnMCp/lT7Yd52IHRXNxkNjV/F3liBcqJ8uXyGocUJr4fTFRRU33BgyiYhGCFXCkjmDQsWkHWHY11MogvKvdL6m6iXmt2jr+7b4AjVjmOdA5TdxHOgYi0K0SUIYAFFHMEpzg=
Received: from CH2PR12MB3782.namprd12.prod.outlook.com (2603:10b6:610:23::28)
 by CH2PR12MB3703.namprd12.prod.outlook.com (2603:10b6:610:2d::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Wed, 6 May
 2020 07:50:20 +0000
Received: from CH2PR12MB3782.namprd12.prod.outlook.com
 ([fe80::c8ba:1b80:f234:e1c2]) by CH2PR12MB3782.namprd12.prod.outlook.com
 ([fe80::c8ba:1b80:f234:e1c2%2]) with mapi id 15.20.2979.028; Wed, 6 May 2020
 07:50:20 +0000
From: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
To: Joe Perches <joe@perches.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 4/4] MAINTAINERS: Add IPK MIPI DSI Host driver entry
Thread-Topic: [PATCH v3 4/4] MAINTAINERS: Add IPK MIPI DSI Host driver entry
Thread-Index: AQHWHJYQcNtVWX8xzEGtfnV7MAyxz6iNC8KAgA2wx3A=
Date: Wed, 6 May 2020 07:50:20 +0000
Message-ID: <CH2PR12MB3782AD9798BAD67D01473853CBA40@CH2PR12MB3782.namprd12.prod.outlook.com>
References: <cover.1587992776.git.angelo.ribeiro@synopsys.com>
 <abe4ca0b0662c17212fc5107080e949f1d3377c1.1587992776.git.angelo.ribeiro@synopsys.com>
 <afe39d6c755dbc0d79e913b531ed12ed94ec1b13.camel@perches.com>
In-Reply-To: <afe39d6c755dbc0d79e913b531ed12ed94ec1b13.camel@perches.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYW5nZWxvclxh?=
 =?us-ascii?Q?cHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJh?=
 =?us-ascii?Q?MjllMzViXG1zZ3NcbXNnLTNhNjY0NTk1LThmNmUtMTFlYS05ZDczLWZjNzc3?=
 =?us-ascii?Q?NGVlZGMyZVxhbWUtdGVzdFwzYTY2NDU5Ny04ZjZlLTExZWEtOWQ3My1mYzc3?=
 =?us-ascii?Q?NzRlZWRjMmVib2R5LnR4dCIgc3o9IjEzMDUiIHQ9IjEzMjMzMjI1MDE4NzI5?=
 =?us-ascii?Q?NjQxNyIgaD0iNVBJNVpsVk9rQ2JkN2I4SzMwcjdUTHJ4MzE4PSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBQlFKQUFD?=
 =?us-ascii?Q?aDdyMzhlaVBXQVdiM3N5bElPWnF2WnZlektVZzVtcThPQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUhBQUFBQ2tDQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQVFBQkFBQUFIYVd5TkFBQUFBQUFBQUFBQUFBQUFKNEFBQUJtQUdrQWJn?=
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
authentication-results: perches.com; dkim=none (message not signed)
 header.d=none;perches.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [95.136.124.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6d200d1-a899-4646-3c9f-08d7f1922063
x-ms-traffictypediagnostic: CH2PR12MB3703:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB3703E84CC5CE4CDBEE3D71FCCBA40@CH2PR12MB3703.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fqX2D1op+YFx11WS1iENOjp1DdKxS3H52oaPEX7I3JxErmpMaf3szOTampul4T8EsAxOLlhLh/MRthtTGLfxH0B4V71m/dwEA9dV5VoONUT0wCWPW7bUmmjfgB8zGuVs2cQy2KoH2j9oUOmi8wQCyqfouIsXTUDL2cqVEHVQSudu66/qnOCbsibAt25PUswGw2+ifTZiv2rAbuukRw+XPXXLLf+8cDm+QizLNg5vImp0FNmB4W8fl/J5V268WDGT2gT0Ya3oYhgGAzO9jOcYOW07ObuJeR2vWMABeItf6OM/3yA6CWLiPhPrEW4Q7puIPxdSxZ+nRfjoxn2wCVQLXF96F5tNhSNi1VrTWCcp7Z3CL36+nQI1ANxnl4uhGaT8vRdexHmIL118lP2isx1hy2eTPyB7+p29sF1wX8F61hw6YUbaJwgHQ0eVH8OY0EmQncC4b/abQG7eqiWTHYdZFaMoM8lyJXHvMNpFW1b0l7M7hPaqvMdj9xBCJ/yI8p4ngCkg1kTd/U/MPvZH8UsH+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3782.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(346002)(376002)(366004)(396003)(39850400004)(33430700001)(71200400001)(76116006)(66556008)(5660300002)(66946007)(66446008)(66476007)(64756008)(33656002)(2906002)(52536014)(26005)(107886003)(6506007)(186003)(86362001)(7696005)(8676002)(55016002)(9686003)(478600001)(8936002)(4326008)(54906003)(33440700001)(110136005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: KKlXaOk7XBy1dPXxGemAT84tqnfE7vF2RomgJ9pJAHxH8cTSZtHFeRA4p/G5yQADlQHy/sFxgbH4P1Dl7b3BIMk+1guYkkG7vE7GvwetBdtYzGMruTxEf7TTYwOZZM6nhXI2xD8MCC4wD2LMsaUUM0ubpyv1j9XP0+rTRdkZGna0l1NjtxVKmbd1wd5pcNtTE8Iq8SjY4xXi/0y0pSyE0qpe6INeU0X87UCjUAakmEOxZLQdBcViHYXG7BdtlL2cyKjhtAKoxloWjIpwkrELB9qOdr+2qUyAk6SZjEe+jtbQG2v1t1CjlLKOK0H+7tUu9C80SA0/TIvB5z19aZiNRkk14uoPZ+bUmkwMuJ2gjF99PJ6MtM1Ryy4Av0n4NeJrChZXEDQ/zr+S0oHPOCD3R9t2KyWHav2WepfsiUh+azDTWGqbJmaS3P1VaKv9JM+BqBfh080VcAv0Gwu9MVFNHlJQLCyz6gpUvjyHsQqUM32CAclOq8FvStewAElmBIK7MmYJ0d9TtpZ0T4nT9Q2hwKfkfDqlwlPAu8odYcv08doCOmjVlyN1EarOks/al1t76IbmBxf7NAtQjZynPklOsBcRKxzK8P8Wl9SoRK+oFU8xblQxlyPPiRAVOvo6MBz0SwZeeRG20mtjFILn71mQqgyq3G8P1z3hoyNpI7obu67oUORx9RmT5nkWmXLlg07sQB4Gs6XJb6SmyGCEAh+IiFdCDIsdA2skRswMJ1JQrqbC9Jr/DlvXmUeMuqTnf1sYulS86RuyRTECp3/sW8TFnhKYUVxSoC5qkBhUaEbmJX4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d200d1-a899-4646-3c9f-08d7f1922063
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 07:50:20.5829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T07JWX4eEaoJJ2B5/Fea1h6ch9XY2QPN4Ot+M9PR2eB/z9h0aWUwxEkIgcgv46Hp3aLQ+361iRV/yfTPA+rs5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3703
X-OriginatorOrg: synopsys.com
X-Mailman-Approved-At: Thu, 07 May 2020 07:05:09 +0000
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
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, David Airlie <airlied@linux.ie>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joe Perches <joe@perches.com>
Date: Mon, Apr 27, 2020 at 15:45:17

> On Mon, 2020-04-27 at 16:00 +0200, Angelo Ribeiro wrote:
> > Creates entry for Synopsys DesignWare IPK DRM driver and
> > adds myself as maintainer.
> []
> > diff --git a/MAINTAINERS b/MAINTAINERS
> []
> > @@ -5507,6 +5507,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
> >  F:	Documentation/devicetree/bindings/display/ste,mcde.txt
> >  F:	drivers/gpu/drm/mcde/
> >  
> > +DRM DRIVER FOR SYNOPSYS DESIGNWARE IPK
> > +M:	Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> > +L:	dri-devel@lists.freedesktop.org
> > +S:	Maintained
> > +F:	drivers/gpu/drm/ipk/
> > +F:	Documentation/devicetree/bindings/display/ipk/
> > +T:	git git://anongit.freedesktop.org/drm/drm-misc
> 
> There is now a preferred order for the entries in a section.
> 
> Please use:
> 
> DRM DRIVER FOR SYNOPSYS DESIGNWARE IPK
> M:	Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> L:	dri-devel@lists.freedesktop.org>
> S:	Maintained
> T:	git git://anongit.freedesktop.org/drm/drm-misc
> F:	Document
> ation/devicetree/bindings/display/ipk/>
> F:	drivers/gpu/drm/ipk/

Hi Joe,

Thanks for the review I will apply it.

Angelo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
