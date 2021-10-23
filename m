Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1AB4384E0
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 21:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE356E092;
	Sat, 23 Oct 2021 19:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8147C6E092
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Oct 2021 19:11:48 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19NBoCKN018736; 
 Sat, 23 Oct 2021 19:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ghjKWsMsGEnE+ZxkigQpKuRPGKSji/MJUl8NBcf5PjA=;
 b=kM2yDiPPmc9fMHy3q2rtyPUiz1dD/NyrVYSt27WL196sGfeBY/b6Tk59lOiq/ZfPQUrf
 zgmu4UyHBPexpXLs2vqfSDiA6mnVaqxJxEpWEATyQwfmeTRvIjmyWTOgsLukOvkEpcYf
 q5GezmC7PxPfzbqGK0j2WrIT7oht6bnD8HtEdevMqQaFvgFN7T87i5lez7qfa5cUvXCc
 qFk1aRvK4d2MTyFOKpeZ+oCZcJdHMN1T8T5t8zmPtVjmaS6/xNRBxujyAgqiNzGzIsbZ
 9WnNwqaTHL0v8Dxh7S4GvJE2/PkPE9lhyDpnVT+InEl4pX1XFisW3xXeHr0BzsXv0W0t zA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bv9019xca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 23 Oct 2021 19:11:31 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19NIxmSE084223;
 Sat, 23 Oct 2021 19:11:29 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2040.outbound.protection.outlook.com [104.47.57.40])
 by userp3020.oracle.com with ESMTP id 3bv9qkec6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 23 Oct 2021 19:11:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNpuiJKVcWlxovc2CUXvGSs/5vFRSLxY3CmPibOVxevOpGWkfBzgRU9Brnkf7NYq40j8+Tm1HqDLMcwP+LkIdFiMrnBcEV9cf2495QDuRPdOVRBSr0TUzzeNR0YJXE3MYrxLCXRBHTnxONMaVt0a9oiAhilqqPiBjB7pz/+YTY76a2qMq/PsL0RLKPkD6PXNvnNbz7gHKKtkyFLKuZBT4kB60FlogHymuxCF3Ke7BPQcqFBM+p7DTyXUO+KdTy/53a/axY4cZfFjMhzm5ncsTUo/qTMJPA9HP01Xs6awGhgIujqjWQoQonm2OdKtoUVuFlqql81Sm/b4J0++DhFRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghjKWsMsGEnE+ZxkigQpKuRPGKSji/MJUl8NBcf5PjA=;
 b=AAKqWJM7SNVMB8YkWTWlRV0BFrCX5d/aznoS+vSCU3+MSvpPrqI+n4HmQejGhWnHNjaNFMzGN/qld3xIuzdQNcq771P9zgIa0245YjtRoZoOG/on11iMkIkr+pDYybcSlDMHLVF+pe+8GHSG4LdZCo6tK51dQkC+KVW1yEjH6kRqYvHBaMSczfdR+Wo0/VxhsNynPnP6BA4bqOKZqs7PrK9ZwlV5BgGp/O5v74YFwzzaYke4OowbKSpuWkXJhqiVxK7Q2vXUtJ3LK9XYgWUxXOp+7v0fIE7gE5PZSOprbNvfKZ10zTiGyBE9y6UZoMo3RhfUmz4SOtk4/V5WWYNrhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghjKWsMsGEnE+ZxkigQpKuRPGKSji/MJUl8NBcf5PjA=;
 b=lic9/Xe3IwOohZOSRv7vLPrAFURnCm66fZtB6FG5cny4wlXnFBLw7xIpToHXJxaiXh25+WAXn1Wbi7PVTrRIN7gBHNsDLBuceR3+JOiZDImXpOHa7bS1I021N+jZs9ZuTruCK0EirPr7Qh8EoeFcfiOgiFmgyesR7O2SoMKl96I=
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com (2603:10b6:a03:2db::24)
 by SJ0PR10MB5566.namprd10.prod.outlook.com (2603:10b6:a03:3d8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Sat, 23 Oct
 2021 19:11:27 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::f4fe:5b4:6bd9:4c5b]) by SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::f4fe:5b4:6bd9:4c5b%5]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 19:11:27 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Kim Phillips <kim.phillips@amd.com>
