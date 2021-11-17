Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CE1455584
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 08:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725526E97C;
	Thu, 18 Nov 2021 07:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4557 seconds by postgrey-1.36 at gabe;
 Wed, 17 Nov 2021 14:59:06 UTC
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B736E046
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:59:05 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AH6K72n026594;
 Wed, 17 Nov 2021 08:42:56 -0500
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3cbpjvmqu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 08:42:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaGJNiPsdUoR85ox2JP5w+wL4/D/c5NxlRDsP8Sd6nGE2ikvCVNMgYuApH6A5FADJJUMi6JW0EIebIqKAff76EmzaR8w0NR21XcA9EgWiumTrQHLZWbHSiU9bw2d0BVfK8HLPeB7n+rB7ynG5OW+En9OVkdFfzic6+9Ra2yOker7o639TOKsa+N3C2TXndygVhYNPoXOVYCehpMrcqtjv0JsW3JldnMS6zqsbsQoQTAdXfUPFhdkEQ2vVui54O7kzNVW1w1REWNkzpc5fpmYtXkVQKCUuvhfH+iC2noCoWPMy+MZW+35lALcIBNI/KP0sMkbmSCGXc4n66o823HmeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDkJoAQ7svxb3hbvZGCwLDa2+2V0ee31sVdADeT5Yzg=;
 b=D9jFvc2trdZ3gx7Z/jqzP6bTG/FKKGF6q4wwwIjZRyQlyv80NP+hQqefb/FiietcN6b9mfLUI5OsMITzzjV31kmKS0ufyuvubOx/fK32qiOIS7DFdxYGj1OKJ+y47GKAbT9J3LWcqIqO/eyG5asDV2HRgxvX8BU7XNzpiyVWhXPr8piofxbXjnfu65867CT1BpDK6nZJiaUxS3IrLy3CnkgqQpabkXj7aN3XMDCM+EYco1z7JTBOzkgRMnb87okonf+WpqGXUY2a60utwGdHcLwCvMMryFtSw33XuelgqK5rbLvpdA6cU4l4C8LdFJeU7og4q/E/Yng26wGVCY9vvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDkJoAQ7svxb3hbvZGCwLDa2+2V0ee31sVdADeT5Yzg=;
 b=o542u6IIZp/3gr6htGIpHdCZklJDWRySJ3qkOKJakOC7FFiXo/WYgS8jnRR17dh1oCyCxaUjQkOe48nSAUjXC2r/9N+vufQB9KAKtjvl7M0DoMjklSgiG3HyBhqkwtKXK4TJ8W0yxqSdI3iB0fdYrMJ5oj1xTFGCcAyI52gXPmo=
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com (2603:10b6:a03:3b8::19)
 by BYAPR03MB4534.namprd03.prod.outlook.com (2603:10b6:a03:c7::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 13:42:52 +0000
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::9c7a:461c:ed39:38a1]) by SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::9c7a:461c:ed39:38a1%4]) with mapi id 15.20.4713.019; Wed, 17 Nov 2021
 13:42:52 +0000
From: "Hennerich, Michael" <Michael.Hennerich@analog.com>
To: Paul Cercueil <paul@crapouillou.net>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH 00/15] iio: buffer-dma: write() and new DMABUF based API
Thread-Topic: [PATCH 00/15] iio: buffer-dma: write() and new DMABUF based API
Thread-Index: AQHX2ivV/sa1f0wcaUO37ultPkqhlKwEqDoAgAAFsICAAaRvgIABXKoAgAAK8tA=
Date: Wed, 17 Nov 2021 13:42:52 +0000
Message-ID: <SJ0PR03MB62535F5346288267AE0DBF308E9A9@SJ0PR03MB6253.namprd03.prod.outlook.com>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <YZJwnPbgCOdeKq6S@phenom.ffwll.local>
 <18CM2R.6UYFWJDX5UQD@crapouillou.net>
 <YZPWEU2zRCY0En4l@phenom.ffwll.local>
 <WNVP2R.HXWZSVQE5UMK1@crapouillou.net>
