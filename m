Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBC29FDC4E
	for <lists+dri-devel@lfdr.de>; Sat, 28 Dec 2024 22:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A05A10E334;
	Sat, 28 Dec 2024 21:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=scioteq.com header.i=@scioteq.com header.b="QxGj6Odb";
	dkim=pass (2048-bit key; unprotected) header.d=mail-dkim-us-east-2.prod.hydra.sophos.com header.i=@mail-dkim-us-east-2.prod.hydra.sophos.com header.b="Dpr7Uqb5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rd-use2.prod.hydra.sophos.com (rd-use2.prod.hydra.sophos.com
 [18.216.23.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2F510E152
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2024 21:20:25 +0000 (UTC)
Received: from ip-172-21-1-173.us-east-2.compute.internal
 (ip-172-21-1-173.us-east-2.compute.internal [127.0.0.1])
 by rd-use2.prod.hydra.sophos.com (Postfix) with ESMTP id 4YLFdN1d8CzlVjd
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2024 21:20:24 +0000 (UTC)
X-Sophos-Product-Type: Gateway
X-Sophos-Email-ID: 093514d5514a4fc5a9a6ee3b61498d19
Received: from PR0P264CU014.outbound.protection.outlook.com
 (mail-francecentralazlp17012055.outbound.protection.outlook.com
 [40.93.76.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by relay-us-east-2.prod.hydra.sophos.com (Postfix) with ESMTPS id
 4YLFdL6cVZzgY8H; Sat, 28 Dec 2024 21:20:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jq1nsbWzJlRBwfZXHvI4AVKtxbRnljvOCUbbztbS918F5NqoC7LWRVCADew/781UdO3LIOocK+qAGiER8wwj+SZ/Ep2x8ylvqjjsrhdjd1kcAJG7cEIe0so96WdhAzYAsZBXapnLglPsJHWSVQOpOf7YUbdG2m8rFuye21hGTzIBbfxcY4xSYT6MbZx9wGHcRVN7Tgz1wHtK6yTh/IhJ3+jEoRjO8QGQS7h5vAArFdyflpBzYYF44X93NvrqdG+/eV3IOqF57UANt2aE/z6KsBJkKgADI1Sb8zy+iGS7qNWn9NDPpth32/9Ojw+CAyH8BzsTPjB9Kelh9IAykeVezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Fw6LyVmnM696Izkbnamkwzyz/L/m6USR+fSHuGA8eY=;
 b=upETjGhZAmJjOxNQMdVS/hS3y48sDHv1ALQPY5IKvYt6LIufR8zPnuf7NGdW+luuKmiAfguFw5+LD7b0mlxblyaZyfSrR6kYSOg7pwRCiXnPhVqrt15tZmBca1Yo0XjYJ51+ox1ES/T1XI9JSoXCgzIutuAwul8cDiVsijkBnkA4hYyysy/LxYXexuKo4PRvvdJxPKx++ZlAtvTOLxIDEgBt1jDV+B4CJZFonHoI4xIDNwApnFhhtU6qbbfNcYIee5xhKOeNCMvWvRZvz+zT0wMYv+mf9bFyQlJ8JL83kWro6Ivt+5CdQHM37JQXECWddvjZCFmkTM/Bb5i9Igl5Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=scioteq.com; dmarc=pass action=none header.from=scioteq.com;
 dkim=pass header.d=scioteq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735420817; 
 s=sophose3b6b7cefe1d4c498861675e62b33ff6; d=scioteq.com;
 h=Content-Type:Date:Subject:CC:To:From;
 bh=2Fw6LyVmnM696Izkbnamkwzyz/L/m6USR+fSHuGA8eY=;
 b=QxGj6OdbUzhMmi7LubEBjf/rctynTxu6NUNa1N3MZtElQNqUNpwwrxLj4s8BriDz
 VMwFIu9IcoqTEsRJHprjM+1X5V2/nEepUPLbNNTmAXRkr3lJs92KGGJS2kAWZ5Q7NZH
 dkArrmv1mXmpMGAYNFWf4D/qsSKDq4Ja4gz+g92gtyZin8CRSudBD9r8hRIUI1iuGo1
 l7n31bJDfrPlmDfoTDH9/lPZXZ3H9roeviIqN4DB546518s5dR7jAP+kGccuD2chcc9
 gx4o+TDDO0hdFaNlbsGiDKR7jnVdDxtRsJvk5/qSX3nB3GuK6+h4wYjJtONzQOwVPPl
 6jXYLHYQpQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735420817; 
 s=v1; d=mail-dkim-us-east-2.prod.hydra.sophos.com;
 h=Content-Type:Date:Subject:CC:To:From;
 bh=2Fw6LyVmnM696Izkbnamkwzyz/L/m6USR+fSHuGA8eY=;
 b=Dpr7Uqb5KWA+8MpAc3geMfzTNzWv8eKtCTt5j/h0FL3bFqQOykbcOCsIxqWKkdp5
 W3LKrz3JrgpFkpsHlKGTjd1PSrCykFjTOl+T8UVH8XfcSlGOg1rY1tBc7SVv0DRFwTM
 0AR26wfJQVZpzFJrqu5z3/jDWksn6Duig569N8UyxVvfm7X5CcXCd1QszYJJhP9nBod
 5ZTNjYDImUFkeJCRtGZqLI9XXrMRS6INmwsrF25YckfgAx9xppBFKMKGZbjBA3QrWbZ
 s558n/cbfePLN6RhrP1fa9ZMZNMvKsK4um5qJ/LK99J9/mXEB/R38Q+eVy0PDE8fLW/
 w8q7pFOSLQ==
Received: from PASP264MB5297.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:43b::20)
 by PR1P264MB1885.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Sat, 28 Dec
 2024 21:20:20 +0000
Received: from PASP264MB5297.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3de1:b804:8780:f3cd]) by PASP264MB5297.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3de1:b804:8780:f3cd%5]) with mapi id 15.20.8293.000; Sat, 28 Dec 2024
 21:20:19 +0000