CC: Thomas Zimmermann <tzimmermann@suse.de>, Ainux <ainux.wang@gmail.com>,
 David Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>,
 "sterlingteng@gmail.com" <sterlingteng@gmail.com>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>, Borislav Petkov
 <bp@alien8.de>, Borislav Petkov <bp@suse.de>,
 Jon Grimm <jon.grimm@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "drm/ast: Add detect function support"
Thread-Topic: [PATCH] Revert "drm/ast: Add detect function support"
Thread-Index: AQHXxpCbelXozBir6kKUWlMpIbtczavg9msA
Date: Sat, 23 Oct 2021 19:11:27 +0000
Message-ID: <857A08C1-89B4-4F75-AB7C-C7FB5D9F6429@oracle.com>
References: <20211021153006.92983-1-kim.phillips@amd.com>
In-Reply-To: <20211021153006.92983-1-kim.phillips@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fad4fca6-3e7f-4f96-599a-08d99658ea0f
x-ms-traffictypediagnostic: SJ0PR10MB5566:
x-microsoft-antispam-prvs: <SJ0PR10MB556646AE71BBBD32E8FA22C793819@SJ0PR10MB5566.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:331;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Psi6bqz/6uY5JAB0Xx1sqiCBxs0sHvv2zN7cPskt3nR5JLheAz1WFYzIRremdU0pZ6/tvLG/2k6vnZa9GrSd+iiMp/ix4HhC0h4LbHDr5A5ExO6SlY8Z6FJY3AwXrU0U8iPKzulnGPzjqwZ/Xg9rbRLYmhlg8J3Rb5CozGjh3T0EUdeWOfFTEXZlryj2FxE6CXWUkn+Rp6Le72HxQPOSZgg0I7ffgArGkJZhAfgrEJ/JwS648ptQS15cwykaAPz1IHRsbfzqXs/hspDHXNIC9TFJUfnUflWXEGGG6ojHLyV4AJqBVfU4IVDkcyWztoWuNX1of0mr9I9C5z6quYOg/1H0q7+XwsMcFCjGeSOtCXqgPc7nvloNMPYPkrv9BI9f4tchu1gr+wEBdSVtBzY/gX/DViRxuWY0i8SbA2haa3vq0pemRWQA8Aq04l9mA+5SuiIgGs7Co+XUPX4XH/P8tsvNcWADAufI0Z/jquFoyP2y20NxaSvjNdmPMV5XoBJW9eNy9UbhoiCxWwowlDzDN7pzB+2IO2WelO6fp6AID24aoJHyKRrlRfQ3VmLUhjOBJwYI/r07U8X+BxZjrORwliZdXH6NXbjKaZG/EVmuKzg9CJ82vOq7++bwgwblbPBsdPMVnerVKrH7kzhZfgVoV9O9d8byyoV0Tpxi0erCw6K5ouEdEkn/kabk9qtC5AcGqZBYnr9ugYAe6ZFlaP61IhMNXNkkgC4Q3kHqq2J/HEp4BiHJITGmrm8eFQTs30+EOLi2t3HftxpSwFpnnWLqumidrXqpecLexd+1kucf0axxJWrBQGhHhRu0nVmCPFQBlQPl1p4DYiYXHoLFk6Zsaw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4688.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(91956017)(33656002)(76116006)(64756008)(66446008)(66946007)(54906003)(122000001)(66476007)(66556008)(6506007)(6512007)(8936002)(38100700002)(966005)(26005)(86362001)(6486002)(316002)(38070700005)(5660300002)(36756003)(6916009)(8676002)(45080400002)(83380400001)(2906002)(53546011)(2616005)(7416002)(508600001)(71200400001)(4326008)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YZkDFMLcB0y9MqRX54vfBXr+eZBXwX45vpMcAcSNcetlCBFuBDZgqDu9dChm?=
 =?us-ascii?Q?ld4ktNGhjQVG+XRDvgH0gAhuVB+Po/tRezcoVyaVlgU0TS7S1Q6lUewa+J06?=
 =?us-ascii?Q?del64WWowTrU4eudSicoMlDMOyOwJhYWVulLJR00JRfh30HEHybUi6X669RC?=
 =?us-ascii?Q?IqnhQ/4d8xTMsCi31+UH9gBln8kKWfyiHKJU9G2Bkp8ebgOer+Py/DzVgOOf?=
 =?us-ascii?Q?pb6kfSWdXlRbSGY7d/y2frGGVy93Jo/QqbqlNdM1O0gq9T8tVwhCpnWd+Tye?=
 =?us-ascii?Q?ZveUZ2jsJY51YlJY/Mt2KKMh8T4zsYtDfdiQPp/cdx8k8AqZmUwJQcRC5lwC?=
 =?us-ascii?Q?RlE8XDTN3I+DoFmsqmAF2bwn0+k6yAVm8Frk67A8uXA1cKKryhE66NP0kZhc?=
 =?us-ascii?Q?sgtBdiqWGjufrQCt+HyqSc107iGvPnUF7eNYSoi78TBADcdQbR/Hea4buHCr?=
 =?us-ascii?Q?une1LSQVJMNs9AYEq/SxuYM3FV8IzuuauO2v0lLBDEj0i3hvNztvOrnpfkjr?=
 =?us-ascii?Q?k0OQaW6/6adVklwujlz7Za7e0g16L0jKpfweRMGV/oq4W/9lyzFb2dSwnZyk?=
 =?us-ascii?Q?eksGFrztbv+G3l7wtKct55gKEDbBdHwtLf/j7oVqBLYkXc/1ml828qYXUJbo?=
 =?us-ascii?Q?P9Jwe6z2+4PxGVWHLzlRSMUdJM8B0sVq9lbLqZxL1aHnJQrUz9Ehgk5+yLEV?=
 =?us-ascii?Q?wg/4Q3840vPW84QRV28xWBmKYYBPqKLIraJwzy6xCwWgWjRkec4+pkQBSDXM?=
 =?us-ascii?Q?34UpNqhwBT2GlaEt+gR0xp004IjUu0EgNvp2BgwTIiN5eTiwI7PQ5GuYy24O?=
 =?us-ascii?Q?NuE9WrVLBqrqjboiO0graaKZ3lgWiPZZUnkYWsUK/yg5dtcbMa0lMWPpiF29?=
 =?us-ascii?Q?fiV5ZCZe4GFQ79YqC9dH7hmDJS1TwPBc05iRprWVnSvNQwRQlogECEcuF6uY?=
 =?us-ascii?Q?M0a3lgXVFZt/ncpj+Ag1nWOUsnvn7xod12T0F6SUBs1zglF87JkwTaSkcXC5?=
 =?us-ascii?Q?O8s6d57O3PqYItF/pfXnrTUAS27Dk6qbKrLauY2/JIVjbK9BOTVUOX7tQEPY?=
 =?us-ascii?Q?uxttee3IuLsCnFg4jVeljVaPRd98RwsYmni75xDLZf/4bnkLtStlLHFnZ/fM?=
 =?us-ascii?Q?pt9lc9hfxSf+Co1Xbr/IKGblSgr28+QE+8nckzOKiDzvPxtQxec2yuhr9Q/U?=
 =?us-ascii?Q?0AZAeLL2+bJK5HcU+YWNKsBCfWX8gc8Z1NZ+mHKMixxKWQoeEalmC9u7pUH7?=
 =?us-ascii?Q?kUIWtQxxQ1LaIHSEnwL7US6aGtZsWg4v/w8VyuNWFWCr0UaeEz8fiLlCjg5r?=
 =?us-ascii?Q?kmX1TVopVigMqREpYnlQ4SDgyq44TfteLOupZaVY47EB5CSNICTm3cDxfy5H?=
 =?us-ascii?Q?aJ4iCP6pvcVfZG+t8f+KqTFaN3rY3kFL+m7O9nH44TsyCCvlXynF9HVqC7Zm?=
 =?us-ascii?Q?vR/B5RlLsoW4+I+vMK8YBmJmx/AJs93qR71j6vDHxLusaVCWm/UQ76rQx7WM?=
 =?us-ascii?Q?NX7KzL55cWqhmidgwVOAGUU4wBNsVcmA6HnXhMaYSknLDl3q5BzoviGbyOSi?=
 =?us-ascii?Q?bD1PrDmbVRirNVSNMBXJeDlXqFY6iaBIXsMPlIaEn58zTHgK6pi8D0To9odK?=
 =?us-ascii?Q?Km8yZyqrpjZVxAKdIbu3Pf0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A1A5B3DB376D2A4FBA61E222067C6ADC@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4688.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad4fca6-3e7f-4f96-599a-08d99658ea0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2021 19:11:27.5364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /0PZeoVoKUNLUs1fXYpVT1Oo/6pCiugj6pPpWNbeQCLg9XMEfN9zo2jLZSltXWxk2fmwbCWNhvfvIMWI/jMorA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5566
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10146
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110230122
X-Proofpoint-GUID: Nx_K3-likrgS0aThhkMKlPgy4vIZ01jQ
X-Proofpoint-ORIG-GUID: Nx_K3-likrgS0aThhkMKlPgy4vIZ01jQ
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