In-Reply-To: <WNVP2R.HXWZSVQE5UMK1@crapouillou.net>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbWhlbm5lcm?=
 =?iso-8859-1?Q?lcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZi?=
 =?iso-8859-1?Q?ODRiYTI5ZTM1Ylxtc2dzXG1zZy00MGZjYmYyNi00N2FjLTExZWMtOTFmNi?=
 =?iso-8859-1?Q?00ODg5ZTc3Y2RkZWZcYW1lLXRlc3RcNDBmY2JmMjgtNDdhYy0xMWVjLTkx?=
 =?iso-8859-1?Q?ZjYtNDg4OWU3N2NkZGVmYm9keS50eHQiIHN6PSI5NzYyIiB0PSIxMzI4MT?=
 =?iso-8859-1?Q?YzMDE3MDIwOTUyMDciIGg9InBMc1JEOVZ1WjBJL2UvS1RjbW9IZ3AzdStw?=
 =?iso-8859-1?Q?dz0iIGlkPSIiIGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk?=
 =?iso-8859-1?Q?5DZ1VBQUVvQ0FBQm5vVlVEdWR2WEFlcXNTR3dsL3NWQTZxeEliQ1greFVB?=
 =?iso-8859-1?Q?REFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFFQUFRQUJBQUFBVklFdm9RQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBSjRBQUFCaEFHUUFhUUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QU?=
 =?iso-8859-1?Q?c4QWFnQmxBR01BZEFCekFGOEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFh?=
 =?iso-8859-1?Q?UUIwQUdrQWRnQmxBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQU?=
 =?iso-8859-1?Q?FBR0VBWkFCcEFGOEFjd0JsQUdNQWRRQnlBR1VBWHdCd0FISUFid0JxQUdV?=
 =?iso-8859-1?Q?QVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURFQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FBQUFBQUNlQUFBQVlRQmtB?=
 =?iso-8859-1?Q?R2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dCdkFHb0FaUUJqQUhRQW?=
 =?iso-8859-1?Q?N3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21ldGE+?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23e5a7a0-9c90-44a5-330f-08d9a9d0271f
