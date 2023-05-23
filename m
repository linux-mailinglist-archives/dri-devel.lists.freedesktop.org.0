Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5351D70F04F
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 10:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FD810E5AA;
	Wed, 24 May 2023 08:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10olkn2090.outbound.protection.outlook.com [40.92.41.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8827410E4E1;
 Tue, 23 May 2023 21:12:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMnLRBp8oOgdeZvRyp2ryr3xVCP5MD1q6NSB6yNV/JaJ6XbJ6IsfxEdBlKEgi5zMvbejWz0/G8Sx11bO+njKkLdiO/ruEdCRgyJiTXTZXMl03YC2LnfovcAImbibzUgPmoi58tBCPOoiCSehs5DOj/P4RQyDfv/HwTCRj91KKIjxyR/UwkFxInCT19NkaF4nHq6U1vw9voq5KGZ3OlxzFp3b84coqjtFBtdO94KBhU2Ve1rWkGiKrHpBedjWm/sjjP263ZccxptgpqHeINLRk6T/c+awOxUpVeFMC1o11qsypc6mXnYZSpl9D7W1YlAiXxVMu1hRPkMO3t4DeTzEGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUxcTmJUaBXzpXnDydliWooLq+rLUv4CigGkpq0KsV8=;
 b=DwT0OdtEUig5q41FqW5vjUYhFhh6HY1KQqOrYXK+9/DfwxM8A9Na5/xanJcEg/Fn+oE+yfy8fLahKWK/vxxiq660EsSxqqG2vtnEDY4bm5jblCkEW8TprbsA4uHAMIoMQro40qLeIpNFxgaYDoSD2ciAWMFxYDSAjwPqGQZ/SThmGFelcI78yFbiGKWxychqI62ZwfGEfHlYSqe9mzi70BmzeZxg5Rnj0xG5rdVqOsFyd5PtmUFh2+JcUJbvwMyJZlSQM2hWHE1MwlNoIkrseuPM6+hTDGxWr9QowNk2udSUoxDXCzB0VehT1OBW+upmK5WCL1NiCohyGQhSOl2+vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUxcTmJUaBXzpXnDydliWooLq+rLUv4CigGkpq0KsV8=;
 b=kHF4fW3ttlWTekGone97xnnEJipEaoziLYJGINSx6bxCCxs7O+IpJcm1KIRtTL6EWm+rJ4IgY0ibcLKJovvoM4DKXxLrUdljRkx4yh0NDwxPhmvScfOffnCcK094u97KQfi9KRWmm2LDK3R0edsX8Ur6f99TNzFtus+N+zwd45LA0zA4vJFUYdJNh8eo12tgsgiZVTG8mejcZUVk924X+eW1i/oZUDJAQCYcAa7tHVFKyIn7fkpj99w4OUvBOY3nMa4LwJxbqlnkW+mL16TYtqh+r7+S1mlOay8Zl1ElqzUxjx7gTEjBcV10KNNRQNatjFZyEml7nDRtt0rdqe1Iig==
Received: from DM6PR19MB2780.namprd19.prod.outlook.com (2603:10b6:5:13d::26)
 by PH0PR19MB5393.namprd19.prod.outlook.com (2603:10b6:510:f7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Tue, 23 May
 2023 21:12:23 +0000
Received: from DM6PR19MB2780.namprd19.prod.outlook.com
 ([fe80::c62c:7fe7:679d:6a42]) by DM6PR19MB2780.namprd19.prod.outlook.com
 ([fe80::c62c:7fe7:679d:6a42%4]) with mapi id 15.20.6433.013; Tue, 23 May 2023
 21:12:23 +0000
From: Ratchanan Srirattanamet <peathot@hotmail.com>
To: bskeggs@redhat.com,
	kherbst@redhat.com,
	lyude@redhat.com
Subject: [PATCH v2] drm/nouveau: don't detect DSM for non-NVIDIA device
Date: Wed, 24 May 2023 04:11:56 +0700
Message-ID: <DM6PR19MB2780805D4BE1E3F9B3AC96D0BC409@DM6PR19MB2780.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [FTxgRrLrYKratkIP9pifR9sKNilwsgSM]
X-ClientProxiedBy: KL1PR01CA0130.apcprd01.prod.exchangelabs.com
 (2603:1096:820:4::22) To DM6PR19MB2780.namprd19.prod.outlook.com
 (2603:10b6:5:13d::26)
X-Microsoft-Original-Message-ID: <20230523211157.172690-1-peathot@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR19MB2780:EE_|PH0PR19MB5393:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e7009a-fab4-42af-a126-08db5bd2669e
X-MS-Exchange-SLBlob-MailProps: RlF2DIMZ1qVAUsDmK8fO6Ka0vPjOlLKW1oyG62vcje7qq7Seay+afcD7XOT9gmEsyY9Cz/dDaM90LpYqEx1kLOmilNCtxi6sU6CjE5yRXdMsAaSOMH+qLyCq8vFw0tawnCexDM83+ZcO1/2VZYlMck67ACowttA2aogOKKv1AiTVg+OwRaVHMGtxKqj1XoMD1LWWo0NChAIEGOSSSlgaugLLVXu0mhCpg9Cb43kNybjXdrrorfZisX0fP87daZKY9qGkJwCAX4PeTdmGfpLW5MDccHhSzkPhAeXoCQqNImXiuYU297zczFx5Ei1cV4MO2qdLqe7QGEQn/PlzIyF0cROLOjRpgCCBzzV+yYYL5n+yn0UiXoYR2zbmJmN2ZCYtbdWDMaJi1xRqoeOoKR0tyd6uOW73mlfiH4q4lPtd8iKuP9TJNyzWFClNY5RuOvWSniyRkgMEjwNV9ES9i5xFp5f/VakO9GGNYvvZZiETpjMBvkvNTPRbSTZiZWzsAr99Y1zOnvy+WNpjJIK6ox/y8dFybpL3e0o3JVH6D71rqTLeXJyl17lB7KerUadOt/s09K3MKH+ym9/5MOSy7rLblf8t28IYVBu3ZWvks0+sAd3NWkXNUi9DBuCT84gODYe8aVegFXtD5oO1o3bmIxYBfuu+ReBRNzPFRIArsMG2noaAYDem7F5+75LqJzQuchcK5+QR/K82PYh9NxAZ1cWQcbg1FJZs5TZ+8nyexaPz94tfA9uwm5XsTBKKX+0ZGrhCRBgqyFSsvMP0mz6tyFf4+ea0BHQ8CzUb6uTtahHHg104Gqr5IIy7uEvy8GCNqqNPN1pOfLx2gSh5kHJarjxu02KnTAT+F30G
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EBzfragMI/VHLPzPQRQMDINZQgmljYek9SAj/2a/FERqtlNepCnzY278HhJ/8GkX+CKIifcJpDoGI4f6eMGZtFJOQZyeHL0/4afGs194h8bI9uSQTW8fmn7xYzaz7F7p0aMp6g6hacOrfdxtLt+id6oZbiZcJ9mA9inIR7v/pbW6seTHlvsZiDe9HjQuNOdjyRNgVLMGfOwoplA0G89XFWwlk68ci9ANSqLoncbdwyfRAqBY/3sJtGwWUUA51txvR0sOAubvobEZ9KnXWsk3Wx2dhFza5pHvVIxeZvLOw7iBR8DjsjlmhGh5tXa8PUvVMrqm108MZWwHSEB4VEhx0YwyAWFqjpWtRmqndW90lhjCSAWl436zP9wdW0rYmYG8dmyINBgbsJOAhFrzlf3fc/eSuIiuqhl6sIxNRtRW8PHfs9EJENFE2pVSZ+FQXCBRbBtCtxW7lwjJ+kHtyEZDu/XROI0Pthqbh0r8xF1v1uXdq06pP2W9IkRBR5A2iorvgE7uOGzRWO01WYD4+vFyLZEt/0Vh91AqUZPBFPW+atci3PSU1hoQKRFGPpZAUuH+
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WOS7ey/geh3bpGio7Z2hjIH6m7xzMvC6ZWS983sXQ6fcEQsmKpncZuiWDGwf?=
 =?us-ascii?Q?PuQCyq29DFMbkg6eCR+JkNchI7e6S9LHpw0FUfYDcjFdOmYiX89WUNPWJQRx?=
 =?us-ascii?Q?y71Tvx+ZRcVNRfA885Ydy3Ibb2IgO2+6e8Aia/UXbbqVJxFlNT/kJYc4pvJ6?=
 =?us-ascii?Q?YW3p2Pezkr3rVdxJ6t7j9+Ph36at+/8ibvMboVGmA4ei13UyGF2srUzpyMub?=
 =?us-ascii?Q?OVBWqTiMszxcUcYKP3xjW09LVGIopu5xEdUAcCqNXPxopMU2qilzIyWJIGF9?=
 =?us-ascii?Q?5VLKizcpUkod+akWNcCKIc/TuoKCDJ/9oOF/yHHNX0GhGUThiUTvzUAYtBMQ?=
 =?us-ascii?Q?OvVZcL7ZUMaSw0/TA79xTH3n/HCL7FoG47b9zbtWf61wsWmrVZTXwHfFiKSI?=
 =?us-ascii?Q?3DENiddemye/lS5wI/2HbIal94S+E2tN5sE8jJQX4eK4Pl+udPei5YyO2w/8?=
 =?us-ascii?Q?I6bay0lfeo7fuGkYGbdfertvKqO2kyB7uoO11kGbE3Tj51HpMXmYc/iyE8b/?=
 =?us-ascii?Q?7LAIBb0xsFgOk73Ejjv+Q6xZkrAiG1iVYbKuxfITwiCBj/+B8ZzFW322ELBg?=
 =?us-ascii?Q?umEtFCmhcRW4NP08653FSpqrGqY3dktJ5JX2+xy/nUIGHGWn45c8TjasJv9V?=
 =?us-ascii?Q?eUh+EGBUSuYLkn61+gDV6g4vKP59yNtaB7HHpW8F9Dsz1mW6jDsRpISwG1H6?=
 =?us-ascii?Q?MA0ROzJj6Gotrnaae+gaDH6chHbucq/xNtqfxNaIY3VhpYlBk6uscN5TMDLh?=
 =?us-ascii?Q?dqqw4ZeKjaJ2dt17dR5AbG+0/ZXcN9QVaIJWTEso32VgyyFBQ+zLZaW6MbUi?=
 =?us-ascii?Q?bTORqOIrLC2t+aGY/H5hxWBB37QX18sd1qy3GUzq5LgCx5pgwcgI7kRNIQpN?=
 =?us-ascii?Q?29qsvKw45GfX/rU2dlg8xnSaHS7muwt7F7JU6LskMMUMUL0I2dWofKEwwI+V?=
 =?us-ascii?Q?AaAevWsppGD8oA9OawBDaBDSRcR9raBds2ZcWEzNHWcq6fvL5nhJ8y26IFRq?=
 =?us-ascii?Q?rC2ZOnv2xmyrY/pjE5gsXEVHXrrw3v92n1ZHaGsdArDU2zhjobEOJw1izbhE?=
 =?us-ascii?Q?4lf6eo6TaPaYnTlhJK81y5HO9kxbff44Kloaz/8q57kz3rXRb0rDq2440TB3?=
 =?us-ascii?Q?cwf3W2E31++OKffM/fKtCR6ywInrB5CaUIznuiJYrhNdyKO5RF8OHLnGBiW4?=
 =?us-ascii?Q?kn+dhnIPsvpTUkqcT/t5hfs8aoWYf3vUzn1Auw=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-e7757.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e7009a-fab4-42af-a126-08db5bd2669e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2780.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 21:12:23.3669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5393
X-Mailman-Approved-At: Wed, 24 May 2023 08:10:24 +0000
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
Cc: nouveau@lists.freedesktop.org,
 Ratchanan Srirattanamet <peathot@hotmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The call site of nouveau_dsm_pci_probe() uses single set of output
variables for all invocations. So, we must not write anything to them
unless it's an NVIDIA device. Otherwise, if we are called with another
device after the NVIDIA device, we'll clober the result of the NVIDIA
device.

For example, if the other device doesn't have _PR3 resources, the
detection later would miss the presence of power resource support, and
the rest of the code will keep using Optimus DSM, breaking power
management for that machine.

Also, because we're detecting NVIDIA's DSM, it doesn't make sense to run
this detection on a non-NVIDIA device anyway. Thus, check at the
beginning of the detection code if this is an NVIDIA card, and just
return if it isn't.

This, together with commit d22915d22ded ("drm/nouveau/devinit/tu102-:
wait for GFW_BOOT_PROGRESS == COMPLETED") developed independently and
landed earlier, fixes runtime power management of the NVIDIA card in
Lenovo Legion 5-15ARH05. Without this patch, the GPU resumption code
will "timeout", sometimes hanging userspace.

As a bonus, we'll also stop preventing _PR3 usage from the bridge for
unrelated devices, which is always nice, I guess.

Signed-off-by: Ratchanan Srirattanamet <peathot@hotmail.com>
Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/79
---
V1 -> V2:
- Update the changelog to indicate that it now actually fixes the issue.
- Add 'Closes:' tag.

 drivers/gpu/drm/nouveau/nouveau_acpi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
index 8cf096f841a9..a2ae8c21e4dc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -220,6 +220,9 @@ static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out
 	int optimus_funcs;
 	struct pci_dev *parent_pdev;
 
+	if (pdev->vendor != PCI_VENDOR_ID_NVIDIA)
+		return;
+
 	*has_pr3 = false;
 	parent_pdev = pci_upstream_bridge(pdev);
 	if (parent_pdev) {

base-commit: 5fe326b4467689ef3690491ee2ad25ff4d81fe59
-- 
2.34.1

