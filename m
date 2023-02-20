Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BC769D12F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 17:16:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3560010E18C;
	Mon, 20 Feb 2023 16:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2095.outbound.protection.outlook.com [40.107.6.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA62210E18C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 16:16:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FaoMMvVJ517JGi08ahFsUtQNboWbVV4PfDjYxbOTt2URICruq19rpGrZBH1uOhvwguGhWYF565H9xQmoHvWCpdcKzFoIx9zYEf5ni80AaFzP95za9lsX3s78vtztAievHOaBGN7WJzyty6RmwiZSaGhO2bU2QeAylMrsSKg5fF5vwinEIM14eFdVeP16Et9OL4eco3bbMEwHzOcUYFga/6wKJCfM7ZrcM9eeMW6Rh3flKdmlhUAcqT+Gly5SHSvSp6ZpQObM6mzTsdZQTzdBj/zfNM3TzBHMEVgxra/nHWvdddDZ/yiMNlsoHmfTCFTmvWsd0PBHDr+SkU8RoHku0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkZ+F5BcXfLK3IoUkskPC001pdv9AHA7bYXvdOT9m6w=;
 b=UVbkDmTZsDAPkmDxcAe85zSNL94mvyvaBLrXK8XtcH8sJsFkoBguWEdk4Bv0PuSjz9+A/QJpywA5zoLNJj80yXCWpq25oo7t3EL/JoVShhOCQAvqUiCQAUMpqmstud9HUba1eJHFYVToARI2oeiDyJR8TkFMMpg/JYo6eKVLLnoTxwW1KHRDokQNZ4hCGmceoNF1f8bMnHpzBsTEOXSdwrTtPkrHT0nlayc3YwK3AHGtAPtt388T4m+F0oeR97b5HCrSSpALplMj5QmNd8hEknJ1JbTKH6RsUlS6QTxb5lDNALSLZZmnsixGDUIcToEy5wlkzBF7MDKqaHOjq6pZcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkZ+F5BcXfLK3IoUkskPC001pdv9AHA7bYXvdOT9m6w=;
 b=MYMpB4aY53YsT0Dbnd3CKhBZqH5ENll9t6KZVXhou7yeskLifUhGAfJo0jhLJK1zux9ggnUEHDnpsksG/AAtmZI9zSJ+4zA/UPHlcRBAHqoM/7b5RoYBX5GL4/2fwK+6YAdkmQCJhN8aYwFUpQnED/s4POWVFTZc4M1fkLd1fvFEoF0t+v8OCG0TJ8IvSQ3AjFYefIiIn8swKFMi+wp3/NhpXowv/3/SC85N5BddqsTQjHLdWFHiF/U30tVGAHvp4GiZGvIWbZXJDLIbDVt2lDWbYKT4ae0iKBl2Io5OAZ16/8gzBMW5I+GTsOg5dUjaS2bk6W+2rzt7F7ce+djirQ==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by DU0PR02MB9588.eurprd02.prod.outlook.com (2603:10a6:10:420::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 16:16:26 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::46d6:40b:b9:61ca]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::46d6:40b:b9:61ca%9]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 16:16:26 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: RE: [PATCH 08/27] habanalabs: add info when FD released while device
 still in use
Thread-Topic: [PATCH 08/27] habanalabs: add info when FD released while device
 still in use
Thread-Index: AQHZPyLsTfgvgpc53EmXP2FILg7rhK7RhU+AgAAgbQCAAAwCgIABTzNggAUIFICAAAT00A==
Date: Mon, 20 Feb 2023 16:16:26 +0000
Message-ID: <DU2PR02MB75739E8E32D26DC5A3C674A6D2A49@DU2PR02MB7573.eurprd02.prod.outlook.com>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230212204454.2938561-8-ogabbay@kernel.org>
 <20230216122545.GE2849548@linux.intel.com>
 <CAFCwf13c6T-S2MgwmWJkrQTwdXYDGMK+GG8ZVUjPipsXNrW_ZQ@mail.gmail.com>
 <20230216150447.GJ2849548@linux.intel.com>
 <DU2PR02MB75734395957E6DC59D387B28D2A19@DU2PR02MB7573.eurprd02.prod.outlook.com>
 <20230220155443.GF2862577@linux.intel.com>