> On Oct 21, 2021, at 11:30 AM, Kim Phillips <kim.phillips@amd.com> wrote:
>=20
> This reverts commit aae74ff9caa8de9a45ae2e46068c417817392a26,
> since it prevents my AMD Milan system from booting, with:
>=20
> [   27.189558] BUG: kernel NULL pointer dereference, address: 00000000000=
00000
> [   27.197506] #PF: supervisor write access in kernel mode
> [   27.203333] #PF: error_code(0x0002) - not-present page
> [   27.209064] PGD 0 P4D 0
> [   27.211885] Oops: 0002 [#1] PREEMPT SMP NOPTI
> [   27.216744] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.15.0-rc6+ #15
> [   27.223928] Hardware name: AMD Corporation ETHANOL_X/ETHANOL_X, BIOS R=
XM1006B 08/20/2021
> [   27.232955] RIP: 0010:run_timer_softirq+0x38b/0x4a0
> [   27.238397] Code: 4c 89 f7 e8 37 27 ac 00 49 c7 46 08 00 00 00 00 49 8=
b 04 24 48 85 c0 74 71 4d 8b 3c 24 4d 89 7e 08 66 90 49 8b 07 49 8b 57 08 <=
48> 89 02 48 85 c0 74 04 48 89 50 08 49 8b 77 18 41 f6 47 22 20 4c
> [   27.259350] RSP: 0018:ffffc42d00003ee8 EFLAGS: 00010086
> [   27.265176] RAX: dead000000000122 RBX: 0000000000000000 RCX: 000000000=
0000101
> [   27.273134] RDX: 0000000000000000 RSI: 0000000000000087 RDI: 000000000=
0000001
> [   27.281084] RBP: ffffc42d00003f70 R08: 0000000000000000 R09: 000000000=
00003eb
> [   27.289043] R10: ffffa0860cb300d0 R11: ffffa0c44de290b0 R12: ffffc42d0=
0003ef8
> [   27.297002] R13: 00000000fffef200 R14: ffffa0c44de18dc0 R15: ffffa0867=
a882350
> [   27.304961] FS:  0000000000000000(0000) GS:ffffa0c44de00000(0000) knlG=
S:0000000000000000
> [   27.313988] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   27.320396] CR2: 0000000000000000 CR3: 000000014569c001 CR4: 000000000=
0770ef0
> [   27.328346] PKRU: 55555554
> [   27.331359] Call Trace:
> [   27.334073]  <IRQ>
> [   27.336314]  ? __queue_work+0x420/0x420
> [   27.340589]  ? lapic_next_event+0x21/0x30
> [   27.345060]  ? clockevents_program_event+0x8f/0xe0
> [   27.350402]  __do_softirq+0xfb/0x2db
> [   27.354388]  irq_exit_rcu+0x98/0xd0
> [   27.358275]  sysvec_apic_timer_interrupt+0xac/0xd0
> [   27.363620]  </IRQ>
> [   27.365955]  asm_sysvec_apic_timer_interrupt+0x12/0x20
> [   27.371685] RIP: 0010:cpuidle_enter_state+0xcc/0x390
> [   27.377292] Code: 3d 01 79 0a 50 e8 44 ed 77 ff 49 89 c6 0f 1f 44 00 0=
0 31 ff e8 f5 f8 77 ff 80 7d d7 00 0f 85 e6 01 00 00 fb 66 0f 1f 44 00 00 <=
45> 85 ff 0f 88 17 01 00 00 49 63 c7 4c 2b 75 c8 48 8d 14 40 48 8d
> [   27.398243] RSP: 0018:ffffffffb0e03dc8 EFLAGS: 00000246
> [   27.404069] RAX: ffffa0c44de00000 RBX: 0000000000000001 RCX: 000000000=
000001f
> [   27.412028] RDX: 0000000000000000 RSI: ffffffffb0bafc1f RDI: ffffffffb=
0bbdb81
> [   27.419986] RBP: ffffffffb0e03e00 R08: 00000006549f8f3f R09: ffffffffb=
1065200
> [   27.427935] R10: ffffa0c44de27ae4 R11: ffffa0c44de27ac4 R12: ffffa0c56=
34cb000
> [   27.435894] R13: ffffffffb1065200 R14: 00000006549f8f3f R15: 000000000=
0000001
> [   27.443854]  ? cpuidle_enter_state+0xbb/0x390
> [   27.448712]  cpuidle_enter+0x2e/0x40
> [   27.452695]  call_cpuidle+0x23/0x40
> [   27.456584]  do_idle+0x1f0/0x270
> [   27.460181]  cpu_startup_entry+0x20/0x30
> [   27.464553]  rest_init+0xd4/0xe0
> [   27.468149]  arch_call_rest_init+0xe/0x1b
> [   27.472619]  start_kernel+0x6bc/0x6e2
> [   27.476764]  x86_64_start_reservations+0x24/0x26
> [   27.481912]  x86_64_start_kernel+0x75/0x79
> [   27.486477]  secondary_startup_64_no_verify+0xb0/0xbb
> [   27.492111] Modules linked in: kvm_amd(+) kvm ipmi_si(+) ipmi_devintf =
rapl wmi_bmof ipmi_msghandler input_leds ccp k10temp mac_hid sch_fq_codel m=
sr ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress raid10 ra=
id456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_=
pq libcrc32c raid1 raid0 multipath linear ast i2c_algo_bit drm_vram_helper =
drm_ttm_helper ttm drm_kms_helper crct10dif_pclmul crc32_pclmul ghash_clmul=
ni_intel syscopyarea aesni_intel sysfillrect crypto_simd sysimgblt fb_sys_f=
ops cryptd hid_generic cec nvme ahci usbhid drm e1000e nvme_core hid libahc=
i i2c_piix4 wmi
> [   27.551789] CR2: 0000000000000000
> [   27.555482] ---[ end trace 897987dfe93dccc6 ]---
> [   27.560630] RIP: 0010:run_timer_softirq+0x38b/0x4a0
> [   27.566069] Code: 4c 89 f7 e8 37 27 ac 00 49 c7 46 08 00 00 00 00 49 8=
b 04 24 48 85 c0 74 71 4d 8b 3c 24 4d 89 7e 08 66 90 49 8b 07 49 8b 57 08 <=
48> 89 02 48 85 c0 74 04 48 89 50 08 49 8b 77 18 41 f6 47 22 20 4c
> [   27.587021] RSP: 0018:ffffc42d00003ee8 EFLAGS: 00010086
> [   27.592848] RAX: dead000000000122 RBX: 0000000000000000 RCX: 000000000=
0000101
> [   27.600808] RDX: 0000000000000000 RSI: 0000000000000087 RDI: 000000000=
0000001
> [   27.608765] RBP: ffffc42d00003f70 R08: 0000000000000000 R09: 000000000=
00003eb
> [   27.616716] R10: ffffa0860cb300d0 R11: ffffa0c44de290b0 R12: ffffc42d0=
0003ef8
> [   27.624673] R13: 00000000fffef200 R14: ffffa0c44de18dc0 R15: ffffa0867=
a882350
> [   27.632624] FS:  0000000000000000(0000) GS:ffffa0c44de00000(0000) knlG=
S:0000000000000000
> [   27.641650] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   27.648159] CR2: 0000000000000000 CR3: 000000014569c001 CR4: 000000000=
0770ef0
> [   27.656119] PKRU: 55555554
> [   27.659133] Kernel panic - not syncing: Fatal exception in interrupt
> [   29.030411] Shutting down cpus with NMI
> [   29.034699] Kernel Offset: 0x2e600000 from 0xffffffff81000000 (relocat=
ion range: 0xffffffff80000000-0xffffffffbfffffff)
> [   29.046790] ---[ end Kernel panic - not syncing: Fatal exception in in=
terrupt ]---
>=20
> Since unreliable, found by bisecting for KASAN's use-after-free in
> enqueue_timer+0x4f/0x1e0, where the timer callback is called.

