Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E5B11F214
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDE16E34C;
	Sat, 14 Dec 2019 14:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC62D6E314
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 10:21:34 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4EF44C010F;
 Fri, 13 Dec 2019 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1576232494; bh=jIj4ZvBy8gKHvyCtbn8MPXogs7QJVqLw5kptyVITQzM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=eyfzscehW5uGTgD/abmQ/y2fDk+gVBHVUC5MHAotgB8AXKY33SAZh9nLxJEZRE+SQ
 edzVTuul46/7wGcs1RrfaDv30CwTUEYh6nie4Dj1vEGms5VPs1+Xr7rHz5IBhjoiH2
 /yBjl1TfYD9fi9y7vg5phMRiyK7CVyd4wWQV66IGwxrqwRxtbK30b6ykxKRXAwhpHh
 RiPJzOK+f1wn3Z6Moi3W6km/kzC1+Uo1UTdUlM1IxAv7Sc92NHIGp8KjTSAYsG/Bcd
 DqjQ512sPt+ozp6XQ+StSau9OatvK2cefaaW+71GxKmKvecfKeWxcYQtOVKWb9YJE2
 foHllfyjNCvfw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id D0CEFA0067;
 Fri, 13 Dec 2019 10:21:29 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 13 Dec 2019 02:20:41 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 13 Dec 2019 02:20:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHmd/u0onbE7Imo5DfmBKO3/tKa4MhwbZHvLFocW5baeAAIx8BreFnfNCv8Mnof7D/Bv5LBWyJ5e/dwjDjVvCS2MlCu/1gIwK8hg68en3haKCgCsSqCHElzMmvMdg5tBhic6om9ZCj+47u6YMg34uWic1tDl2imuETLhmcuP/vBzWJvMlEg3wGKv8kHK+mhzjPQNHubHRrbOF9e2LA5HDBq/yw6IUER8G55+HpbCzw8vmG3+3ByB7GEHU0rnijI3I8GdYrHlsaVoCFf/8qVBgLDVRQ6ahUNARuAXtWWAHIDLS5d8zcs62w2Md+YeVKQTi+mhxIvg5N5RduC/1Np/cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkUyXz4ueE2i7MwI0ny7KDtbySm5vRoDy0lzq2Vkabg=;
 b=Z8C74N6PGADkrY301F/7fkKlCqMTCjbtB4dJdncDLNvAvGbl+ElpcAh0+Gg6kjhXJI4kDGEeGMIkk1HaGOh4Rw8e3NkNDXWsjbGjNzyWL4qcuz5dnXe6pu8sqEuWF+bJrcw0tLIPRQcr+Fe7v3sKSet9eGPtOFp9DT76GOd4m1P/ziJkLHSE3srx0ie0N2+QZR2CwDZM/4mHRHWVCiDTniUA0N63G3PVLFDLfD0dV+m56kMaN7UjR6urTfjupp+JSaCAmelO+g/W2VcTK3fvJt9KhGpzpI4ueSZzfKyOZdDybfn5Fich9yEu5NM1D7RvBLiMc7Jd6cYZ4jG/AktiMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkUyXz4ueE2i7MwI0ny7KDtbySm5vRoDy0lzq2Vkabg=;
 b=owxgMs3AtnI3g4/IIqr/f1sW0j7Hzw2tECrGYwr2vWNtakIvkM9LwzwzB9/FT1G4iRNrG1LG87o2X6xb38AKmpoIp5QFax52C7ts4f2aPNhTVBDP00AdrgZVicQ418jbYFSJ4hRkJLZbSDh3G0q9d0RAOclxF0shvrt97us7oN4=
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com (10.172.78.14) by
 CY4PR1201MB2486.namprd12.prod.outlook.com (10.172.119.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Fri, 13 Dec 2019 10:20:40 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::3977:e2ba:ce57:f79a]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::3977:e2ba:ce57:f79a%5]) with mapi id 15.20.2516.018; Fri, 13 Dec 2019
 10:20:40 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [GIT PULL] drm/arc: Yet another set of minor fixes
Thread-Topic: [GIT PULL] drm/arc: Yet another set of minor fixes
Thread-Index: AdWk9uGIdHrNqX0yQ6SZMMOjZA+q3QAE3eIAAAaVHaAAAceXAAMcvqxg
Date: Fri, 13 Dec 2019 10:20:39 +0000
Message-ID: <CY4PR1201MB0120529194B092E2C2ACD77EA1540@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <CY4PR1201MB012062AAE1D2223BEF3AB204A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <20191127100634.GE29965@phenom.ffwll.local>
 <CY4PR1201MB01201760E81B40589D182E08A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <CAKMK7uHSm6oKUUDxQxPkOJMj4Ut6+B1dFdZGoauNjrT_o841sA@mail.gmail.com>
