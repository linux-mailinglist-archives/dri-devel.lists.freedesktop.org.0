Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BD86991D9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 11:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D3F10ED29;
	Thu, 16 Feb 2023 10:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::71c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8A210ED29
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 10:40:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZYqjhb4TU2WYPCFZzYkS0tcHmnRFnmefkNZUBJFRZ5b4XPSvbRT8UTI8Ikl6buMDMpqpDdtjWeGPishsmufve/tUZaNUe7riZiDeWfne2GYn6ebzwsAp+HWB1xOtvPniEnV/O1xVDfFJOz2+ZLuaICU4OhIg1j3rLGP+Avxzy9wqPkjqKuqyekBe8Yb6nzYrfeMGg+W7pLD6qA8dERKJjXOOdA/blfS4UV+Sz8bASs/TQVuOfiEsjLtDPoj5l+dXyx3Z8Y6JdAlWUxuvopSHmU4xgQwJoySuO7SVBjNYKLiB2UgRY6DU5AFjPjFzmLoACR/q9sNk2v+tBsEYfBV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DP88KaDfizz6/S8uUGt+uQ0ErkJRMiSr7EN9z7FsHcg=;
 b=TnF9iHwA1oob9kZQE4NzCwfb7usHOlPdc6DwwUtFpC3yiTv6p5RsP5SwJDR9LvkrDqBSifgVs9k6nKDOJUZXQCtCo6aG3tl962T61fX1rvaxNH0AgpMy9jyxXOwDFS+rc+AuYN0fA3xaT6eZrjvHGd9LFNw4NthRUFVcuSGLbN+l2AqhUuKVOgjTc1Vbt7l+9ykxEVicQFXH+YgIqmg18Fv6cZW1utrrtKJ+8y5mgbAAieqO1ytMyIFJNyXIO4vGkiyBJrKvHLI1Kfz+pkB1HgnraGU9qpEi45c4rvzJFeP/BAWg0A11lmKB7vIepdGqtOZ594bgUmyuuVClSwj4HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DP88KaDfizz6/S8uUGt+uQ0ErkJRMiSr7EN9z7FsHcg=;
 b=Gp8iKwcqCvjos+URwZmiR4uN+cweBA6yyed6+wmSb7jB3/lI18uKEh/Eq7AJ8yNUdT7HgLYmGb6eA6J4Hc3alHP4deAHWfE8xFeACkF+E/SYCKwKq1JAt8HPM/Cai/AogYK1cWQgqUxIrYhkSTFHg9q59qdhCJyQNGMsZ9/5geU510QrdOE0hk9hrAImCy2bzi+M+Xdcq4epub8hZz3axTlxHD9eP3/BNHH1lFx8oE6hKpUpDZxJSeWIaNzVUNyq/4u6xw3jiFpHdh4mQkKGNYoMWYne+mi3SU6/5Cd1fC+cQsXIzqnlWDQFe89Am8UaOMRubphM+lDC1LnClwCsKw==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by AS8PR02MB7237.eurprd02.prod.outlook.com (2603:10a6:20b:3f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 10:40:27 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::46d6:40b:b9:61ca]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::46d6:40b:b9:61ca%6]) with mapi id 15.20.6111.012; Thu, 16 Feb 2023
 10:40:27 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: Oded Gabbay <ogabbay@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 05/27] habanalabs: refactor debugfs init