From: Jesse Van Gavere <jesse.vangavere@scioteq.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: ADV7511/13 implementing atomic ops and bus formats
Thread-Topic: ADV7511/13 implementing atomic ops and bus formats
Thread-Index: AdtZbi8EHgRPTTpYSqu6qWF3rjBzcw==
Date: Sat, 28 Dec 2024 21:20:17 +0000
Message-ID: <PASP264MB52976B917B5F002234D72DDEFC0F2@PASP264MB5297.FRAP264.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=scioteq.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PASP264MB5297:EE_|PR1P264MB1885:EE_
x-ms-office365-filtering-correlation-id: 18b9249f-0ebe-4509-38fc-08dd27856d46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?wmBAoFGxsnIok2xOqyA4Biz696gGK3EMBs4OpUJPK7rcD+sZo2DE45tg6e7O?=
 =?us-ascii?Q?5Kbh+XTbm9cjDmRCarBcXcmJKZpvLVYeFQyY379Lih0LwROua8g+QE3dY6Wp?=
 =?us-ascii?Q?Ss8111oDjU81zDJND07LobFA6kEMrnfNhv28uSgccO0slwPqlPVjQDFBx3E0?=
 =?us-ascii?Q?CX0EgDg2X5+zYs3C9x2GrwAJ4iBpo0Wg+hkUeCNNs07FZzd00EGLX0giI2BQ?=
 =?us-ascii?Q?GwxoKgGr472erL+DS3t/6xOhuvM3EAYyyaJi3UFBFETbCl6AHASs8kVxXLm5?=
 =?us-ascii?Q?FoIliOiC5TEU8ZPFYan6lWQRfaXRW18L6ZVicmCKPJz7TaTeoHSLFKnczICK?=
 =?us-ascii?Q?DZtotz5L3MONkQ+FoumPhepevjHqyuiA+SgMsnc2xq+AJ/oNHZ/saoGg09lF?=
 =?us-ascii?Q?KEOryemhLgShg2L/j3TP2K2hR3bfLZOPh43blQR3Gl6hfsnmtGhIKKp3xi98?=
 =?us-ascii?Q?AxLBmZ8nSjNbQeOTzfzRiLoFZsupHpmftDMSFte8mu24s1yxwRoTIb7wKRxq?=
 =?us-ascii?Q?XKjQ7QcgzRqwLy6XMxDIk9UlPe9E9DFkSNlGGZO5y/D9RDtmagTcTRGYwbWW?=
 =?us-ascii?Q?P3VErMf8hSG3iE9lZacNXqqugKOWuM9TjxITQeAY36IlGqWP2Gte+aoo0cJ3?=
 =?us-ascii?Q?urEOHJ6e37opOtEvNbFcqRwpJmdmww+C2cTW0JLqbxgXum6LD3JyyFok9xUo?=
 =?us-ascii?Q?+SZp4l8MXRmy/b9XleI7avq5lN5SYbXL7wdfddgw8ACA/9UcEavPqBfs7ktf?=
 =?us-ascii?Q?Ckbf0jHPrDDNToLEYhWUrtI893CsTNpDz6IbLbk714qZPvVY70QuYtkanuMb?=
 =?us-ascii?Q?rAdrLGzvlm5y6dIHRZaAPaVBpFuhtadn4+eBUFW3odAIFjQoHPNifWx48aPI?=
 =?us-ascii?Q?ziKKPq+HVCh7jA2s8HizRQRN2uDoALi2gi6l+02HMyUzY9rNnIZsURZnP9ei?=
 =?us-ascii?Q?YRm93bnkPfIJXQc4VMOllzygEkbqHlD/MBxNxvYuWY+FRTgKrvOOOLLWy8sd?=
 =?us-ascii?Q?fzNi0Zc3YoHidFkrRs0wcI3EljKJvFPTBxhJRJ2gW8xP3sRal1+UyfHThK3W?=
 =?us-ascii?Q?BNDSCjbVm/C90Rkn7Dt6+MJ4iRdegYqP+b30bIx6+4zaKx4O7crrapfAUgHd?=
 =?us-ascii?Q?ptsMjteE1AWHE0zPFMxRr/raj0JyHv/EKpDSZIK9yt6Z0N7WWce+rtnnz6wU?=
 =?us-ascii?Q?Tg7Vk6+zrgvPcw35EgQsE+E+qk1X+8KVsXIp6GpMYouDApGgnTVnuglV2O5t?=
 =?us-ascii?Q?T2QciFPaFmNJ09SgESXnldmEpGO4qJ88KYw7fUpPRz6tCGRWbjW2K4Fin8dC?=
 =?us-ascii?Q?xl03QVhU7mHpLT95BJI0nnBsBcibTXUwu0tMRPZUPSV6M+YOITRk9BA0Dy2Z?=
 =?us-ascii?Q?alHto5tRs81CtjopdehEw4fHO/XgGpZprJ39eJTT86ckhrf0sYQiMLPXkI3+?=
 =?us-ascii?Q?9Fl+5tid9pwjLL5lMyWTS0mVaApS6YwJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; 
 IPV:NLI; SFV:NSPM;
 H:PASP264MB5297.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE; 
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+wgGDQeLvlGLdjrQKGkgdQNERcvrXG32AHgr95ArVmPvAu5u8dNUDVtezCao?=
 =?us-ascii?Q?yjEqG9gspQV5rP3F7NIInEHCK+1IcwnIfjNVDsxXFNzjTqkWYL7qqK4PEC3q?=
 =?us-ascii?Q?hIFPxapMNqwvwGAFBiLLxMGlTCV+Czdh2K5Vifbc9y7y6GelLH1VMYWO27TX?=
 =?us-ascii?Q?gXEsEVaZTEM8LFpfHZrcf0JDE95NNeXtyUATFPfZaU7vKEy57VRF6PViDwDN?=
 =?us-ascii?Q?uw3a+iR7vnD4ZWleCHpBIQqR4zNn9lh52TqTt3XnGH7hiIwwIEwFDbV1h5+j?=
 =?us-ascii?Q?Z192SQZAyLBVD32YFPDiDiAwfer8adcGcCDWhs0LLPo5C6qY5BsUWrHPApYO?=
 =?us-ascii?Q?HLLdRv2ZqRODaHEBnQbY+cpK+7IpUY8ssfhQFSGHadmbqeUMyy376Xxudj6Z?=
 =?us-ascii?Q?HmSBf0Psz7NWz6ziHwnzMSYMCNVuHrkVHCG8k4+QcuxEbcQUv1pOUVB3g18N?=
 =?us-ascii?Q?GvVfnbdOX6PTCAd4ub5GiPRRyDhvpqjNGfS6YZZ8uHKrff9PBJd6Iehc3zsx?=
 =?us-ascii?Q?TvNTzFYKb7rZ9Na7oKUi4tJzt2j6tNGxNjwP793ix5f49ZsJtI/Je2A/wLnf?=
 =?us-ascii?Q?y2PkdJ8dpy/HuioQgOqXnTFqjlKBu8zyWmwVFspUAwUGxKp/UuMG/sIiabkk?=
 =?us-ascii?Q?hB8IIYN11c3gZsQtscsXa3JQqupgRMkTO4slg0KsrLgDCPmLpa1QQexPfi1Y?=
 =?us-ascii?Q?U00xA2jUKL6GxmzGd2Yqb/D+MP4D39szJthNAgT+EsVMp4iYs/uohrHwqMkh?=
 =?us-ascii?Q?N6YPedrFu+qv0LLp8+8B+MggWdVtJUeE1P36ZPoLVFVVD6GmIklFp9oKSAl6?=
 =?us-ascii?Q?ZD9k/yNwzONFx/f+z/Oy9TFJp2BfAxtMCVZZx7kaW2lg10Sr06JQIJXxHH17?=
 =?us-ascii?Q?eFBST7o3+lXXpgFIKmTfS5sI1ocg4+uh7SqtXtGSUPQzEb07tKfPuOwKN7mr?=
 =?us-ascii?Q?L5I49LV4ao2TCQkQQY7Fr8OBFSu/kGO4YsZwFm+cEmPj8aG+K516hF7LvrQR?=
 =?us-ascii?Q?NwzPQmngK4yUjZMdw1XE80PuTgS0beHfUscto8RBE4V0LBGJ6AMrCNqpMAuj?=
 =?us-ascii?Q?sB/5MEuVVInNjYj5KoXxmB3PhS3ikIhxgtr+3CuGAaTbTSv6a39/+2BOxRAb?=
 =?us-ascii?Q?DgtsCn90j65hJQaaCpXbouV//a3jMmdyPX6wjrO6Ijh3fAorhp08zLszncqX?=
 =?us-ascii?Q?44a3nowE9GzGyznFkTweryQPi6lbgi+IoVys9hqQTOlSSxQfg4jcOPxv8Zm4?=
 =?us-ascii?Q?zIkRHAPymAdOD/Ed6BM/nr4dP4dbUI6co20BOW2RHYuty+fmnrOiR3+YJrGz?=
 =?us-ascii?Q?cOslNZoAzrFMynKq/KB+TSrViXnooDUppiBguQxWusF51B8Zo+yUBMg9YY7J?=
 =?us-ascii?Q?3JmDLY7BZ1bs0e2tOQ0IyV/VbeK3CopI+M4fkxNK7kiRh6N0uGz/Wkx5DIf0?=
 =?us-ascii?Q?Incj/9UVyosjRZGNdrA4zPjcQm1R+A/LC5rsiPcPyUviunGHWyFzOndVJONt?=
 =?us-ascii?Q?8m/Yhp6FDvaJU5GLhb8up+uBrLgBE8yLTP7WJcCPp3wutjse+iBmAb03EbcI?=
 =?us-ascii?Q?7X7WD7L2nuel3EfwFgmY4SI6t+6543+S9hjP3ahFWkIL579Iyc/CheBFm+sl?=
 =?us-ascii?Q?uw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2Q2efSFeFQWPkNcMrMmCATvbholVSxYaI19s5RHtxlx7RAZkLvCoyaj5IdUdt7kbgWXnNPIVR4WewgkBTh2hVEepIIhjxlb66c52dcX3qAKdZnaUFg72cyczz0Gnwt//cTC3wNDA0jyAsMYSdGrRNa8buf6/eCgGNAXROSAzXk78CTakEdPsX823cFHghZkFhqcafbpcr/68NzAWwuB73Fy4Sbigi3GpLw0I/EMjD6puagTdO6KSd4AJF0rVsorO6V3zq1WrkqS4ZSYXyDJSZF2vFfqnsNRCcSkNvdeQymGdb4gbx4xfiuaAIRhnwStz2frGDHBVpMVGJySi9HSTyoi0qO6VU71BKrRISVC6Db/+nEO5Rg3wM2DxkIG1tyxdgwU6sztLfgydqJ4psPn52VoclHjBP53ZoyGYclEb/arE40aj0Jf7XmrkzBl/9UhcZuV6Uqf0757zh1NxomtCeLYS6pa98HyH7Vrh/HxS4VDufggcifuzvbyv0zyDRpx9VvjzvdN034FrJI6uHYR0isuCoOhqmW0IEfRD8ajqsKKr2u/Bs+ArZXF6TPVxJLJalxk8HV36n4UdTT0Z3b/fFWYlDDnQ/4r0y7gzR+KFDwNay0Ch7q4daID7pqdXMvP9MCtEGnheQy7kRfpSEfjvptVLX7OJo6kILgcocuc3oIg=
