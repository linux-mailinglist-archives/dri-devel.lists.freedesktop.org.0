Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A19FC54E55
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 01:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBCC10E11F;
	Thu, 13 Nov 2025 00:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="phfBaia5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF8F10E74F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 15:08:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IuAkTwIE0z3wnI970vwxZ2gC94GI0RH883u1mlP50eUWkVcYAC4vcQOztIK+DjAHRUECPTTKUpuWKmvWndK2DL1WWoj18c+1w6NIQt4pVDCfB9iKDaJsgscZT9odynmVwcSOxTw/XbWpnPoP5zQtpX0yrI/MCLgw5PcNV8EveNlFzH4A+ko4vaXpxifjK1ANctNDTO+T6wBKKhFeaqL01dSmkZTXy6GRib41vK6a+4vV7KRVPNNXsiJaF72KfPGYRh9gflU1W4rv+Weu9Qw8QMIsmKGAXiucEPkQ6POsv2OLWxBvenPTR9QTWNfhJQvfbYYkU1IH0FbJmrDUXBvPPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDB6D4Pe8EgbXaAwZnv6AO/xZfcfZxw9W4KgGn+AhNY=;
 b=q/TWNTUCk6momIWiQSBXN8D5et2roSpJ9c3tSzu53QZQJ6Y6WN9s9tcE41Ocn/7ruej66LNIkVhe30PDnnTTwLiieAPzA8fftufOIgtbPFuDSFfHDg6f3WhLwOaZZfRKe0YG7ukNH23yRyQoyAm33acsgppTpjqso+runFb2HwMx6vB2PEtV8jyfXsqLeVBDF+yBe+XoQyLO0teBESTklZX5PIDUewFer0BCxesrx5pylkCAAmM3LcBsiHHs3gVEKULCT8Cc2PmZtkkMpPhdm5NGcTWhyyir+v1xoTJyFGEzwrqAIXDW6m84aBdzTg1IDb2C/L0VL3di2MnoXhVqYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDB6D4Pe8EgbXaAwZnv6AO/xZfcfZxw9W4KgGn+AhNY=;
 b=phfBaia5WOZ1mrKxnep6shUWo+hZwYa+NqvN+60lfxqyzn6D+jz5cXSoynKIZhD8GHAnePFQtRkdsub14+WF/NHuW9VXVLcTjGxfHPVHdlItI/unBA/UFuhqWyWz1J35762waABkkbZJSSSGrSBduoKBD/rTnwflrftpnra//FY=