Thread-Topic: [PATCH 05/27] habanalabs: refactor debugfs init
Thread-Index: AQHZPyLwfixBq/dq3UmLG85Xyqpzaq7RZ7hg
Date: Thu, 16 Feb 2023 10:40:27 +0000
Message-ID: <DU2PR02MB75736DA6574004E5697F2128D2A09@DU2PR02MB7573.eurprd02.prod.outlook.com>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230212204454.2938561-5-ogabbay@kernel.org>
In-Reply-To: <20230212204454.2938561-5-ogabbay@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|AS8PR02MB7237:EE_
x-ms-office365-filtering-correlation-id: 28b0cce9-137e-4598-acce-08db100a37bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CKUhUmqTYgWlr+q8bcPMN3bpQpUAmdgVSBzuLi4sbXTw6Y4lqRsv/aUCQ3k7beqDikCZaiOldWYqhDPH3CoYHWH4SRM0sAuzLdDD+ilozchWhrUIoJv4ABRkwz1eYmXwxyHs+g9aNHONEWkNA2a4OHyjvHXyHv+RivJZgKRIpshxdw8B0GOEi7NhyjnyIPUl4R9SejqBsZ3zTCVcEsv83VTDZzL5MZJeaq+udw0gtXVnZhP3i2PkOw9aJdoOuFXFDHMqMimJuPTubEg3xgNqdApo7q+ZJ72bgdMa7FSLK7qbkCD19C2A48/2gbwyiWO9cAkwhEX0R12IqQwXD/fhutIKvtUgqMm9jdMO1ibYDF3CK78snntm8cYGUJrxWup/e4KzQzRdvGNS9UWzoQBrj4pU1UfTUMlIG42uW6x/ErunHMY8UYqFvyUmc68kQd7ff/Ncyj6lH/d9Ev/1/A3Oh3pXt2K7RIXRwP46YpKxa3V0/vAU3gNH/KMCWuoO3whH6OqkSg9dFheRvc4P1sGD7WsEVcjL+L7x8SyiM88FFUNOYWxWNwOMaiS6jTlh5S23vfhF3yObyhEBa9p56izRhJUqsYc+ticlJfiImUFrx+FWHUy2tLzWHJPgEXXHqP00Les5ld5U2grnTjQMPfsRfErzcOgaND0RacLSPU7dWWB6lf5Qp9y2m14vzzMKQVcAIo2llGNP3RUlhSWpYoT2qQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39850400004)(366004)(136003)(376002)(346002)(396003)(451199018)(8936002)(26005)(9686003)(86362001)(7696005)(33656002)(71200400001)(110136005)(316002)(186003)(558084003)(53546011)(6506007)(2906002)(38100700002)(478600001)(82960400001)(5660300002)(55016003)(66476007)(66946007)(41300700001)(52536014)(76116006)(8676002)(66446008)(64756008)(38070700005)(122000001)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FEyQgYp+ZFB9eOQkn+CTbj/6q0FDQTwMc25ttMltjsSZzNtHfPVW0zNIuidM?=
 =?us-ascii?Q?7J70t+gdovYd6b+QgpZS/fyUfkaA63pUZLG9Lrl9n/dGGLOxjHsBUkc0DZAn?=
 =?us-ascii?Q?wknJ9RvoLPFb8A4uzfMkzsb5Bt/okwO/FjF8aUGuByHnMRjjpDZkxdFguGky?=
 =?us-ascii?Q?WRbfdhxA9gMgI0vXvN7VJD+NSteivB+6HULy7Y4AseeENLCd3ZrfUMwg0CKW?=
 =?us-ascii?Q?RPSYHc3L9RBoH9Ib+BexERRTzK2rRvRa1X47VIMRXcfBPS37pK/divFWb5HG?=
 =?us-ascii?Q?CsOzkYRDUpIU7Mxry7MtlaoshciPebaqvIEaJ4jyzXW0GDkjvqlYufVHV3mS?=
 =?us-ascii?Q?8G4hGuEfYit+I+IthFcobf9RaYznTpjyh35oFs/hqvpLOMClBuHXQ7ewxzlf?=
 =?us-ascii?Q?yB5SbwnBREEzm5TuMcUsEXmNLbuqWoX3itzAT6KN6U9Rbf1djVbawGWiVRbh?=
 =?us-ascii?Q?akCC+oe8PqavpFobukTSZ3BHLBmBjKK1swO6NszhxQvRXD6yi94nQ6Mcujc7?=
 =?us-ascii?Q?lFjGXUR9Fe1ebCgH6ol6G7C1zA0E8vsr1xGmT1LiwwMDv/V9NZWwIbTy1ZRn?=
 =?us-ascii?Q?O45AMFnA/s5ITwvqgdVoyb8FXHKkteNw/n0op//P9+jlh9Ku/1rIV/H3eQkJ?=
 =?us-ascii?Q?mfYkZqnqAmbw6ibqFyDuVStrJ/V6Jzm7C1SR0R4XVmpLZQ5bLYMSE5LvCidi?=
 =?us-ascii?Q?uFl43de5OBYQ4OWysD3Z7arCe2QpURDMYeOUckX4bpiwPyrBFbXGkWFwvq9L?=
 =?us-ascii?Q?G/KNsuJYXT9f7yU8oIpuDbvPXm/rk91YOk3m/nKmg7fvF2lTiBOMWILKqegr?=
 =?us-ascii?Q?TdVnT7+/17hqF1IwiReHfijh+ti2ojz3V9iiVVlAXSPm3wSTTeE2UqCDh1EZ?=
 =?us-ascii?Q?L8Bvrhwf8MKtGG4qcpdfr0d6MsBjqfQcAgMk29UFsxanL9CzfrvxHuUIwO3a?=
 =?us-ascii?Q?Tn+GOluu44Co4pxgtxPzLqxEaXVnuPpULaDdw9QPibXTNi8OQa39QRgWLHku?=
 =?us-ascii?Q?b/I5v5JfEU+XZRtCzfTIkFRVJ1B9t4HJQ2owyzdlyU/QSy62QiXn4PtrPGDD?=
 =?us-ascii?Q?lNzBDFGkdKlZmSjew7kZge/SGmvASxyYMTvMw0xkZ2GBB0diT/zbZdp1fz0S?=
 =?us-ascii?Q?bIIfVjWJtVwllK3reID3LAEFZ0oMgM8OHQKyJ2PHwLo6K0LQEqcZ76jGdQky?=
 =?us-ascii?Q?Bw34vBrVlfYNNRE5A5jsX2ntN9fDNf0BgCAqrHogROEyXNAcGvnGyBDQtKI9?=
 =?us-ascii?Q?giea5fs+4RWYinzCiT4JrOYchIidzpZY7Sb94eoLiTZcZhm6Ib2VEgv95Fns?=
 =?us-ascii?Q?+Fle88RFlxFhmzyG0QeUiC4zXBEJ6mDN0fkoi3IKayrXOtRKx83iVKL+4PiA?=
 =?us-ascii?Q?iT9hHgXrWXQmAyjAze6l9VZHiJN65f6GHigS42/pbYTZwaCcy7oxxe972wkM?=
 =?us-ascii?Q?8IVKFe6rVrKP9Gpbq1hEKkozEDZ4o1YTQmWKLSnU7AdFuhgNP7OmXAR1tCjK?=
 =?us-ascii?Q?PSBxzAXpdTZw7R61Mgm1iIeHITTb4sjVVGkShY4UFu4N47Mk/45tRdWtAevF?=
 =?us-ascii?Q?oG5+suzov3SbYOvUfW0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b0cce9-137e-4598-acce-08db100a37bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 10:40:27.3770 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g2NKRHfpluZFievz5QWdK7V2Jaf/rOlLgBaM76KYOh3xYN9mc0bY/+eCh6vPxmhZuOmZGON//sHYFYY1/rDQpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7237
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 12, 2023 at 22:45 Oded Gabbay <ogabbay@kernel.org> wrote:
> Make it easier to later add support for accel device.
>=20
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>

Reviewed-by: Tomer Tayar <ttayar@habana.ai>