X-OriginatorOrg: scioteq.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PASP264MB5297.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b9249f-0ebe-4509-38fc-08dd27856d46
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2024 21:20:17.3626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f3e5b271-16f7-46b9-bdb3-4271ac933ef0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GtTqRaXZMBt9Fj8HHzke0iKueD9CX+9DQ2VP6I6akDo6D19raRvanoUajfzRWJ4B1IEwhJPBYhvoyDiay7z7efXtgNL8n6XZWEhdBBL4Je0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1885
X_Sophos_TLS_Connection: OPP_TLS_1_3
X_Sophos_TLS_Delivery: true
X-Sophos-Email: [us-east-2] Antispam-Engine: 6.0.0,
 AntispamData: 2024.12.28.204846
X-LASED-From-ReplyTo-Diff: From:<scioteq.com>:0
X-LASED-SpamProbability: 0.083173
X-LASED-Hits: ARCAUTH_PASSED 0.000000, BODYTEXTP_SIZE_3000_LESS 0.000000,
 BODY_SIZE_2000_2999 0.000000, BODY_SIZE_5000_LESS 0.000000,
 BODY_SIZE_7000_LESS 0.000000, CTE_QUOTED_PRINTABLE 0.000000,
 DKIM_ALIGNS 0.000000, DKIM_SIGNATURE 0.000000, FROM_NAME_PHRASE 0.000000,
 HTML_00_01 0.050000, HTML_00_10 0.050000, IMP_FROM_NOTSELF 0.000000,
 LEGITIMATE_SIGNS 0.000000, MULTIPLE_RCPTS 0.100000,
 MULTIPLE_REAL_RCPTS 0.000000, NO_CTA_FOUND 0.000000, NO_CTA_URI_FOUND 0.000000,
 NO_FUR_HEADER 0.000000, NO_URI_FOUND 0.000000, NO_URI_HTTPS 0.000000,
 OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000, SUSP_DH_NEG 0.000000,
 TO_NAME_IS_ADDY 0.000000, __ARCAUTH_DKIM_PASSED 0.000000,
 __ARCAUTH_DMARC_PASSED 0.000000, __ARCAUTH_PASSED 0.000000,
 __ARC_SEAL_MICROSOFT 0.000000, __ARC_SIGNATURE_MICROSOFT 0.000000,
 __BODY_NO_MAILTO 0.000000, __BULK_NEGATE 0.000000, __CC_NAME 0.000000,
 __CC_NAME_DIFF_FROM_ACC 0.000000, __CC_REAL_NAMES 0.000000, __CT 0.000000,
 __CTE 0.000000, __CTYPE_CHARSET_QUOTED 0.000000, __CT_TEXT_PLAIN 0.000000,
 __DKIM_ALIGNS_1 0.000000, __DKIM_ALIGNS_2 0.000000, __DQ_NEG_DOMAIN 0.000000, 
 __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000,
 __FROM_DOMAIN_NOT_IN_BODY 0.000000, __FROM_NAME_NOT_IN_BODY 0.000000,
 __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_MSGID 0.000000, __HAS_X_FF_ASR 0.000000, __HAS_X_FF_ASR_CAT 0.000000,
 __HAS_X_FF_ASR_SFV 0.000000, __IMP_FROM_MY_ORG 0.000000,
 __IMP_FROM_NOTSELF_MULTI 0.000000, __JSON_HAS_SCHEMA_VERSION 0.000000,
 __JSON_HAS_TENANT_DOMAINS 0.000000, __JSON_HAS_TENANT_ID 0.000000,
 __JSON_HAS_TENANT_SCHEMA_VERSION 0.000000, __JSON_HAS_TENANT_VIPS 0.000000,
 __JSON_HAS_TRACKING_ID 0.000000, __MIME_BOUND_CHARSET 0.000000,
 __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
 __MIME_VERSION 0.000000, __MSGID_32_64_CAPS 0.000000,
 __MULTIPLE_RCPTS_CC_X2 0.000000, __NO_HTML_TAG_RAW 0.000000,
 __OUTBOUND_SOPHOS 0.000000, __OUTBOUND_SOPHOS_FUR 0.000000,
 __OUTBOUND_SOPHOS_FUR_IP 0.000000, __OUTBOUND_SOPHOS_FUR_RDNS 0.000000,
 __SANE_MSGID 0.000000, __SCAN_D_NEG2 0.000000, __SCAN_D_NEG_HEUR2 0.000000,
 __SUBJ_ALPHA_END 0.000000, __TO_MALFORMED_2 0.000000, __TO_NAME 0.000000,
 __TO_NO_NAME 0.000000, __URI_NO_MAILTO 0.000000, __WEBINAR_PHRASE 0.000000,
 __X_FF_ASR_SCL_NSP 0.000000, __X_FF_ASR_SFV_NSPM 0.000000