Received: from AS2PR02MB8915.eurprd02.prod.outlook.com (2603:10a6:20b:546::12)
 by GV2PR02MB11420.eurprd02.prod.outlook.com (2603:10a6:150:2a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 12 Nov
 2025 15:08:08 +0000
Received: from AS2PR02MB8915.eurprd02.prod.outlook.com
 ([fe80::9e01:907d:ac0a:6a7b]) by AS2PR02MB8915.eurprd02.prod.outlook.com
 ([fe80::9e01:907d:ac0a:6a7b%7]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 15:08:08 +0000
From: Lars Rask <Lars.Rask@axis.com>
To: "david@lechnology.com" <david@lechnology.com>,
 "marcus.folkesson@gmail.com" <marcus.folkesson@gmail.com>,
 "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "agx@sigxcpu.org"
 <agx@sigxcpu.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kernel
 <Kernel@axis.com>, Amir Dawd Seid <Amir.Seid@axis.com>, Johan Adolfsson
 <Johan.Adolfsson@axis.com>, Daniel Larsson Persson
 <Daniel.Larsson.Persson@axis.com>
Subject: [RFC] What to base new driver for Raystar RDX0063 display panel using
 Sitronix ST75156 chip on?
Thread-Topic: [RFC] What to base new driver for Raystar RDX0063 display panel
 using Sitronix ST75156 chip on?
Thread-Index: AQHcU+UycmIuve61UUec2cz0KJbIXA==
Date: Wed, 12 Nov 2025 15:08:08 +0000
Message-ID: <AS2PR02MB89157A26C4CFF62811208A739FCCA@AS2PR02MB8915.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR02MB8915:EE_|GV2PR02MB11420:EE_
x-ms-office365-filtering-correlation-id: dedab4aa-58f1-4bdb-5df5-08de21fd49d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?9wzt/p9udVz5VONtt0HcjsqkmgL3HrZptgfa5uLJg6mpDHtA+pg+mJ5vkN?=
 =?iso-8859-1?Q?oyMA6LAvG/UiWA/zSY9tjb8Q10nswNT96DUooMXFjFAwgv929UjDAgaoAx?=
 =?iso-8859-1?Q?7FJ/Q+jTvJTD+5DzyT7uA23NAlwUFt5d3UaYGzZAWa1IG3ByrRzEeXq7ot?=
 =?iso-8859-1?Q?WBmxcZTs4jqmEsRzrs53hqxhAWLIWsmmAjVgVNEFQHmMWH+QAoPyxFvAPd?=
 =?iso-8859-1?Q?QyNhFr8jXoKpghJiPIP5FFoxWLOqhalF4WsdBkIXDHhCQH2VV47n2IAWqD?=
 =?iso-8859-1?Q?1iivEw9/wXtnmGGFlDdMI1Kt96iz0eRlTINdUDvPgL957AOfHw+X3H4BrS?=
 =?iso-8859-1?Q?dngPIzKYAcqfQ+9mxapwtuUkBHlhJkpGGZyUwEoauMJrgPWmz28nDXmbcZ?=
 =?iso-8859-1?Q?PTQWS3egT6KETD4OAw83b3c2yok5XiQQUVy2OnKTGUiaV/yqqXDexUahr/?=
 =?iso-8859-1?Q?czSFruwSKbYgBfZoMf7Fkn+UrHsf50lzPDTlC9XNU45zyjxvII4vm8t87a?=
 =?iso-8859-1?Q?zTAsQb1MtanOWOn5cAXuRGyBw0WylPfakW0he3K80JOkoXbEUqZzqQnsqZ?=
 =?iso-8859-1?Q?VqtccYD31TdJH/AY8ovLnR6lF7SmuIXspXgk44U3DuFJQG/NaC48NYcWdg?=
 =?iso-8859-1?Q?c821VPxTgnQOqGX6KClCxKFZz+6AP7WvZDhzNN6nhK3PDp7p3e3MhQLBK8?=
 =?iso-8859-1?Q?ZZhc3OMW/ZjKQYm8EyMJhCOK905eBnLwxfwDONJh1TUpVGXrTBT32WaOC6?=
 =?iso-8859-1?Q?xNvPmP/L+eqqb2uQH4Z2EBFL5/rR020oZYGkD4wsj9ooJ/N6xdM5bGtlpD?=
 =?iso-8859-1?Q?WjULC6JhauHcm6MmO1GA+5ui//rs/1BpOiCfqmcVosLMBW9yZMvKjRRlPP?=
 =?iso-8859-1?Q?qaYrrIsVqownPV5Gg+KaGPEip2VjjQ47TQm17afyBm9ZmFQ5HJFJns8uZe?=
 =?iso-8859-1?Q?NhA9/6JCTyAy1dTOpBjJX1gfHpwBpxQxAJVbgD7VqgedisKyf04RrMEPsA?=
 =?iso-8859-1?Q?7fZwcvmTalbituvZUZ7LI1lizmunllw2/8fVgRzySKntryVCMJLmCEsmPx?=
 =?iso-8859-1?Q?GOvM+1btFR8XFK8b2pgwacWwcWm3u6baAxXEmEZVe41h3VHw9ISx0Ga4Vh?=
 =?iso-8859-1?Q?urtWoIXkXVw6/AEN1EBWmSotPY7yCTIs2p9nGYTl452ShHbgxbKKLwMkHD?=
 =?iso-8859-1?Q?TamF9YduPx69ly3yauL1YjU8HqsR/aqgg1w5cxrgxSTV0i7eoqxuxCZwD1?=
 =?iso-8859-1?Q?PINnQi5hhmZxb2hn8t4MpuYSGtHVB6ysYIS5h7JKEJ3ZBI/7y/HeYqEZzi?=
 =?iso-8859-1?Q?9YkmGVtWYEaqmEJNS6AhIbye9/3z1RAceYIs5qScU3QXS6H83GZ1Ov3Rf6?=
 =?iso-8859-1?Q?aUTav7ZasDIwbI7v9XG457GFpA+GW+2oVyx6fTzbOo3athHNGXBh2Xw746?=
 =?iso-8859-1?Q?HNMtcA1UN0XpcBhfZsJv8H9YyE1DwWlMGV4crh0u/BwRBDZ1V+1+Dc2cT3?=
 =?iso-8859-1?Q?apZcm6d0fK0mHcjJ7YWwwkt5o+3p1QJlAWXnpJRCG0bg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS2PR02MB8915.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?htAKkX6+rB8yDjcb0c8OhmWQYDMG3rvVaIYTl1JdmtPC7cwx7N5TShrqNv?=
 =?iso-8859-1?Q?L4V5WcTFCrdwie/i7TB0fkj/VKX4tl/6yQHeM93b49nU1AwpTq0ixRxvLV?=
 =?iso-8859-1?Q?08GIYonukj3faf0mUd0+RDhshQBW7xvVCDF/nzK5QqgKhi4o9t41r9SheE?=
 =?iso-8859-1?Q?JOe/xwM+4hrAJ/CoMqDcyb7DXGMGirWZH+asSqccpf0RfkovdH44dMwryp?=
 =?iso-8859-1?Q?tS2zSdEADU+aOy5DHDEmVbb4Yts/vMXRb9ijuDMJkdIDnsWHe9bslDvOJW?=
 =?iso-8859-1?Q?sYwG9Mo7ICyplriOvcnzDj3qpXSycJH78VVR9ailTt5FYbnf7yQOC7bEsu?=
 =?iso-8859-1?Q?d0A+wEek+s7S1+CVA/oQ0IODYZi34pguavgbtKMTO2cxODUl4qnU+A3byr?=
 =?iso-8859-1?Q?ISwtG7tjB1a10IytSNt7hfSkYlBmm2voefsPWLQAFkbdV2lfMTuTUbkCzf?=
 =?iso-8859-1?Q?svHRWgd7U8gfUkxElUXYd/rDfDQVdhOxcbTPy4xwVA3yTmhoW+t0UcxUhq?=
 =?iso-8859-1?Q?zmb7pc2jo55CZr3GiFGZXvBg90kZgdnEEFQ8VscgEt1RW5Rag7i7yRfUI6?=
 =?iso-8859-1?Q?oDx254P9e9o4MtWCHxzE3mUpdMUxyRKmhF+LFMe05JCSFam5yRHRUFrJkc?=
 =?iso-8859-1?Q?prFFRqp+k8qmYeMe4AzgWypGAFbiuhHzYGKMgCRTyVPaRSGGi4Gqj9XUuG?=
 =?iso-8859-1?Q?m427ZSqvY4F4sDx05XPsuvCrrX3Y8C2j4VoRT1G2s96qdvRTxxSk355zsY?=
 =?iso-8859-1?Q?FVOu+NNjorU250r3X8SNE/7xgseH6D1qwvLLz8aFj1llMGR8v7KN6OsO+s?=
 =?iso-8859-1?Q?2pJpzdCz7CtFcxzXjzOcaoZw2kO4PeCtLiTIzWDu3aNwkOW7TWnx2+q8YN?=
 =?iso-8859-1?Q?bctKYFYkDxuC+autrO2pNAo2QbBX79kjs5l9zvfoLmQGtChoCVmay0pz2I?=
 =?iso-8859-1?Q?LYnbUGwHWMSddbT4QyAXeYUm24l967HOqEIUTTIazEjnh2jHGgwWlTHk8N?=
 =?iso-8859-1?Q?UXtK/0InDNHH9LTmO7ETuLe9Hlf/EikqJNDBLV2NMnLviV5onkngxUqcZt?=
 =?iso-8859-1?Q?pdw74guJxRBlMUDUul+z8S6U/Q0rZOKYCRqkIY7zkxHwetHLqNfN5r/DVC?=
 =?iso-8859-1?Q?04amvs6pz6Ny7JWbeVcGXcLJZkE+1FDr1twapYwEO2VLXjV5jOL3OZSxCf?=
 =?iso-8859-1?Q?SC+3S7uMtpIzh6dcyX0NbPqTm+O26k61c+R8LbvlyJdOQcKtS+Z0giWWTj?=
 =?iso-8859-1?Q?/mKkJaCRlBQZII/EkMVehB3/D9oSpNpeolLTkriwrBXqy9niSAHLuC4xCq?=
 =?iso-8859-1?Q?oUKtom+wBSOPyJm5x6aUWoU7sZd2GNI6zyc0jS1UyHoWDZNsnDQNYRDi09?=
 =?iso-8859-1?Q?IoRo27ioSQn2y8/+OzVPupYIKtn3Lk3BcJMby7SX9a+cGojBTdddfgCFe5?=
 =?iso-8859-1?Q?t1mTlB5N1RwMRx7aQpDhQi3cJowb83f8qGZtGQcLjTiQrIc5W+dC43j3W3?=
 =?iso-8859-1?Q?1u1egkJjsL2ATt7V8BFxoAlZZvmF7T0GpGXuMWKkjtyqUG+XROFjk0PLDZ?=
 =?iso-8859-1?Q?AeYebZXGVKXyq1xvEyQM+GIbrWrzF5MTvI2xJkmdSMXVhxiOXJoyEmabWw?=
 =?iso-8859-1?Q?0NhCu2gMAcFvY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR02MB8915.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dedab4aa-58f1-4bdb-5df5-08de21fd49d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 15:08:08.1638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rMN7TjEIjcHmhKtap3bC9KO7hQGbQkz7kU4fyxoiMhXxcVsws6i7FWiAUjpujeuY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB11420
X-Mailman-Approved-At: Thu, 13 Nov 2025 00:28:26 +0000
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

Hi,=0A=
I'm trying to create a driver for a small lcd display called Raystar RDX006=
3 that is using the=0A=
Sitronix ST75156 chip. The display is used in SPI 4 wire mode similar to ma=
ny other tiny MIPI=0A=
DBI displays, but the register set and framebuffer format is not MIPI DBI c=
ompliant, since each=0A=
byte sent is actually 1 column of 8 rows.=0A=
=0A=
The datasheets for the Raystar RDX0063 display and the Sitronix ST75156 chi=
p are unfortunately=0A=
not publicly available, but you can find the datasheet for Sitronix ST7567 =
(which is similar to =0A=
ST75156) here: https://www.topwaydisplay.com/sites/default/files/2020-05/ST=
7567.pdf=0A=
=0A=
The main difference seems to be that ST75156 supports a higher resolution t=
han ST7567,=0A=
as can be seen here: =0A=
https://www.sitronix.com.tw/en/products/industrial-display-driver-ic/mono-s=
tn-lcd-driver-ic=0A=
=0A=
As a first attempt to create the driver, the panel-mipi-dbi driver was exte=
nded with "tweaks"=0A=
to support non MIPI DBI panels. This seems to work. However, after some dis=
cussion with the=0A=
maintainer that is no longer active (https://github.com/notro/panel-mipi-db=
i/discussions/14)=0A=
the conclusion was that these "tweaks" were not upstreamable, and that I ne=
ed to create a new=0A=
driver specifically for the Raystar RDX0063 display panel using the Sitroni=
x st75156 chip=0A=
instead.=0A=
=0A=
In order to make my driver upstreamable, which driver should I be "inspired=
" by (i.e copy and modify)=0A=
and base my work on? The drivers in drivers/gpu/drm/sitronix/ and drivers/g=
pu/drm/tiny/ usually uses=0A=
struct mipi_dbi_dev and mipi_db_command() helpers, but drivers/gpu/drm/pane=
l/panel-sitronix-st7789v.c=0A=
does not.=0A=
=0A=
Should I create my new driver as /gpu/drm/sitronix/st75156.c and use mipi_d=
bi helpers where applicable?=0A=
If it is preferable to avoid using the mipi dbi helpers, is there another s=
et of helper functions that=0A=
I should use instead?=0A=
=0A=
Best regards=0A=
/Lars Rask=