In-Reply-To: <20230220155443.GF2862577@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|DU0PR02MB9588:EE_
x-ms-office365-filtering-correlation-id: 02c4cb17-fab1-4520-ae22-08db135dd0ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HEZBWTyLZIE8Ap4qj0xGBpAzcAbzBPzgE8jEaRqYMnAEHBC6B/8UWqr7AqDF1Od9cvxTrSIND3Bw87PcIG5O7txFnc5VqEw6zDl5DmccGbwMt/S8luTAWtyD/Q8CfJcI9w2IBhwP4G1iRCGye9JwP7LkcoVmnN9I98z1Zb2f9gG4236/PqviTrauAAvafIUAagZFyhPkOd2BkivhPoxSpGpykHx5Fa9ToP07qgyVbIjM5pDDs85i7o9IpjUq8ViNggiZXVzsUPVeUw0Rx5DdjHqVWhtpsZ27YB6ezdUKUYl9xjlVOq1rLIMrbh/ET6h+JcK+8oHrfq4L+Fc6pV30ZEwwz+vCHC0IoirEGERRRJwKME8hvRUYa9RDQa4AhfOtyMvsR9hFJW/McQEbjwexD2ixXffvyucKKs+QBlQTEm2lLd3/tG281qGCHmeV1kCFRXuNUygLWjAjtP4HaN4QTNCsD4aqD0q6RAAPWpSCAYhNQt11cktA7QuCGG6dF9b13p4qIF84/1iMT0+R8qC6TmV8ESGaSJGiXZlz9+SrWWPm2Fhh3cIgleikKI3/pC5NmQszBuiZT2OPVp6JjLUsx865nIUa/Ca0ykT3QCvTi5BvZ7kM1Exyb/GebTUA1jh4rxq86QxT0m5Mr3Hta613uxDfc3cB61NiihI5izekugU8aTy+vY1IE9sJhI9QoAXK2YJr8Se+K8Wcfx3xB4lq5Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(346002)(39850400004)(366004)(376002)(451199018)(478600001)(54906003)(71200400001)(4744005)(82960400001)(38100700002)(86362001)(122000001)(33656002)(2906002)(38070700005)(316002)(41300700001)(5660300002)(52536014)(55016003)(66476007)(4326008)(8936002)(6916009)(8676002)(66446008)(66556008)(64756008)(66946007)(76116006)(26005)(186003)(53546011)(6506007)(7696005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HvTuOde1bp3adDlv1tSbFs2UfxBN/5Rcgpke98lVbMIs0OMINX2j/2zAof3j?=
 =?us-ascii?Q?M188Wk6bne5m+ucmEcZ0UZG1BTZka2PBmitYdkOs93EFtjXp8h3I6qFsoGYH?=
 =?us-ascii?Q?rrvUpDtWDS0y5DH5NbtPTeKFkFHB5vjYlnS9zbJ3jCA4QHYZUJJLrVbo+mm0?=
 =?us-ascii?Q?0qhi069ZHYGhLnOkMATOxqI5znuVmz2Gh9Il6YL1XKmE2+KKeccj7A/SL8n/?=
 =?us-ascii?Q?XCvJmpxan+RAQxnVhm4SxlRoIAT+DEWm4oChxhojYAyFgKUPB1l5EcqhyM6I?=
 =?us-ascii?Q?0OYvggry4np+SI9pTRQZhJs9X6TrdxjcqtcGQw54j/HeUwpOmsbXwgJL0qZR?=
 =?us-ascii?Q?UW+IV2CKGbtgE/By0W3CKsD6KT2UWd0R4aMtvZ7vF9W6lLyZLnbzgr7sMoWK?=
 =?us-ascii?Q?UpDnHrG7n+3fQsVCXi4rWx7MoqeAFAu/2RmSEY8cCitYwiAj6ByaKfzBMsRt?=
 =?us-ascii?Q?pKldD0TAljbfwRCkEN7OhyBu+C1/eqDQTsuoisE456j6pz2iWHDIAYpN/upm?=
 =?us-ascii?Q?TByl0tOV8+rcLgnx51RU3Qi8HPb9Qm1opbP+ocVR/tnwpbVh/jhD4CXhnZUi?=
 =?us-ascii?Q?PhxEujvEB3SoiWA5XhCZBfNZTuR3LuA3Us+XzPeJDenPXQujdRzrHgkZsDcy?=
 =?us-ascii?Q?exH2zkb9fjwS3dKiTBMSaVUEK4lgnfrwzFuDbALCIMWH7DiNl4jESlIeTD3N?=
 =?us-ascii?Q?RIWdNay7yL6/g6klCmmmrkP+pPrHDMh/xPw18xCyfHzMxXT3m4EbezbPpt7E?=
 =?us-ascii?Q?2sAwt/I2+lNNG02eTV6kFki6VyA3RT+ZGZUE+HY+GeumXqWRNygG4tesnwSg?=
 =?us-ascii?Q?Mlsudvo6b2m9RAqXfL8iVLu/hGyRywA0BuxUGQYildTv/usohtMOZUk5fDQK?=
 =?us-ascii?Q?BQR3TGSN3+wtLs9mVjLHaqYRg0KSsPbRE6S5OPu/9q0RRNRiLlfG/RLwTr+3?=
 =?us-ascii?Q?pqVsQcsDWH/3ePlCXoiayGxnNG+BTCQQ5V5uW9QtV3m+102QHcaFDk126pLJ?=
 =?us-ascii?Q?uHni6o9gLK3fD4IFh8tucVw49/wYudOtL0DDMeUOxic3VRV9oOlF8GDRJO2o?=
 =?us-ascii?Q?J7zikTO4N61hNax4iaishkso38XsVM5Esl6aVgXtoPFsydPA0lJFUTlqPhJe?=
 =?us-ascii?Q?eZ/iiD4+wEEF+mUzCTZ3xbgHiI4p9bvypZC176hbYhqTx/sI+BFyslqdqS3I?=
 =?us-ascii?Q?dimvlZxm+U54/Nsb49jOz7aXujo8nziBFfS6oluw2FW8Vc+QiAzIrFbW27dD?=
 =?us-ascii?Q?YnM7Mm+zq86OssaA8i/EJjBi5ou/7ZMfqa5XGwZDFzCnHTJUD6lSw01Ch5bx?=
 =?us-ascii?Q?li7O+/GcdOlgri1WEMvU3IihYFtjUP9IjfB7ZTIbdjYRQPLE91ZfxuSMy98Q?=
 =?us-ascii?Q?2jd55a8qTXnXoHsKYTvSt9WhK/LxkYjAwDlT27uNDAv7bDNpYqca73AHncAK?=
 =?us-ascii?Q?l7sY7bWZ9Z3FLdR1R+IKLnvqsVxgDr6IsyFSxKop7zVi04m7XxYXQ/OYbAnj?=
 =?us-ascii?Q?ttbvSv7oJ/+8QTf61oJhiLWVZ14uJnm+bIl7hNBc0D1+zi6T68gQTk06sMMb?=
 =?us-ascii?Q?xojDONjn0+ReaYMwhvQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c4cb17-fab1-4520-ae22-08db135dd0ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2023 16:16:26.0490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L65HtKv9MkF7l4WJ9ggDLcGXc4XmiUKIrlbqFVQVQ+ISRLNplCZfkijwNv/qCc41L15QCxXk8lsMptQEzb3V1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9588
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2023 at 17:55 Stanislaw Gruszka <stanislaw.gruszka@linux.in=
tel.com> wrote:
> On Fri, Feb 17, 2023 at 11:34:39AM +0000, Tomer Tayar wrote:
>  >
> > > Ok, just place replace compose_device_in_use_info() with snprintf().
> > > I don't think you need custom implementation of snprintf().
> >
> > compose_device_in_use_info() was added to handle in a single place the
> snprintf() return value and the buffer pointer moving.
> > However, you are correct and it is too much here, as the local buffer s=
ize is set
> with a value that should be enough for max possible print.
> > We will remove compose_device_in_use_info() and use snprintf() directly=
.
>=20
> Actually the safer version would be scnprintf() since for that function
> return value could not be bigger than passed len. Usage then could be
> as simple as:
>=20
> n +=3D scnprintf(buf + n, len - n, ...);
> n +=3D scnprintf(buf + n, len - n, ...);
>=20
> Regards
> Stanislaw

Sure, we will use it, thanks!=20