In-Reply-To: <CAKMK7uHSm6oKUUDxQxPkOJMj4Ut6+B1dFdZGoauNjrT_o841sA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWJyb2RraW5c?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy0zNDRmZjA0MC0xZDkyLTExZWEtYmZmMi04OGIx?=
 =?us-ascii?Q?MTFjZGUyMTdcYW1lLXRlc3RcMzQ0ZmYwNDItMWQ5Mi0xMWVhLWJmZjItODhi?=
 =?us-ascii?Q?MTExY2RlMjE3Ym9keS50eHQiIHN6PSIxNjYwIiB0PSIxMzIyMDcwNjAzNzg0?=
 =?us-ascii?Q?ODI3MDQiIGg9IlJPODNPTlZEOFd4cUV4N0ZoVzhpdEZmU2hvMD0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUJRSkFB?=
 =?us-ascii?Q?QVFlS2oybnJIVkFTcE1DbXdwb09nY0trd0tiQ21nNkJ3T0FBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQUNrQ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBUlgyazFBQUFBQUFBQUFBQUFBQUFBSjRBQUFCbUFHa0Fi?=
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
x-ms-office365-filtering-correlation-id: 9dfb32fb-3851-4b14-5036-08d77fb61a68
x-ms-traffictypediagnostic: CY4PR1201MB2486:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB248618715D7B9E0A0136DFFCA1540@CY4PR1201MB2486.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 0250B840C1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(376002)(366004)(39860400002)(136003)(51914003)(189003)(199004)(5660300002)(316002)(4326008)(52536014)(478600001)(54906003)(8676002)(66946007)(7696005)(86362001)(66476007)(66446008)(4001150100001)(2906002)(33656002)(66556008)(64756008)(8936002)(6506007)(76116006)(26005)(6916009)(9686003)(81156014)(81166006)(71200400001)(186003)(55016002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1201MB2486;
 H:CY4PR1201MB0120.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h7+nDTQhEcawBh5Pcf4l+XaP55GNL8pl7UcZsHxFh28ebaboU4v2zslTm6wcyFRYPquDwG1AQ3GEHLzaWFCUIBjhkjjzr/hLV8itTGPVK4ohELqPsyWsoVSPUT6niZ9e3mMpgfE+AooVzzfTvLSiDowmj/bCv7eu6V+95R3a5NcZ6iZR0hWjl3d9GTCw33I7ir6ZCJBUw/wC9Ipe9025h+xfRxoKEINuUZkizEvGrzpDcYL0qSeu/skza6dGmhT0K/b2oVe3vs3U5oDh8ZVmjrYg8VLTnSpwZjs/ZaJuXpQ3Cpd/dEB28prFldBhS21ICYiRKwVbGsf6KtJ0MTMmwpy2ZbN5HX5Yt/x65oRUDPRJvWR7dMARcrbpVpqnEsadPcpShv3uHmQtMTvyJaltHVa6ruoO3Z+maqzNAdIEEmmXEEYSpSwrYqLerAzS8P8gOHbzSJqRZZ8/IHmDJP7x0cyxFsHBj4/IXVaUftf3t1cfagFizNiJp8qNEJaecjrp
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dfb32fb-3851-4b14-5036-08d77fb61a68
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2019 10:20:39.8174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WgECe3HeyLzL2Iml81PwQZz4cjtRh05qvsFM1EGBCi9NZxOZSD0d5FOrqk/nfBWjoX20+5O5cOGVgOTuBC4a4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2486
X-OriginatorOrg: synopsys.com
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: David Airlie <airlied@linux.ie>, arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

[snip]

> > Thanks for the pointers
> >
> > > Or respin this one, but these small pulls have a habit of occasionally
> > > getting lost :-/
> >
> > Well I'd better re-spin this, see below.
> >
> > The following changes since commit acc61b8929365e63a3e8c8c8913177795aa45594:
> >
> >   Merge tag 'drm-next-5.5-2019-11-22' of git://people.freedesktop.org/~agd5f/linux into drm-next
> (2019-11-26 08:40:23 +1000)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:abrodkin/linux.git tags/arcpgu-updates-2019.11.27
> >
> > for you to fetch changes up to 9c2acc26c899aa12ad009dff10a5573ef769a7fd:
> >
> >   DRM: ARC: PGU: add ARGB8888 format to supported format list (2019-11-27 16:43:39 +0300)
> >
> > ----------------------------------------------------------------
> > Clean-up and fixes for FourCC handling in ARC PGU.
> >
> > ----------------------------------------------------------------
> > Eugeniy Paltsev (4):
> >       DRM: ARC: PGU: fix framebuffer format switching
> >       DRM: ARC: PGU: cleanup supported format list code
> >       DRM: ARC: PGU: replace unsupported by HW RGB888 format by XRGB888
> >       DRM: ARC: PGU: add ARGB8888 format to supported format list
> >
> >  drivers/gpu/drm/arc/arcpgu_crtc.c | 36 ++++++++++++++++++------------------
> >  drivers/gpu/drm/arc/arcpgu_regs.h |  2 +-
> >  2 files changed, 19 insertions(+), 19 deletions(-)

Not sure if you noticed re-spin of my pull-request in the previous message.
Do you want me to send it in a separate email?

-Alexey
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