x-ms-traffictypediagnostic: BYAPR03MB4534:
x-microsoft-antispam-prvs: <BYAPR03MB4534A920F4B612FE9771E97B8E9A9@BYAPR03MB4534.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dS1SgTCq5qu8uxNnxasdljq2CdX7GBpIH2QJ90CZzQfieGV911LV0uL0JgJz8MdKrH0cDqu5HMySYk5hxxPmDT1ZQ/Zv5MwLQ+LGTR1oayDVrzijGtVfWdcpEGNmFYyJyoJZCvGbvcKHDbN/c41uGGNJgKF9r1ZiO2u0iU5/7O5PGywC0WaD0ujBP/tRIH98evOaW7IET/gQ/CYtRFpU9JdJxLX+GBFbbdd8YAoOGfm+nb8vw6AHEw2cFE5Y2TbtHYxpFToRnSHJ/nZH3kxp0gWn6k/Lk3Hv6MFufWg/cKDj+Qh2jVifrze8nVVVGMkeAuSE1RXh0ToSZkR+w5+9nhqzGxEaSwmq89Xty0pzZW00RbedYPZof3EEgjKjoAc+pXszVUXn5Puqm3fth55pODT0GfTDfNNneLvHW3iKmEXiMcvMudpdFZPxeL/DbhEXO017OzPvovsUBUCUHMz7kIwaqSbBY3o6rMqDZx4Jnqb9+oAbWW3FEbej8h+/CD3SYTIXQWxClgmT6exAZ5e7d4W8nUCTEz9y8JlPZqfbbqggdGb2Dv+cOtheXZNy3jJQPkSoYlih2pjiUG3gdyqWbNewGU7W89Wti08C7/cktW6uRzplk3tKQTuAvwKVjrBF9yq0ak6joWi9D6kX5bdHgR0X6QLKf/UC+e4XheLVv1BXK/UvESOKmtWJtTi05+ufQIg4HqYXHbKN5Ej+8X3aNeK9aiW3UPFaTwAEJ1hZ+IVmFkOP7GMl1+sx1UQI7E5ae6V0I+y17uatU1uu9JkbPUDkYlG82VlUFfzLlzg6tMUlSdDPE+IcPJUh4ffYRp1/kA9k2af6/q+X6WhPwx+VTw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR03MB6253.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(38070700005)(8676002)(26005)(66574015)(6506007)(83380400001)(53546011)(52536014)(316002)(186003)(71200400001)(33656002)(76116006)(66946007)(64756008)(66556008)(7416002)(66446008)(66476007)(9686003)(110136005)(54906003)(55016002)(2906002)(86362001)(38100700002)(966005)(4326008)(508600001)(7696005)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?YBtltawovC+wzcpUHmLFFNnjJBaF917ayzdWj6jdH7mYYuc+JXBXzbLp7U?=
 =?iso-8859-1?Q?p1jz4QDo/bf/EVrUvv4PYBEXNmmaTDS179ha6zjjDUAzEY0Dc+p+eL89RE?=
 =?iso-8859-1?Q?jWiU+Qv3qR//E+1f5jV6AkpcklCf+R1r8nFePxBHatAxuXa75FquaV35Ku?=
 =?iso-8859-1?Q?XRacFdizjgnt5K8TspjVxTVYyXnxxGwiNpB9CZm5dIMFFSnTfa+swUqLpY?=
 =?iso-8859-1?Q?wTulgUM3IS4QC70a6LAw1JQ7dC21usfIZ+YaUiep7OOwyIOfmcmHFOmbHt?=
 =?iso-8859-1?Q?WW8jZs++httHiiMhG74uMwlyItbyCNi8CCZrEuJHMFybBOTQPt4qsIRW5t?=
 =?iso-8859-1?Q?lmvLM5sYmQYPu1oi53spryFfK2AOjuZKF1f9pUk++GpiQgPDpipdEUB1Mm?=
 =?iso-8859-1?Q?6qBNmixaWnUmeCMKhL5fjf1FNuB7PgLhf1COHtjevJ2MdKkvlPJDELHS/h?=
 =?iso-8859-1?Q?FI8ovFh8j5FaJpjDi6/w5iFUEiNwpV17J75c7aVdr9LIhL8iprA828zPFs?=
 =?iso-8859-1?Q?B1+dLlaxzc24TaMsbBXHB0eSW+P+Fz2TQqSOEBhyGtNoGMILXSz5odbAn6?=
 =?iso-8859-1?Q?y7KA4AB0OTjVk50+Wiv0XuQyDuWsml0k+Vly0BfPsFKsfSjj6mEeQIU3kH?=
 =?iso-8859-1?Q?30tc3bf4L4Hhm3sHj5VOG5PQoQoyroljl2IdGSi0uB3f38JDh2EwX61oEj?=
 =?iso-8859-1?Q?MYNgbbRy6I4DoxWtwYF6qeHmsaasFWPhtKREMfgMAIwEIiuq+wyJbhq3JD?=
 =?iso-8859-1?Q?n/N44GHEks5uOG/x7bb94XNV4K7zkYThr1POMfKrqeTNK/bEovHgvL4+Y0?=
 =?iso-8859-1?Q?0kG7Z8s56v7KahjDAJlVDbwVgqKDShc4WAvP/M4y6zobpT9GcgAnlrQ4wB?=
 =?iso-8859-1?Q?H6M138yxKoU8TeDU0X57lhISv4JueOJfpD0bYPqnV+2fYrGIIu69vwOZff?=
 =?iso-8859-1?Q?lSZyL6jXpLOhziCLQ/yAwX17/tV7sHZGodaYhweAAVXSkEnG5Ji7nWMH5k?=
 =?iso-8859-1?Q?yvsDn7aoVc4xRKjyUjLyh8lR3fRgPTMETRZGuCF/xQnoD0VKEjFjw1WA8D?=
 =?iso-8859-1?Q?A1Eaw5eN0lOj1MOE7uX4Yr8ZaU6rqt5Q+EMS0lKszYVk3I34XjFK8YOfDq?=
 =?iso-8859-1?Q?eA5/n/XJEB/eSf12z/37AyrTKf/xVAn49DKT7yiyghA3uGmDPA88UJ8bLC?=
 =?iso-8859-1?Q?OXIFqp6ZynoRl5zYAWNaHVAU2+TiQXqZWyC16FlK9IxkmNy4Vx3wF4JqXL?=
 =?iso-8859-1?Q?oph/AGC9ZWcpWj/CK1CPds3kNJcJVS8UFl5sieeJ5kGPml7cNZsjXAYx2/?=
 =?iso-8859-1?Q?RLt6jsAQ1PGAzGX9CReOAr2G0LxPz5igCJ14OQHoy4taY+4GTPA3zhghUF?=
 =?iso-8859-1?Q?EWfbJUBbFT2nUlwrhgYbXoVz0m4Q18XRlOBcdz97ehXWtHfYwX9PSg2W8N?=
 =?iso-8859-1?Q?ZZSteul5F6Zr380g1bUX129w+Yh1O77Z9ZV/43KCPVpqObB+pSt8dCsElX?=
 =?iso-8859-1?Q?WCHLvjp9R5efvxdvkGysxW86sMR15GW19hScajLxSSruv3mz7RpMyEwVxo?=
 =?iso-8859-1?Q?P3H/LJEiEZ4ziGQyYrm40mOQoRIp6bdly7oJwoHMBRMMAMgRocZW2KKVEp?=
 =?iso-8859-1?Q?dLbHpYORRuHZtHB4BpAOaMF2szM1S24GYeQN9ENn+AH2fWWMXIN6uabnDd?=
 =?iso-8859-1?Q?/HwGTzp9Uhaz2HxS4wA85OuzRw4LSGzxn3HmLfzDQue7kwvsgVPIFxrorH?=
 =?iso-8859-1?Q?sJUg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6253.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e5a7a0-9c90-44a5-330f-08d9a9d0271f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 13:42:52.2003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GLKH9tsBhBeXwK4mlLLJZNDlnniN/PPjQYhSePNMLjvlKBo2EBFNjuDLRk8CZIGn1qb7LnLEdjFYwbWH/nAYFpICxosbpeTxFqqxiV8GNrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4534
