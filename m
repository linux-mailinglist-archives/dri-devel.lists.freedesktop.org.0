Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D3CAB1DA8
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 22:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDFF10EACE;
	Fri,  9 May 2025 20:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="q3zcnH13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2058.outbound.protection.outlook.com [40.92.23.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE1810EACE
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 20:05:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BjF3cFOjyhDG26Lcw71HjcI3bdUZc1sdiVfC/NA+JEMktGLCIvP5irGnuEBKFvKhox9VhG0qgNVvcXgtz7LBWuDiWDu9yN3MSa8+XAQt+4jk0HWOK7e7NAhgQkiD/VS2JZf8GW7d6cpbRVzo2xZoOT6JzN907bYhKSyhwGhcC216F5jKwDMCgo16KwvKaEOnS3FY9he2T6bF/lu3/jPGP5BJbVYMLiVfd86whr9R1s3jqwMf1eCkg1PC/QvChhpp5ZAX9uHe76o32UiC2WtSZlKJ4YhjfsoeJ/fXWt5WExyZV7O6NazAlK4DH983fxXqZiQT4EWIbxcI20sLyIgdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOVonr1Tj1z1zZCapIpeC9Q8XUzJVXtmWy8NvnbXTO0=;
 b=GwpD8XCCtDm1SgEA+lzYyD+3ztZcCZTCMj2MSI62vSOHsaas74DgpzZ50Ll0Swz9JxF0nPh5jeNQaQQzNarAOQAdNej8oqA7nidzA8ccA9KLlJx/PHG6n384/z98SD/ZRd270j0/8f5fV+zstBEOgy520D2IBM6Zc4+Db1V7ESI9+lguicLDYQv7TgAFVMDohDL3VmDUtDH1lteR0zsXJ+5cgeuf6rQoFPV55cbupwfJ4p0dll7/xfkKVXFD7bfSzzjtGj3IfSD3EyH2DckDlA1hHYCDy5JgdseGXCQWjZ4OFdVYool3KiNDVPIjncexym8sPCxmfYSj+nr4/kqC+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOVonr1Tj1z1zZCapIpeC9Q8XUzJVXtmWy8NvnbXTO0=;
 b=q3zcnH13sEexyT/xmBTgNKzjxmIUjxlXdc78aEjuS9e2/P1HME2MxlXOjHvJNcP4InUhQw64tx1iMR/QJUsW/33It7vrEuZqEhFSe1Pj3AS8hOMr1v6zOzB24st47W8/DI6IVYrOliggkFaOid1UahbOoEgiVS+XLdmoV0XdL+TQB2aG3AtBxMhXCTgQ+zOg0VtmBijjlKDRJ68eYSIWtP/nvhyB9Z42PfZm5pNGM7/Qd5SI3CSzMfJxsQyvlBPZ9YeE/wLKU/krq02nK1pWYuUmfNrG+y42UrEREyu1RQDeutNE0TVkLu3DpKTYn/xdJuYMijHxZRfIz/rEIMkFQQ==