X-Sophos-Email-Transport-Route: opps_tls_13:
X-LASED-Impersonation: False
X-LASED-Spam: NonSpam
X-Sophos-MH-Mail-Info-Key: NFlMRmROMWQ4Q3psVmpkLTE3Mi4yMS4xLjE3Mw==
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

Hey all,

(Hope this is not a duplicate as my first mail didn't seem to have gone thr=
ough)
For one of our new boards I have to get the ADV7513 chip working with TIDSS=
, the driver for this expects a bridge chip to have atomic ops and provide =
bus formats.
Doing this for our own needs was quite straightforward but I'd very much li=
ke to upstream this as I think it could be helpful for others as well,
I do have some questions I hope to get some answers on that could help me i=
n writing an initial patch.
I hope you'll forgive any ignorance on my end as it's my first foray into D=
RI.

- For all needed atomic ops I added the drm atomic ops helpers, except for =
atomic_check, looking through the
other implementations I can't quite figure out what I'm expected to impleme=
nt here, what is the expectation for
this function?
- Looking at the lontium 9611, only the input bus formats bridge function a=
re added there, which seems sensible=20
as the output goes out straight over HDMI, is it a correct assumption I'd o=
nly have to add the input bus formats for
the adv7511 driver? Part of me thinks this might not necessarily be correct=
 as it seems the chip can be chained further
than merely to a connector and I'm not sure what this would (or could) expe=
ct
- Does Input justification matter for the bus format? My assumption is that=
 left/evenly/right does not matter for the
format as it only relates to which pins are used and it's e.g. MEDIA_BUS_FM=
T_UYVY8_2X8 no matter which pins this is placed at
so I should just focus on the actively used pins.
- As it's a common driver for adv7511(w)/adv7513, would anyone know if they=
 all use the exact same types of input styles
(of course with varying color depth support) so that I could use ADV7511 as=
 a sort of superset for all possibilities and work
from there to define all the input formats?
- There seem to be certain formats in there that don't exist yet, such as Y=
UV444 12-bit VYU (if I do this right and read highest data bits to lowest,
which I assume translates to MEDIA_BUS_FMT_VYU12_1X36), should I just write=
 a patch for all missing formats to the uapi media-bus-format header
or is there anything else to take into consideration?

Best regards,
Jesse