Another one of my Supermicro Intel systems had some console-related
misbehavior this week. The console never reaches the login prompt,
but rather it stops at "fb0: switching to ast from EFI VGA" .
The system otherwise seems functional, but the console is not
responsive.

Applying Kim's patch restored expected behavior.

DMI: Supermicro Super Server/X12SPL-F, BIOS 1.1a 08/05/2021

Handle 0x0016, DMI type 41, 11 bytes
Onboard Device
        Reference Designation: ASPEED Video AST2600
        Type: Video
        Status: Enabled
        Type Instance: 1
        Bus Address: 0000:06:00.0


> Reported-by: Kim Phillips <kim.phillips@amd.com>
> Signed-off-by: Kim Phillips <kim.phillips@amd.com>
> Fixes: aae74ff9caa8 ("drm/ast: Add detect function support")
> Link: https://lore.kernel.org/lkml/0f7871be-9ca6-5ae4-3a40-5db9a8fb2365@a=
md.com/
> Cc: Ainux <ainux.wang@gmail.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: sterlingteng@gmail.com
> Cc: chenhuacai@kernel.org
> Cc: Chuck Lever III <chuck.lever@oracle.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Borislav Petkov <bp@suse.de>
> Cc: Jon Grimm <jon.grimm@amd.com>
> Cc: dri-devel <dri-devel@lists.freedesktop.org>
> Cc: linux-kernel <linux-kernel@vger.kernel.org>
> ---
> drivers/gpu/drm/ast/ast_mode.c | 18 +-----------------
> 1 file changed, 1 insertion(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mod=
e.c
> index 6bfaefa01818..1e30eaeb0e1b 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1300,18 +1300,6 @@ static enum drm_mode_status ast_mode_valid(struct =
drm_connector *connector,
> 	return flags;
> }
>=20
> -static enum drm_connector_status ast_connector_detect(struct drm_connect=
or
> -						   *connector, bool force)
> -{
> -	int r;
> -
> -	r =3D ast_get_modes(connector);
> -	if (r <=3D 0)
> -		return connector_status_disconnected;
> -
> -	return connector_status_connected;
> -}
> -
> static void ast_connector_destroy(struct drm_connector *connector)
> {
> 	struct ast_connector *ast_connector =3D to_ast_connector(connector);
> @@ -1327,7 +1315,6 @@ static const struct drm_connector_helper_funcs ast_=
connector_helper_funcs =3D {
>=20
> static const struct drm_connector_funcs ast_connector_funcs =3D {
> 	.reset =3D drm_atomic_helper_connector_reset,
> -	.detect =3D ast_connector_detect,
> 	.fill_modes =3D drm_helper_probe_single_connector_modes,
> 	.destroy =3D ast_connector_destroy,
> 	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_state,
> @@ -1355,8 +1342,7 @@ static int ast_connector_init(struct drm_device *de=
v)
> 	connector->interlace_allowed =3D 0;
> 	connector->doublescan_allowed =3D 0;
>=20
> -	connector->polled =3D DRM_CONNECTOR_POLL_CONNECT |
> -						DRM_CONNECTOR_POLL_DISCONNECT;
> +	connector->polled =3D DRM_CONNECTOR_POLL_CONNECT;
>=20
> 	drm_connector_attach_encoder(connector, encoder);
>=20
> @@ -1425,8 +1411,6 @@ int ast_mode_config_init(struct ast_private *ast)
>=20
> 	drm_mode_config_reset(dev);
>=20
> -	drm_kms_helper_poll_init(dev);
> -
> 	return 0;
> }
>=20
> --=20
> 2.32.0
>=20

--
Chuck Lever