X-Proofpoint-GUID: PnRKWo6gTQ95LXmuMsMPbzZHVIfG-iFX
X-Proofpoint-ORIG-GUID: PnRKWo6gTQ95LXmuMsMPbzZHVIfG-iFX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_04,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170070
X-Mailman-Approved-At: Thu, 18 Nov 2021 07:28:27 +0000
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
Cc: "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Paul Cercueil <paul@crapouillou.net>
> Sent: Mittwoch, 17. November 2021 13:50
> To: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jonathan Cameron <jic23@kernel.org>; Hennerich, Michael
> <Michael.Hennerich@analog.com>; linux-iio@vger.kernel.org; linux-
> kernel@vger.kernel.org; dri-devel@lists.freedesktop.org; Christian K=F6ni=
g
> <christian.koenig@amd.com>; linaro-mm-sig@lists.linaro.org; Alexandru
> Ardelean <ardeleanalex@gmail.com>; linux-media@vger.kernel.org
> Subject: Re: [PATCH 00/15] iio: buffer-dma: write() and new DMABUF based
> API
>=20
> [External]
>=20
> Hi Daniel,
>=20
> Le mar., nov. 16 2021 at 17:02:25 +0100, Daniel Vetter <daniel@ffwll.ch> =
a
> =E9crit :
> > On Mon, Nov 15, 2021 at 02:57:37PM +0000, Paul Cercueil wrote:
> >>  Hi Daniel,
> >>
> >>  Le lun., nov. 15 2021 at 15:37:16 +0100, Daniel Vetter
> >> <daniel@ffwll.ch> a  =E9crit :
> >>  > On Mon, Nov 15, 2021 at 02:19:10PM +0000, Paul Cercueil wrote:
> >>  > >  Hi Jonathan,
> >>  > >
> >>  > >  This patchset introduces a new userspace interface based on
> >> DMABUF  > >  objects, to complement the existing fileio based API.
> >>  > >
> >>  > >  The advantage of this DMABUF based interface vs. the fileio  >
> >> >  interface, is that it avoids an extra copy of the data between the
> >> > >  kernel and userspace. This is particularly userful for
> >> high-speed  > >  devices which produce several megabytes or even
> >> gigabytes of data  > > per  > >  second.
> >>  > >
> >>  > >  The first few patches [01/15] to [03/15] are not really
> >> related, but  > >  allow to reduce the size of the patches that
> >> introduce the new API.
> >>  > >
> >>  > >  Patch [04/15] to [06/15] enables write() support to the
> >> buffer-dma  > >  implementation of the buffer API, to continue the
> >> work done by  > >  Mihail Chindris.
> >>  > >
> >>  > >  Patches [07/15] to [12/15] introduce the new DMABUF based API.
> >>  > >
> >>  > >  Patches [13/15] and [14/15] add support for cyclic buffers,
> >> only  > > through  > >  the new API. A cyclic buffer will be repeated
> >> on the output until  > > the  > >  buffer is disabled.
> >>  > >
> >>  > >  Patch [15/15] adds documentation about the new API.
> >>  > >
> >>  > >  For now, the API allows you to alloc DMABUF objects and mmap()
> >> them  > > to  > >  read or write the samples. It does not yet allow
> >> to import DMABUFs  > >  parented to other subsystems, but that should
> >> eventually be possible  > >  once it's wired.
> >>  > >
> >>  > >  This patchset is inspired by the "mmap interface" that was  > >
> >> previously  > >  submitted by Alexandru Ardelean and Lars-Peter
> >> Clausen, so it would  > > be  > >  great if I could get a review from
> >> you guys. Alexandru's commit was  > >  signed with his @analog.com
> >> address but he doesn't work at ADI  > > anymore,  > >  so I believe
> >> I'll need him to sign with a new email.
> >>  >
> >>  > Why dma-buf? dma-buf looks like something super generic and
> >> useful,  > until  > you realize that there's a metric ton of
> >> gpu/accelerator bagage piled  > in.
> >>  > So unless buffer sharing with a gpu/video/accel/whatever device is
> >> the  > goal here, and it's just for a convenient way to get at buffer
> >> handles,  > this doesn't sound like a good idea.
> >>
> >>  Good question. The first reason is that a somewhat similar API was
> >> intented  before[1], but refused upstream as it was kind of
> >> re-inventing the wheel.
> >>
> >>  The second reason, is that we want to be able to share buffers too,
> >> not with  gpu/video but with the network (zctap) and in the future
> >> with USB
> >>  (functionFS) too.
> >>
> >>  [1]:
> >> https://urldefense.com/v3/__https://lore.kernel.org/linux-iio/2021021
> >> 7073638.21681-1-
> alexandru.ardelean@analog.com/T/__;!!A3Ni8CS0y2Y!p67g
> >>
> KdXW2zXUxASbwbCKzXgcwxEo1R3h4AumAE6QHiSPyI3KYaz9TmGpnSIF3wsQ
> c3gAgQ$
> >
> > Hm is that code merged already in upstream already?
>=20
> No, it was never merged.
>=20
> > I know that dma-buf looks really generic, but like I said if there's
> > no need ever to interface with any of the gpu buffer sharing it might
> > be better to use something else (like get_user_pages maybe, would that
> > work?).
>=20
> If it was such a bad idea, why didn't you say it in the first place when =
you
> replied to my request for feedback? [1]
>=20
> I don't think we have any other solution. We can design a custom API to p=
ass
> buffers between IIO and user space, but that won't allow us to share thes=
e
> buffers with other subsystems. If dma-buf is not a generic solution, then=
 we