Received: from DM6PR19MB3722.namprd19.prod.outlook.com (2603:10b6:5:205::25)
 by PH0PR19MB5410.namprd19.prod.outlook.com (2603:10b6:510:fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 20:05:10 +0000
Received: from DM6PR19MB3722.namprd19.prod.outlook.com
 ([fe80::bcae:8341:5687:fb8c]) by DM6PR19MB3722.namprd19.prod.outlook.com
 ([fe80::bcae:8341:5687:fb8c%2]) with mapi id 15.20.8699.019; Fri, 9 May 2025
 20:05:10 +0000
Date: Fri, 9 May 2025 15:05:06 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Chris Morgan <macroalpha82@gmail.com>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ryan@testtoast.com,
 p.zabel@pengutronix.de, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org
Subject: Re: [PATCH V9 02/24] clk: sunxi-ng: h616: Add LVDS reset for LCD TCON
Message-ID: <DM6PR19MB3722C30F0EAF4BBD4C014FEBA58AA@DM6PR19MB3722.namprd19.prod.outlook.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
 <20250507201943.330111-3-macroalpha82@gmail.com>
 <20250509151448.3191a3d8@donnerap.manchester.arm.com>
 <CAGb2v65ZhA3_pdgbq9aVdy-0rQcTNfrHoE_AvJxOvin0a6tnMA@mail.gmail.com>
 <20250509173140.26611141@donnerap.manchester.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250509173140.26611141@donnerap.manchester.arm.com>
X-ClientProxiedBy: SA9PR10CA0015.namprd10.prod.outlook.com
 (2603:10b6:806:a7::20) To DM6PR19MB3722.namprd19.prod.outlook.com
 (2603:10b6:5:205::25)
X-Microsoft-Original-Message-ID: <aB5f8mTcuE2pQOQC@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR19MB3722:EE_|PH0PR19MB5410:EE_
X-MS-Office365-Filtering-Correlation-Id: 10871895-a845-4524-302d-08dd8f34cd0e
X-MS-Exchange-SLBlob-MailProps: WaIXnCbdHrMi34iUpeHrvUBJkG+6rPgnoMo2ZHPK1vAlSC486xx6H8bRufkWLhbiFHk09hS07/jK2N6aDz9Jg8VNOKOG/xbHpwm4lOWudl2vT3+nLjVKci+XED+Z+7B8m9aKwoEnKigVNJzUhNCFQyxubXRprtpioanbkjzjugB428740BRfZcGrfpzMbYQQbNBqs4r7hAtCcthPRb0eRRaLnNjaxBfdMiBRTJd/mAozDoiynZTF03r2mNKS2xCDms2/bqCXEp6FmVidVkp2+oV1a/+3dsCM5CpSRjWGgE+5nqVbmRdg+vBJZjhHzUiBZMMsm4z304y3MUHeUMUwRcv09KVwF5HVi9s/1+tD3tZKCfIidX8SBSYblexkPE+TshFi2kLkXPq/IMcV2Bkp3wkfh6u0CX1o0jvg9m+vrhXaa7Pkd7VUaU7rREExUWZ+8dhY63O0JxfB+nUI6uj72v8k6UFy5Xm7Y0V7uTbWA8ojfB5JYiOcHOdAjzUyXUo87k6PX9HWQPTu+5TcWS7KVBlYyAjwOJsB4Yjiv30EmGO2LOEp5D1hgLFGYbSm/9xuJHejuar1tHIgAqmosv5Gsr6a9bMrlmf7LucUJkUaRB4WFz0uZZXNsp4Wdbghwp+Ycz38fiF1EKABNJ0reIkslVHjNIzUEap87Vf0RcvUYY+Uj82BxjOX7FnYg/bC+ZDHIOfJghXHgfptx7kTDgbqyMKQMn7vG05QI4b6F1TicDYW64zjnd//tnqRhGmEoqcw9L0VckJALrE=
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799009|19110799006|21061999006|7092599006|461199028|6090799003|15080799009|5072599009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDNNMm1Rd0NmU3E2OEM2ZHVRU21WY2VmT3djK2duc2RuYUtLdnNNbGgyeG4r?=
 =?utf-8?B?NWpBaVA0c3Y5aVBBVUlZV1FpT0tITUYyaWVNKzduaG9tS3gxa0lkNW15Wmdm?=
 =?utf-8?B?bUFmWW9oeVpyZlZxUjFtTGhyVFZBSEs1WDUreHpmVWQyRzdyK0s5bDBncHJL?=
 =?utf-8?B?NWduZCt5bjlaZVBYQVhvdUFuOVg0M09pVy9qS1VPMzdYSDFJM3M3Mzh2NGlj?=
 =?utf-8?B?UUU3aDRWZGljSHdXdi92UFZlNkx1Y3JGUlZ5bEd3MmptaEx4MktiSlQyaTNQ?=
 =?utf-8?B?S0pYUkMwKzFhVDNtSG4wNkVVM0NqN1F0RHJ3MkVONzErTjAyaXgxSW1lM1Zv?=
 =?utf-8?B?RXJLSDh5eHNBT0RaU2o1NHZsZWVFRkRzMklIK0J2dk8zOVdqNW95dXdWY3hG?=
 =?utf-8?B?YTJyZ1dPQkVBWk02MzJEaXB0UUQ5RFI1eGhFWW10c2xlMjY4eEJkZnNHQkNa?=
 =?utf-8?B?WDZwY3JremRheGZvY2l1eFNYTk5SdDFjcHZsbU44WlQ2dVhvZ3psa0RXNytJ?=
 =?utf-8?B?eUlkWHJHTmcxeHZyVm5wRERQR3UrL1p4cytRdUdhVEhBQ25uWjdWc2dnWURq?=
 =?utf-8?B?YndhZFlqZGh3SEFJY0NZUktTbDhubmEzalZpbGdIdG0rVWgyVmhpSkFFQ3NF?=
 =?utf-8?B?cHFoVDVLZ0RjOFRtaFlRQlNiVEx4cVoxbVlZQitQclZZeXYrVVlQNzR1dmZs?=
 =?utf-8?B?MEpONkdrN3kyeXUrOXZMQTJCOFdsQVBFdStPRjRwQmpyS2FNb2pxZE81Vm5x?=
 =?utf-8?B?ODg2bmJTNVhJOTFld2xLeEZFdnIyVUFNTUxkQ2hFYzJTbmU4TDZVYXB3OTc1?=
 =?utf-8?B?U1FvZVlSSFJjajBLdXB2L0cvU1YrZmM1OG55OTIvM203MmxYdHpSb1pOWkw4?=
 =?utf-8?B?eWFQTno0cXZTQmFRWjdmMUtOTnk2TDVhOEJSUlkyVytlVTlHS1RjcmFNZzFa?=
 =?utf-8?B?dEd6RnNTZjYxOTRQUEJudUtLMFc4WnZNbEZBSUthQ2Q1OXFmajdtN1JxZFA3?=
 =?utf-8?B?cGtRY0phN3Aybm1JSzdnZWVQQmErb0Rld0hPbXpXRnNvM0Rya3V4c3BNUWxH?=
 =?utf-8?B?eVdpc2R6aEoxMjBRRVJpeXJOUnlYNzQ3RHA2RitlV1RYNWlhSHY1MDdvZHZC?=
 =?utf-8?B?QWE5eXlaUnZmckJaYk9OZ0hSbWdCN0FZcmg4WmIzdVg5V3ZLT005QlNUS3li?=
 =?utf-8?B?ckxWQTlMd3FVZGdvakNoa0NvVlFCUGp2VUFGcXUwcE1UYTcvNXIyZE5lZkho?=
 =?utf-8?B?RjU1aTE3MDNhUitiSUQ2bVZHSER4aGZnQ000SzZSNUZWZEhUMFVMZDNMTkJj?=
 =?utf-8?B?a1VpWFFra3dqR0RnNEpqT1BESU9nMmVYNjUxN2lNQkI0eG00eWpXSmxLakF6?=
 =?utf-8?B?RUFRVDRxbWxxb3RFUVFUSU9QbkFIWnF3ZmN1N1hzb1J2NW5NU0RrY0s1cUxG?=
 =?utf-8?B?L0lJemNvcGFEMGZHbWdxR3VPNmEzM25sUnBLdGdobER1dndvL2dKakN5UE9H?=
 =?utf-8?B?RVpOSGpCRWxxMWVLenpTSS9rQTltSkxsaHVRSUwyRVFENXVNQ0VRTVJhcHA2?=
 =?utf-8?Q?yhln8ZfRw6YEt8XV0meKunFtE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0JaYTNlWktJblM5b2s5SlVzZTYyUy95NjZXT1JObHZVK0lRSWxlZm9HZWlo?=
 =?utf-8?B?WjM5U1I2QnloWU1QeENGVlYwRk1pRkhsZVZ1RzdtbjE3SldvOGJsZzlYVG1C?=
 =?utf-8?B?MjRtUUVvZ2NON29BTDZoOE0vYk1walQrL0xBa1pyeDRKbVEwOG50T2JBVFFN?=
 =?utf-8?B?SEUwKzRVNGthRndFNk9VUUl3TVZlQTlSZ0Eya3RFaUFOdTVYWEdwdE02TWhI?=
 =?utf-8?B?cDBXRkUwaFNjdk5Hc292aStpMFovMmQ4ZVFRR2VKMVRScW83VUozQS9VQWNG?=
 =?utf-8?B?UmtYZE9FeElVWjBWNGNrUHJJcjNFeHZwNUdVOFQ3RlNKZWJPczRGWHJpZzJW?=
 =?utf-8?B?d1gvOXk3RlBQbVFNdko4WG52L1ZwRWZHYkFLZ2dDT1hDcU1rcUVPSmtpOWZ2?=
 =?utf-8?B?cjFuSWhEZ0RlNzJvandxWVZreEVETTRsWmhhR0JtRmpvUkFTeC9sa0NjWUlt?=
 =?utf-8?B?M1Y5bnZ6ZkRvT0dzQ0tLR2ZGMmo3VmpEdUFZenFETHhyQmRkOUs2MEpheGo0?=
 =?utf-8?B?OUFOamxvTVZyM1ZETkZITGFhNSsyTzJiL01RWjYvZHE5L0hqVS8rU1YxWjlY?=
 =?utf-8?B?SG5BeVdzT1lEemZTUU5YOExscllWSGNqQ2RyTElBQW1yTDBYMER1NkFhWnkx?=
 =?utf-8?B?K0VyQXV6Y092Y1l0R0o5QkwxUEJSa3owVEJjbmtKUGlWZVU1aXUwMzFPRlIw?=
 =?utf-8?B?YWoyVE5zcWN6azFqOWJFSFl0b3labFBFaVVqR3hZN0tML0R5NWQ2Zjh6ZGsv?=
 =?utf-8?B?QnNqSGhQcXFkd2p3dXBac3ljY2pLTXZmOWltenlOUGd6TDdsaFFqQVZ1T3g0?=
 =?utf-8?B?YjIwaXBxKzNrbXJvaGFqMGpSNnl4aEp1RDN1MjJIa0ZsTVhyYVE2Q2VuYW93?=
 =?utf-8?B?T0h2Y1IvM1EyZVNKR083UDdUTVBGZHQ2YnhHV1hFd2hYMmNNUkYzMWo0cjVv?=
 =?utf-8?B?VWFQVUJWRDl4WUd5YjkvZ1dnY0wvd1JpL0NxL2JFM3VYbTJkSDlWRmxPTkkx?=
 =?utf-8?B?Wnh6Z2xyaXdvSTBxV2FCSGtIK0haenpFOHNPOXBnNGNoRG4zcDFLOEplU3Zu?=
 =?utf-8?B?RWR0SGFsZkNyZjJrNVdpdEYxT09qRjJGQ3BybWpoeThqa1VCMEZsaWtTMWdD?=
 =?utf-8?B?QTdWMHFVb2t0KzFMY0xDM0hiWHZSOVV4NGhTZGMzRnhSb1ZqUWMrWmozUHlH?=
 =?utf-8?B?RndCai9wZHB3aXl3N1ZsTFFMQytOQWJ6VVdlN1JMMDRtLzQ2WXlkZnNYRjFt?=
 =?utf-8?B?TUhqZnBTR3BIQkNNZGREZUl4NjlMV21xR3RpWG1yWlZCSFdKZDYzdDhlNjRN?=
 =?utf-8?B?c0RJVFVQQjZNOWZDU3B0L1V1NEp5dVIvK0dlWEp5NjVoQWxLTWh1ajExbGxj?=
 =?utf-8?B?RTFKai9pYm9zbVEwc2svNVdzbmYwWHkxblBPS2xYUy93Q3hoZ2NMdGxLdldo?=
 =?utf-8?B?UTQ5bTNkZzNoU1hNYXVhYUViRGhIWjM5ZWdBUWdGdjd6UVhjN2o4RFEwLzhW?=
 =?utf-8?B?WkRXd0M0TlVIVTVQWWZjQTdFYjN4ZkhkOVdzRGM2QU11Qytma0gvbjBXWTBt?=
 =?utf-8?B?Rnp0bFFoOUcxcjYyRUdXdXl2ZmxmaU5pUS9GMFlrN08xeWkvVzdCblVvbmVs?=
 =?utf-8?B?c3VOWWlMZE1iWlpxSXBHM1NQWjg0bXZWSlRTZlRoVXZlQmVuSlF6V3pYS0FS?=
 =?utf-8?B?b1UwS0NlRW51RC9ERForR1BCaVV1MFJPb1hCWGwycEpMZ0o5SEVzajNQckRh?=
 =?utf-8?Q?jNYH4lb2Fta+loFqjJ2/42+0KUWDGBwf2bS2Kul?=
X-OriginatorOrg: sct-15-20-7741-18-msonline-outlook-c907d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 10871895-a845-4524-302d-08dd8f34cd0e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB3722.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 20:05:10.1761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5410
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

On Fri, May 09, 2025 at 05:31:40PM +0100, Andre Przywara wrote:
> On Fri, 9 May 2025 23:29:50 +0900
> Chen-Yu Tsai <wens@csie.org> wrote:
> 
> > On Fri, May 9, 2025 at 11:14 PM Andre Przywara <andre.przywara@arm.com> wrote:
> > >
> > > On Wed,  7 May 2025 15:19:21 -0500
> > > Chris Morgan <macroalpha82@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > despite the slightly ill fate of this series, I was wondering if we could
> > > get the non-controversial clock parts for instance already merged, to
> > > reduce the number of patches and mitigate the churn with dependencies?  
> > 
> > Sure. Are we expecting any of the DT bits to go in this cycle?
> > If not I won't have to split the DT header patch on a separate
> > branch.
> 
> I don't think so, the DT wouldn't make much sense on its own anyway. But
> I guess it would help if the bindings / binding headers would go in
> already?
> 
> Cheers,
> Andre

I erred in combining everything into a large patch series, so I'm going
to resubmit with things broken out by subsystem/in-order. Do you just
want me to resubmit these two patches by themselves or can you take
them now since they're the first 2? I won't need them until I add the
LCD bindings into the sun50i-h616.dtsi file which will be towards the
end of the commit chain.

Thank you,
Chris.

> 
> > 
> > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > >
> > > > Add the required LVDS reset for the LCD TCON. Note that while this
> > > > reset is exposed for the T507, H616, and H700 only the H700 has
> > > > an LCD controller.
> > > >
> > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > Signed-off-by: Ryan Walklin <ryan@testtoast.com>  
> > >
> > > Matches the T507 manual:
> > >
> > > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> > >
> > > Cheers,
> > > Andre
> > >  
> > > > ---
> > > >  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > > > index daa462c7d477..955c614830fa 100644
> > > > --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > > > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > > > @@ -1094,6 +1094,7 @@ static const struct ccu_reset_map sun50i_h616_ccu_resets[] = {
> > > >       [RST_BUS_TCON_LCD1]     = { 0xb7c, BIT(17) },
> > > >       [RST_BUS_TCON_TV0]      = { 0xb9c, BIT(16) },
> > > >       [RST_BUS_TCON_TV1]      = { 0xb9c, BIT(17) },
> > > > +     [RST_BUS_LVDS]          = { 0xbac, BIT(16) },
> > > >       [RST_BUS_TVE_TOP]       = { 0xbbc, BIT(16) },
> > > >       [RST_BUS_TVE0]          = { 0xbbc, BIT(17) },
> > > >       [RST_BUS_HDCP]          = { 0xc4c, BIT(16) },  
> > >
> > >  
> > 
> 
