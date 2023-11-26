Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAF67F91DC
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 09:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB6E10E09C;
	Sun, 26 Nov 2023 08:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 902 seconds by postgrey-1.36 at gabe;
 Sun, 26 Nov 2023 08:44:31 UTC
Received: from fallback2.i.mail.ru (fallback2.i.mail.ru [79.137.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF9210E09C
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 08:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=e85JpFtBhEieake7ACfhBz6GFdOuCCY9z4pKZE8lbxY=; 
 t=1700988271;x=1701078271; 
 b=YGMMj0ozntFvIT5kCKwRRplQ0FE+L2zAYKt8sjpkNWOyU0e7IQG8dUVQuaObPAaAykyqtUF73r4RuAwnoDC0Rx+JZtyUN4WcAIIFkB5avVhYP3+B4yucfoWRhQllHeZK7Ys4loSG5JzPalqwVPQ55q2pcfVYOFsXntaWT9L9q3tucQoMfRA6Xylm9dMw90SV1Wqc50kXGk3O8cj7RPEM5gX8v31TBBAIsJPE0k9dl1FpZuSNQ8vOIPQ6/ZILzhCAPqZIbzpLdiR20lOqbJC9amayxeBHOY4AYazu5QNJp6u1Z1rDrcZGPLURH97K1DjgHDMPqRDsBBeKn1lZx250mw==;
Received: from [10.12.4.6] (port=34002 helo=smtp32.i.mail.ru)
 by fallback2.i.mail.ru with esmtp (envelope-from <listdansp@mail.ru>)
 id 1r7AW7-00FnY0-Gd; Sun, 26 Nov 2023 11:29:27 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=e85JpFtBhEieake7ACfhBz6GFdOuCCY9z4pKZE8lbxY=; t=1700987367; x=1701077367; 
 b=KEqnEvRtNLurzNBcGjDQ0Z4m+2cW928Q4xRXuEzCsOlYo7rJVKTvLt9AihuzuOvNwFMwFGuKFN+
 nilt/aS6K+s40wDeQmaIIqIhtbfAp4ZM5JDCOW25YfBNfz5la48R0RXxwo21yYB2NK+Vqz9Z063wf
 lGCq70bLP/bCLSEJjXnazqsC/t9o3gZLfd+2epeUVIsngSUW5YRPYJUXaGzEnh2g5hLn6Hp3mEG/K
 VLKDHXPGXD4zTxsdG6lg8llTxys3tKIyalGdBi9C7oFOe/0ubhnj6FhAjNnU/jtCRNr/EHhBd/lZL
 GvFespdgr7cM+/BWQ5IheypNucq+MAQc0f2Q==;
Received: by smtp32.i.mail.ru with esmtpa (envelope-from <listdansp@mail.ru>)
 id 1r7AW2-0057Ya-0G; Sun, 26 Nov 2023 11:29:22 +0300
From: Danila Chernetsov <listdansp@mail.ru>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH] drm/etnaviv: Added error handling for dma_map_sgtable.
Date: Sun, 26 Nov 2023 08:25:14 +0000
Message-Id: <20231126082514.1280691-1-listdansp@mail.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD91D46036009216274D998F1DA523E057E51CD64734745BA34182A05F538085040FDA7D19BC3436771803CC2C0AB6AE409AFBF09DCEC968CB601708587A242FE99
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78CB87876C5D626D4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006374B6C65B7367884A58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8B90552982851164F6EE67ED84304FDD36F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74A95F4E53E8DCE969FA2833FD35BB23D9E625A9149C048EE140C956E756FBB7A618001F51B5FD3F9D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B1F8789D36234D406A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCDA6627639FE78A613AA81AA40904B5D9CF19DD082D7633A0C84D3B47A649675F3AA81AA40904B5D98AA50765F7900637254CDB394D352967D81D268191BDAD3D3666184CF4C3C14F3FC91FA280E0CE3D1A620F70A64A45A98AA50765F79006370669898C38A383F16D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F79006378869069EDD29A933EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A52FC688EC7694DBE3816B9265519B5E72AAEAD3CD0A4397B6F87CCE6106E1FC07E67D4AC08A07B9B065B78C30F681404D9C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A09062BEEFFB5F8EA3ECB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF8D400B3E106E459E379A3D98D4991F22004A0655FF9C229C9B858297C06BB03325059624982F74612A47D1427BC164A7CDAE61339343FF3421E359B3C1B80CAA7188EE918FF98BD002C26D483E81D6BE1622D42B0D48DA1897021655C84034CFF0A6D2C91ED28CB6
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojx8u5BAB4+UbsPLCf082BzA==
X-Mailru-Sender: 4CE1109FD677D2770147F6A9E21DCA7BA56300D452E90CA6B242AB67B5024054C7E03CBB0AFC61597E3C9C7AF06D9E7B78274A4A9E9E44FD3C3897ABF9FF211DE8284E426C7B2D9A5FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4C775F1C6D245C3DBEF3B72CC77BFA4D3506B824ED1757C9E049FFFDB7839CE9E6052671F2709A8FA047A7D292C31ADD792610A878C08DCD9868F177C7E802336
X-7FA49CB5: 0D63561A33F958A5D7862438F88EFD84B70E823BAFE2C321CAE9D43F7A0EC123CACD7DF95DA8FC8BD5E8D9A59859A8B6A096F61ED9298604
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFdjNtV51DQSTDZzzjByqqzMw==
X-Mailru-MI: C000000000000800
X-Mras: Ok
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danila Chernetsov <listdansp@mail.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Added error handling for dma_map_sgtable.
If an error occurs, the sgt table is freed.

Found by Linux Verification Center (linuxtesting.org) with static
analysis tool SVACE.

Fixes: 182354a526a0 ("drm: etnaviv: fix common struct sg_table related issues")
Signed-off-by: Danila Chernetsov <listdansp@mail.ru>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index b5f73502e3dd..59d1684dafc4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -17,7 +17,7 @@
 static struct lock_class_key etnaviv_shm_lock_class;
 static struct lock_class_key etnaviv_userptr_lock_class;
 
-static void etnaviv_gem_scatter_map(struct etnaviv_gem_object *etnaviv_obj)
+static int etnaviv_gem_scatter_map(struct etnaviv_gem_object *etnaviv_obj)
 {
 	struct drm_device *dev = etnaviv_obj->base.dev;
 	struct sg_table *sgt = etnaviv_obj->sgt;
@@ -27,7 +27,9 @@ static void etnaviv_gem_scatter_map(struct etnaviv_gem_object *etnaviv_obj)
 	 * because display controller, GPU, etc. are not coherent.
 	 */
 	if (etnaviv_obj->flags & ETNA_BO_CACHE_MASK)
-		dma_map_sgtable(dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+		return dma_map_sgtable(dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+
+	return 0;
 }
 
 static void etnaviv_gem_scatterlist_unmap(struct etnaviv_gem_object *etnaviv_obj)
@@ -113,7 +115,13 @@ struct page **etnaviv_gem_get_pages(struct etnaviv_gem_object *etnaviv_obj)
 
 		etnaviv_obj->sgt = sgt;
 
-		etnaviv_gem_scatter_map(etnaviv_obj);
+		ret = etnaviv_gem_scatter_map(etnaviv_obj);
+		if (ret < 0) {
+			sg_free_table(etnaviv_obj->sgt);
+			kfree(etnaviv_obj->sgt);
+			etnaviv_obj->sgt = NULL;
+			return ERR_PTR(ret);
+		}
 	}
 
 	return etnaviv_obj->pages;
-- 
2.25.1