> need a generic solution.

I don't think we need another generic solution - dma-buf is the solution:

From https://www.kernel.org/doc/html/v5.15/driver-api/dma-buf.html:
" The dma-buf subsystem provides the framework for sharing buffers for hard=
ware (DMA)
 access across multiple device drivers and subsystems, and for synchronizin=
g asynchronous hardware access."

That's sounds pretty much like what we need.

It lives under linux/drivers/dma-buf=20
if it would be a video only shouldn't this be documented somewhere, and per=
haps the code should be somewhere else?

Just my 2cents.

Greetings,
Michael=20

>=20
> [1]:
> https://urldefense.com/v3/__https://x-lore.kernel.org/io-uring/b0a336c0-
> ae2f-e77f-3c5f-
> 51fdb3fc51fe@amd.com/T/__;!!A3Ni8CS0y2Y!p67gKdXW2zXUxASbwbCKzXg
> cwxEo1R3h4AumAE6QHiSPyI3KYaz9TmGpnSIF3wu9jAKL1Q$
>=20
> >>  > Also if the idea is to this with gpus/accelerators then I'd really
> >> like  > to  > see the full thing, since most likely at that point you
> >> also want  > dma_fence. And once we talk dma_fence things get truly
> >> horrible from a  > locking pov :-( Or well, just highly constrained
> >> and I get to review  > what  > iio is doing with these buffers to
> >> make sure it all fits.
> >>
> >>  There is some dma_fence action in patch #10, which is enough for the
> >> userspace apps to use the API.
> >>
> >>  What "horribleness" are we talking about here? It doesn't look that
> >> scary to  me, but I certainly don't have the complete picture.
> >
> > You need to annotate all the code involved in signalling that
> > dma_fence using dma_fence_begin/end_signalling, and then enable full
> > lockdep and everything.
>=20
> Doesn't dma_fence_signal() do it for me? Looking at the code, it does cal=
l
> dma_fence_begin/end_signalling.
>=20
> Cheers,
> -Paul
>=20
> > You can safely assume you'll find bugs, because we even have bugs
> > about this in gpu drivers (where that annotation isn't fully rolled
> > out yet).
> >
> > The tldr is that you can allocate memory in there. And a pile of other
> > restrictions, but not being able to allocate memory (well GFP_ATOMIC
> > is ok, but that can fail) is a very serious restriction.
> > -Daniel
> >
> >
> >>
> >>  Cheers,
> >>  -Paul
> >>
> >>  > Cheers, Daniel
> >>  >
> >>  > >
> >>  > >  Cheers,
> >>  > >  -Paul
> >>  > >
> >>  > >  Alexandru Ardelean (1):
> >>  > >    iio: buffer-dma: split iio_dma_buffer_fileio_free() function
> >>  > >
> >>  > >  Paul Cercueil (14):
> >>  > >    iio: buffer-dma: Get rid of incoming/outgoing queues
> >>  > >    iio: buffer-dma: Remove unused iio_buffer_block struct
> >>  > >    iio: buffer-dma: Use round_down() instead of rounddown()
> >>  > >    iio: buffer-dma: Enable buffer write support
> >>  > >    iio: buffer-dmaengine: Support specifying buffer direction
> >>  > >    iio: buffer-dmaengine: Enable write support
> >>  > >    iio: core: Add new DMABUF interface infrastructure
> >>  > >    iio: buffer-dma: Use DMABUFs instead of custom solution
> >>  > >    iio: buffer-dma: Implement new DMABUF based userspace API
> >>  > >    iio: buffer-dma: Boost performance using write-combine cache
> >>  > > setting
> >>  > >    iio: buffer-dmaengine: Support new DMABUF based userspace API
> >>  > >    iio: core: Add support for cyclic buffers
> >>  > >    iio: buffer-dmaengine: Add support for cyclic buffers
> >>  > >    Documentation: iio: Document high-speed DMABUF based API
> >>  > >
> >>  > >   Documentation/driver-api/dma-buf.rst          |   2 +
> >>  > >   Documentation/iio/dmabuf_api.rst              |  94 +++
> >>  > >   Documentation/iio/index.rst                   |   2 +
> >>  > >   drivers/iio/adc/adi-axi-adc.c                 |   3 +-
> >>  > >   drivers/iio/buffer/industrialio-buffer-dma.c  | 670
> >>  > > ++++++++++++++----
> >>  > >   .../buffer/industrialio-buffer-dmaengine.c    |  42 +-
> >>  > >   drivers/iio/industrialio-buffer.c             |  49 ++
> >>  > >   include/linux/iio/buffer-dma.h                |  43 +-
> >>  > >   include/linux/iio/buffer-dmaengine.h          |   5 +-
> >>  > >   include/linux/iio/buffer_impl.h               |   8 +
> >>  > >   include/uapi/linux/iio/buffer.h               |  30 +
> >>  > >   11 files changed, 783 insertions(+), 165 deletions(-)
> >>  > >   create mode 100644 Documentation/iio/dmabuf_api.rst
> >>  > >
> >>  > >  --
> >>  > >  2.33.0
> >>  > >
> >>  >
> >>  > --
> >>  > Daniel Vetter
> >>  > Software Engineer, Intel Corporation  >
> >> https://urldefense.com/v3/__http://blog.ffwll.ch__;!!A3Ni8CS0y2Y!p67g
> >>
> KdXW2zXUxASbwbCKzXgcwxEo1R3h4AumAE6QHiSPyI3KYaz9TmGpnSIF3ws_
> BZIjsg$
> >>
> >>
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > https://urldefense.com/v3/__http://blog.ffwll.ch__;!!A3Ni8CS0y2Y!p67gK
> >
> dXW2zXUxASbwbCKzXgcwxEo1R3h4AumAE6QHiSPyI3KYaz9TmGpnSIF3ws_B
> ZIjsg$
>=20

